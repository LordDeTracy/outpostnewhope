using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace ResourceExtractor
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length < 1)
            {
                Console.WriteLine("Usage: ResourceExtractor.exe <RESOURCE.000> [output_dir]");
                return;
            }
            string arcPath = args[0];
            string outDir = args.Length > 1 ? args[1] : Path.Combine(Path.GetDirectoryName(arcPath), "extracted");

            var extractor = new PkUnzip(arcPath);
            Directory.CreateDirectory(outDir);
            foreach (var info in extractor.Headers)
            {
                try
                {
                    var data = extractor.Unzip(info);
                    File.WriteAllBytes(Path.Combine(outDir, info.Name), data);
                    Console.WriteLine($"OK  {info.Name} ({data.Length} bytes)");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"FAIL {info.Name}: {ex.Message}");
                }
            }
            Console.WriteLine("Done.");
        }
    }

    class HeaderInfo
    {
        public string Name;
        public int Size;
        public int Unk1;
        public int Unk2;
        public byte[] CompressedData;
    }

    class PkUnzip
    {
        public HeaderInfo[] Headers { get; private set; }

        public PkUnzip(string archive)
        {
            using (var stream = File.OpenRead(archive))
            {
                stream.Seek(6, SeekOrigin.Current);
                var headers = new List<HeaderInfo>();
                while (true)
                {
                    var header = new byte[0x1a];
                    stream.Read(header, 0, header.Length);
                    if (header[3] != '1') throw new Exception("Invalid entry marker");
                    var info = new HeaderInfo();
                    int index = 4;
                    var nameBuilder = new StringBuilder();
                    while (header[index] != 0)
                    {
                        nameBuilder.Append((char)header[index]);
                        index++;
                    }
                    info.Name = nameBuilder.ToString();
                    if (info.Name == "THE_END") break;
                    info.Size = BitConverter.ToInt32(header, 0x12);
                    info.Unk1 = BitConverter.ToInt16(header, 0x16);
                    info.Unk2 = BitConverter.ToInt16(header, 0x18);
                    headers.Add(info);
                }
                foreach (var info in headers)
                {
                    info.CompressedData = new byte[info.Size];
                    stream.Read(info.CompressedData, 0, info.Size);
                }
                Headers = headers.ToArray();
            }
        }

        public byte[] Unzip(HeaderInfo info)
        {
            return UnzipInternal(info.CompressedData);
        }

        // ---- PKWare DCL Implosion decoder (ported from disassembly) ----
        int _field0, _field2, _field4, _field6, _field8, _fieldA, _fieldC;
        int _readPos, _actualRead;
        byte[] _field1a, _field101a, _readBuf;
        byte[] _field2C1E, _field2D1E, _field2E1E, _field2E9E, _field2F9E;
        byte[] _field2B1E, _field309E, _field30DE, _field30EE, _field2A1E;
        int[] _field30FE;
        byte[] _outData;

        static readonly byte[] Byte3167 = {
            2,4,4,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,
            7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
        };
        static readonly byte[] Byte31A7 = {
            3,0xD,5,0x19,9,0x11,1,0x3E,0x1E,0x2E,0x0E,0x36,0x16,0x26,6,0x3A,
            0x1A,0x2A,0x0A,0x32,0x12,0x22,0x42,2,0x7C,0x3C,0x5C,0x1C,0x6C,0x2C,0x4C,0x0C,
            0x74,0x34,0x54,0x14,0x64,0x24,0x44,4,0x78,0x38,0x58,0x18,0x68,0x28,0x48,8,
            0x0F0,0x70,0x0B0,0x30,0x0D0,0x50,0x90,0x10,0x0E0,0x60,0x0A0,0x20,0x0C0,0x40,0x80,0
        };
        static readonly byte[] Byte3217 = { 3,2,3,3,4,4,4,5,5,5,5,6,6,6,7,7 };
        static readonly byte[] Byte3227 = { 5,3,1,6,0xA,2,0xC,0x14,4,0x18,8,0x30,0x10,0x20,0x40,0 };
        static readonly byte[] Byte31E7 = { 0,0,0,0,0,0,0,0,1,2,3,4,5,6,7,8 };
        static readonly int[] Byte31F7 = { 0,1,2,3,4,5,6,7,8,0xA,0xE,0x16,0x26,0x46,0x86,0x106 };
        static readonly byte[] Byte3237 = {
            0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x8,0x7,0x0C,0x0C,0x7,0x0C,0x0C,
            0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0C,0x0C,0x0C,0x0C,0x0C,
            0x4,0x0A,0x8,0x0C,0x0A,0x0C,0x0A,0x8,0x7,0x7,0x8,0x9,0x7,0x6,0x7,0x8,
            0x7,0x6,0x7,0x7,0x7,0x7,0x8,0x7,0x7,0x8,0x8,0x0C,0x0B,0x7,0x9,0x0B,
            0x0C,0x6,0x7,0x6,0x6,0x5,0x7,0x8,0x8,0x6,0x0B,0x9,0x6,0x7,0x6,0x6,
            0x7,0x0B,0x6,0x6,0x6,0x7,0x9,0x8,0x9,0x9,0x0B,0x8,0x0B,0x9,0x0C,0x8,
            0x0C,0x5,0x6,0x6,0x6,0x5,0x6,0x6,0x6,0x5,0x0B,0x7,0x5,0x6,0x5,0x5,
            0x6,0x0A,0x5,0x5,0x5,0x5,0x8,0x7,0x8,0x8,0x0A,0x0B,0x0B,0x0C,0x0C,0x0C,
            0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,
            0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,
            0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,
            0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,
            0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,
            0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,
            0x0D,0x0C,0x0D,0x0D,0x0D,0x0C,0x0D,0x0D,0x0D,0x0C,0x0D,0x0D,0x0D,0x0D,0x0C,0x0D,
            0x0D,0x0D,0x0C,0x0C,0x0C,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D
        };
        static readonly int[] Word3337 = {
            0x490,0x0FE0,0x7E0,0x0BE0,0x3E0,0x0DE0,0x5E0,0x9E0,0x1E0,0x0B8,0x62,0x0EE0,0x6E0,0x22,0x0AE0,0x2E0,
            0x0CE0,0x4E0,0x8E0,0x0E0,0x0F60,0x760,0x0B60,0x360,0x0D60,0x560,0x1240,0x960,0x160,0x0E60,0x660,0x0A60,
            0x0F,0x250,0x38,0x260,0x50,0x0C60,0x390,0x0D8,0x42,0x2,0x58,0x1B0,0x7C,0x29,0x3C,0x98,
            0x5C,0x9,0x1C,0x6C,0x2C,0x4C,0x18,0x0C,0x74,0x0E8,0x68,0x460,0x90,0x34,0x0B0,0x710,
            0x860,0x31,0x54,0x11,0x21,0x17,0x14,0x0A8,0x28,0x1,0x310,0x130,0x3E,0x64,0x1E,0x2E,
            0x24,0x510,0x0E,0x36,0x16,0x44,0x30,0x0C8,0x1D0,0x0D0,0x110,0x48,0x610,0x150,0x60,0x88,
            0x0FA0,0x7,26,0x6,0x3A,0x1B,0x1A,0x2A,0x0A,0x0B,0x210,0x4,0x13,0x32,0x3,0x1D,
            0x12,0x190,0x0D,0x15,0x5,0x19,0x8,0x78,0x0F0,0x70,0x290,0x410,0x10,0x7A0,0x0BA0,0x3A0,
            0x240,0x1C40,0x0C40,0x1440,0x440,0x1840,0x840,0x1040,0x40,0x1F80,0x0F80,0x1780,0x780,0x1B80,0x0B80,0x1380,
            0x380,0x1D80,0x0D80,0x1580,0x580,0x1980,0x980,0x1180,0x180,0x1E80,0x0E80,0x1680,0x680,0x1A80,0x0A80,0x1280,
            0x280,0x1C80,0x0C80,0x1480,0x480,0x1880,0x880,0x1080,0x80,0x1F00,0x0F00,0x1700,0x700,0x1B00,0x0B00,0x1300,
            0x0DA0,0x5A0,0x9A0,0x1A0,0x0EA0,0x6A0,0x0AA0,0x2A0,0x0CA0,0x4A0,0x8A0,0x0A0,0x0F20,0x720,0x0B20,0x320,
            0x0D20,0x520,0x920,0x120,0x0E20,0x620,0x0A20,0x220,0x0C20,0x420,0x820,0x20,0x0FC0,0x7C0,0x0BC0,0x3C0,
            0x0DC0,0x5C0,0x9C0,0x1C0,0x0EC0,0x6C0,0x0AC0,0x2C0,0x0CC0,0x4C0,0x8C0,0x0C0,0x0F40,0x740,0x0B40,0x340,
            0x300,0x0D40,0x1D00,0x0D00,0x1500,0x540,0x500,0x1900,0x900,0x940,0x1100,0x100,0x1E00,0x0E00,0x140,0x1600,
            0x600,0x1A00,0x0E40,0x640,0x0A40,0x0A00,0x1200,0x200,0x1C00,0x0C00,0x1400,0x400,0x1800,0x800,0x1000
        };

        byte[] UnzipInternal(byte[] cmpData)
        {
            _actualRead = cmpData.Length;
            _outData = null;
            if (_actualRead <= 4) return null;
            _field2 = cmpData[0];
            _fieldA = cmpData[2];
            _field6 = cmpData[1];
            _fieldC = 0;
            _readPos = 3;
            if (_field6 < 4 || _field6 > 6) return null;
            _field8 = 0xFFFF >> (16 - _field6);
            if (_field2 == 1)
            {
                _field2F9E = new byte[Byte3237.Length];
                Sub3CB0(0x100, Byte3237, _field2F9E);
                Sub4205();
            }
            else if (_field2 != 0) return null;
            _field30DE = new byte[Byte3217.Length];
            Sub3CB0(0x10, Byte3217, _field30DE);
            _field2B1E = new byte[256];
            Sub41CF(0x10, _field2B1E, Byte3227, _field30DE);
            _field30EE = new byte[Byte31E7.Length];
            Sub3CB0(0x10, Byte31E7, _field30EE);
            _field30FE = new int[Byte31F7.Length];
            Sub3CB0(0x10, Byte31F7, _field30FE);
            _field309E = new byte[Byte3167.Length];
            Sub3CB0(0x40, Byte3167, _field309E);
            _field2A1E = new byte[256];
            Sub41CF(0x40, _field2A1E, Byte31A7, _field309E);
            _readBuf = cmpData;
            _field1a = new byte[0x1000];
            _field101a = new byte[0x1800];
            if (Sub3EDB() != 0x306) return null;
            return _outData;
        }

        bool Sub414C(int cx)
        {
            if (_fieldC >= cx)
            {
                _fieldA >>= cx;
                _fieldC -= cx;
                return false;
            }
            _fieldA >>= _fieldC;
            if (_actualRead <= _readPos) { _actualRead = 0; return true; }
            _fieldA |= (_readBuf[_readPos] << 8);
            _readPos++;
            _fieldA >>= (cx - _fieldC);
            _fieldC = -(cx - _fieldC - 8);
            return false;
        }

        int Sub3FA6()
        {
            if ((_fieldA & 1) != 0)
            {
                if (Sub414C(1)) return 0x306;
                int di = _field2B1E[_fieldA & 0xFF];
                int bx = di;
                if (Sub414C(_field30DE[bx])) return 0x306;
                int cl = _field30EE[di];
                if (cl == 0) return di + 0x100;
                int si = (1 << cl) - 1;
                si &= _fieldA;
                si += _field30FE[di];
                if (Sub414C(cl)) return 0x306;
                return si + 0x100;
            }
            if (Sub414C(1)) return 0x306;
            if (_field2 == 0)
            {
                int di = _fieldA & 0xFF;
                if (Sub414C(8)) return 0x306;
                return di;
            }
            int d2 = 0;
            if (_fieldA != 0)
            {
                d2 = _field2C1E[_fieldA];
                if (d2 == 0xFF)
                {
                    if ((_fieldA & 0x3F) != 0)
                    {
                        if (Sub414C(4)) return 0x306;
                        d2 = _field2D1E[_fieldA];
                    }
                    else
                    {
                        if (Sub414C(6)) return 0x306;
                        d2 = _field2E1E[_fieldA & 0x7F];
                    }
                }
            }
            else
            {
                if (Sub414C(8)) return 0x306;
                d2 = _field2E9E[_fieldA];
            }
            int ax = _field2F9E[d2];
            if (Sub414C(ax)) return 0x306;
            return d2;
        }

        int Sub40E4(int di)
        {
            int si = _field2A1E[_fieldA & 0xFF];
            if (Sub414C(_field309E[si])) return 0;
            if (di == 2)
            {
                si = (si << 2) | (_fieldA & 3);
                if (Sub414C(di)) return 0;
                return si + 1;
            }
            si = (si << _field6) | (_field8 & _fieldA);
            if (Sub414C(_field6)) return 0;
            return si + 1;
        }

        int Sub3EDB()
        {
            _field4 = 0x1000;
            while (true)
            {
                int ax = Sub3FA6();
                if (ax >= 0x305) break;
                if (ax < 0x100)
                {
                    if (_field4 >= 0x1000)
                        _field101a[_field4 - 0x1000] = (byte)ax;
                    else
                        _field1a[_field4] = (byte)ax;
                    _field4++;
                }
                else
                {
                    ax -= 0xFE;
                    int di = ax;
                    ax = Sub40E4(di);
                    if (ax == 0) return 0x306;
                    int cx = di;
                    di = _field4;
                    int si = di - ax;
                    for (int i = 0; i < cx; i++)
                    {
                        byte tmp = (si + i) >= 0x1000 ? _field101a[si + i - 0x1000] : _field1a[si + i];
                        if (di + i >= 0x1000)
                            _field101a[di + i - 0x1000] = tmp;
                        else
                            _field1a[di + i] = tmp;
                    }
                    _field4 += cx;
                }
                if (_field4 >= 0x2000)
                {
                    if (_outData == null)
                    {
                        _outData = new byte[0x1000];
                        Array.Copy(_field101a, _outData, 0x1000);
                    }
                    else
                    {
                        var tmp = _outData;
                        _outData = new byte[tmp.Length + 0x1000];
                        Array.Copy(tmp, 0, _outData, 0, tmp.Length);
                        Array.Copy(_field101a, 0, _outData, tmp.Length, 0x1000);
                    }
                    Sub3CB0(0x1000, _field101a, _field1a);
                    for (int i = 0; i < _field101a.Length - 0x1000; i++)
                        _field101a[i] = _field101a[i + 0x1000];
                    _field4 -= 0x1000;
                }
            }
            if (_outData == null)
            {
                _outData = new byte[_field4 - 0x1000];
                Array.Copy(_field101a, 0, _outData, 0, _field4 - 0x1000);
            }
            else
            {
                var tmp = _outData;
                _outData = new byte[tmp.Length + _field4 - 0x1000];
                Array.Copy(tmp, _outData, tmp.Length);
                Array.Copy(_field101a, 0, _outData, tmp.Length, _field4 - 0x1000);
            }
            return 0;
        }

        void Sub3CB0(int ax, byte[] src, byte[] dst)
        {
            if (ax > 0) Array.Copy(src, dst, ax);
        }

        void Sub3CB0(int ax, int[] src, int[] dst)
        {
            if (ax > 0) Array.Copy(src, dst, ax);
        }

        void Sub41CF(int bx, byte[] di, byte[] si, byte[] dx)
        {
            bx--;
            do
            {
                int cl = dx[bx];
                int ax2 = 1 << cl;
                int bp = si[bx] & 0xFF;
                do { di[bp] = (byte)bx; bp += ax2; }
                while (bp <= 0xFF);
                bx--;
            } while (bx >= 0);
        }

        void Sub4205()
        {
            int dx = 0xFF;
            int bx = dx;
            _field2C1E = new byte[256];
            _field2D1E = new byte[256];
            _field2E1E = new byte[256];
            _field2E9E = new byte[256];
            do
            {
                int di = Word3337[dx];
                byte[] bp = _field2C1E;
                int cl = 0;
                int al = _field2F9E[bx];
                if (al > 8)
                {
                    if ((di & dx) != 0)
                    {
                        _field2C1E[di & dx] = (byte)dx;
                        cl = 4;
                        bp = _field2D1E;
                        if ((di & 0x3F) == 0) { cl = 6; bp = _field2E1E; dx = 0x7F; }
                    }
                    else { cl = 8; bp = _field2E9E; }
                }
                di >>= cl;
                al -= cl;
                _field2F9E[bx] = (byte)al;
                cl = al;
                al = 1 << cl;
                do { bp[di] = (byte)bx; di += al; }
                while (di <= dx);
                dx = 0xFF;
                bx--;
            } while (bx >= 0);
        }
    }
}