using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace MapViewer;

struct BmpInfo
{
    public string FileName;
    public int Width;
    public int Height;
    public short BitsPerPixel;
    public int FileSize;
    public int PaletteSize;
    public int ColorCount;
    public int RawPixelOffset;
    public byte[][] Palette;

    public string Dimensions => $"{Width}x{Height}";
    public string FileSizeStr => SizeFormat.Format(FileSize);
    public bool HasPalette => BitsPerPixel <= 8;
}

static class BmpReader
{
    public static BmpInfo Read(string path)
    {
        var info = new BmpInfo();
        info.FileName = Path.GetFileName(path);
        byte[] data = File.ReadAllBytes(path);
        info.FileSize = data.Length;

        if (data.Length < 54 || data[0] != 0x42 || data[1] != 0x4D)
            throw new InvalidDataException("Not a valid BMP file (missing BM signature)");

        info.RawPixelOffset = ReadI32(data, 10);
        info.Width = Math.Abs(ReadI32(data, 18));
        info.Height = Math.Abs(ReadI32(data, 22));
        info.BitsPerPixel = ReadI16(data, 28);
        int clrUsed = ReadI32(data, 46);

        if (info.BitsPerPixel <= 8)
        {
            info.PaletteSize = clrUsed > 0 ? clrUsed : 256;
            info.Palette = new byte[info.PaletteSize][];
            int palOffset = 54;
            int unique = 0;
            var seen = new HashSet<int>();
            for (int i = 0; i < info.PaletteSize && palOffset + 4 <= data.Length; i++)
            {
                byte b = data[palOffset];
                byte g = data[palOffset + 1];
                byte r = data[palOffset + 2];
                byte a = data[palOffset + 3];
                info.Palette[i] = new byte[] { b, g, r, a };
                int key = (r << 16) | (g << 8) | b;
                if (seen.Add(key))
                    unique++;
                palOffset += 4;
            }
            info.ColorCount = unique;
        }
        else
        {
            info.PaletteSize = 0;
            info.Palette = null;
            info.ColorCount = 0;
        }

        return info;
    }

    internal static short ReadI16(byte[] data, int offset) =>
        (short)(data[offset] | (data[offset + 1] << 8));

    internal static int ReadI32(byte[] data, int offset) =>
        data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16) | (data[offset + 3] << 24);
}

static class SizeFormat
{
    public static string Format(long bytes) => bytes switch
    {
        < 1024 => $"{bytes} B",
        < 1024 * 1024 => $"{bytes / 1024.0:F1} KB",
        _ => $"{bytes / (1024.0 * 1024.0):F1} MB"
    };
}

class Program
{
    static void Main(string[] args)
    {
        if (args.Length == 0)
        {
            PrintUsage();
            return;
        }

        try
        {
            string bitmapDir = null;
            string outputPath = null;
            string mode = null;
            string modeArg = null;

            for (int i = 0; i < args.Length; i++)
            {
                switch (args[i])
                {
                    case "--terrain-index":
                        mode = "terrain";
                        modeArg = args.Length > i + 1 ? args[++i] : null;
                        break;
                    case "--planet-view":
                        mode = "planet";
                        break;
                    case "--building":
                        mode = "building";
                        modeArg = args.Length > i + 1 ? args[++i] : null;
                        break;
                    case "--catalog":
                        mode = "catalog";
                        break;
                    case "--output":
                        outputPath = args.Length > i + 1 ? args[++i] : null;
                        break;
                    default:
                        if (!args[i].StartsWith("--") && bitmapDir == null && Directory.Exists(args[i]))
                            bitmapDir = args[i];
                        break;
                }
            }

            if (bitmapDir == null)
            {
                string[] candidates = {
                    @"D:\Project Outpost\Outpost\BITMAPS",
                    @"..\..\..\..\Outpost\BITMAPS",
                    @"..\..\..\Outpost\BITMAPS",
                    @"..\..\Outpost\BITMAPS",
                    @"..\Outpost\BITMAPS",
                    @"Outpost\BITMAPS",
                };

                foreach (var c in candidates)
                {
                    string resolved = Path.GetFullPath(Path.Combine(Environment.CurrentDirectory, c));
                    if (Directory.Exists(resolved))
                    {
                        bitmapDir = resolved;
                        break;
                    }
                }
            }

            if (bitmapDir == null)
            {
                Console.Error.WriteLine("Error: Cannot find BITMAPS directory. Provide path as argument.");
                Environment.Exit(1);
            }

            if (!Directory.Exists(bitmapDir))
            {
                Console.Error.WriteLine($"Error: Directory not found: {bitmapDir}");
                Environment.Exit(1);
            }

            switch (mode)
            {
                case "terrain":
                    HandleTerrain(bitmapDir, modeArg, outputPath);
                    break;
                case "planet":
                    HandlePlanetView(bitmapDir, outputPath);
                    break;
                case "building":
                    HandleBuilding(bitmapDir, modeArg, outputPath);
                    break;
                case "catalog":
                    HandleCatalog(bitmapDir);
                    break;
                default:
                    PrintUsage();
                    break;
            }
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine($"Error: {ex.Message}");
            Environment.Exit(1);
        }
    }

    static void PrintUsage()
    {
        Console.WriteLine("MapViewer - Sierra Outpost Bitmap Viewer");
        Console.WriteLine();
        Console.WriteLine("Usage:");
        Console.WriteLine("  MapViewer --terrain-index N [bitmaps_dir] [--output path.png]");
        Console.WriteLine("  MapViewer --planet-view [bitmaps_dir] [--output path.png]");
        Console.WriteLine("  MapViewer --building <name> [bitmaps_dir]");
        Console.WriteLine("  MapViewer --catalog [bitmaps_dir]");
        Console.WriteLine();
        Console.WriteLine("Commands:");
        Console.WriteLine("  --terrain-index N   Display TILE{N}.BMP metadata");
        Console.WriteLine("  --planet-view       Display 480.BMP (planet surface) metadata");
        Console.WriteLine("  --building <name>   Search for building sprite by name");
        Console.WriteLine("  --catalog           Scan all BMPs and categorize by dimensions");
        Console.WriteLine("  --output <path>     Save parsed BMP as PNG (when applicable)");
        Console.WriteLine();
        Console.WriteLine("If bitmaps_dir is omitted, the tool searches common locations.");
    }

    static void PrintBmpInfo(BmpInfo info, string label = null)
    {
        if (label != null)
            Console.WriteLine($"=== {label} ===");
        Console.WriteLine($"  File:       {info.FileName}");
        Console.WriteLine($"  Dimensions: {info.Dimensions}");
        Console.WriteLine($"  Bit depth:  {info.BitsPerPixel}-bit");
        Console.WriteLine($"  File size:  {info.FileSizeStr}");
        if (info.HasPalette)
        {
            Console.WriteLine($"  Palette:    {info.PaletteSize} entries, {info.ColorCount} unique colors");
            if (info.Palette != null && info.ColorCount <= 32)
            {
                Console.WriteLine($"  Colors:");
                for (int i = 0; i < info.PaletteSize; i++)
                {
                    if (i < info.Palette.Length)
                    {
                        byte r = info.Palette[i][2];
                        byte g = info.Palette[i][1];
                        byte b = info.Palette[i][0];
                        Console.WriteLine($"    [{i,3}] RGB({r,3},{g,3},{b,3})");
                    }
                }
            }
        }
        Console.WriteLine($"  Pixel off:  {info.RawPixelOffset} (0x{info.RawPixelOffset:X})");
        Console.WriteLine();
    }

    static void HandleTerrain(string bitmapDir, string indexArg, string outputPath)
    {
        if (indexArg == null || !int.TryParse(indexArg, out var index))
        {
            Console.Error.WriteLine("Error: --terrain-index requires a numeric argument (1-6)");
            return;
        }

        string path = Path.Combine(bitmapDir, $"TILE{index}.BMP");
        if (!File.Exists(path))
        {
            Console.Error.WriteLine($"Error: TILE{index}.BMP not found in {bitmapDir}");
            Console.Error.WriteLine($"  Looked for: {path}");
            Environment.Exit(1);
        }

        BmpInfo info = BmpReader.Read(path);
        PrintBmpInfo(info, $"TILE{index}.BMP — Terrain Type {index}");

        TrySavePng(path, outputPath);
    }

    static void HandlePlanetView(string bitmapDir, string outputPath)
    {
        string path = Path.Combine(bitmapDir, "480.BMP");
        if (!File.Exists(path))
        {
            Console.Error.WriteLine($"Error: 480.BMP not found in {bitmapDir}");
            Environment.Exit(1);
        }

        BmpInfo info = BmpReader.Read(path);
        PrintBmpInfo(info, "480.BMP — Planet View");

        TrySavePng(path, outputPath);
    }

    static void HandleBuilding(string bitmapDir, string nameFilter, string outputPath)
    {
        if (string.IsNullOrEmpty(nameFilter))
        {
            Console.Error.WriteLine("Error: --building requires a name argument");
            Environment.Exit(1);
        }

        var files = Directory.GetFiles(bitmapDir, "*.bmp", SearchOption.TopDirectoryOnly)
            .Select(f => Path.GetFileNameWithoutExtension(f))
            .Where(f => f.IndexOf(nameFilter, StringComparison.OrdinalIgnoreCase) >= 0)
            .OrderBy(f => f, new NaturalSortComparer())
            .ToList();

        if (files.Count == 0)
        {
            Console.WriteLine($"No files matching \"{nameFilter}\" found in {bitmapDir}");
            return;
        }

        Console.WriteLine($"Files matching \"{nameFilter}\" in {Path.GetFileName(bitmapDir)}:");
        Console.WriteLine();

        var groups = new Dictionary<string, List<string>>();
        foreach (var f in files)
        {
            string key = GetBuildingGroup(f);
            if (!groups.ContainsKey(key))
                groups[key] = new List<string>();
            groups[key].Add(f);
        }

        foreach (var kvp in groups.OrderBy(g => g.Key, new NaturalSortComparer()))
        {
            var filesInGroup = kvp.Value.OrderBy(f => f, new NaturalSortComparer()).ToList();
            string baseFile = filesInGroup.FirstOrDefault(f => !f.EndsWith("A", StringComparison.OrdinalIgnoreCase) && !f.EndsWith("B", StringComparison.OrdinalIgnoreCase))
                ?? filesInGroup.FirstOrDefault(f => !f.EndsWith("A", StringComparison.OrdinalIgnoreCase))
                ?? filesInGroup[0];

            string fullPath = Path.Combine(bitmapDir, baseFile + ".BMP");
            BmpInfo info = BmpReader.Read(fullPath);

            bool hasA = filesInGroup.Any(f => f.EndsWith("A", StringComparison.OrdinalIgnoreCase));
            bool hasB = filesInGroup.Any(f => f.EndsWith("B", StringComparison.OrdinalIgnoreCase));
            string anim = (hasA, hasB) switch
            {
                (true, true) => "A/B 2-frame animation",
                (true, false) => "Has A-frame",
                (false, true) => "Has B-frame",
                _ => "Single frame"
            };

            string variantInfo = "";
            if (filesInGroup.Count > 1)
            {
                var variants = filesInGroup.Where(f => f != baseFile).ToList();
                variantInfo = $", variants: {string.Join(", ", variants.Select(v => v + ".BMP"))}";
            }

            Console.WriteLine($"  {baseFile}.BMP ({info.FileSizeStr}, {info.Dimensions}, {info.BitsPerPixel}-bit, {anim}){variantInfo}");
        }
        Console.WriteLine();
        Console.WriteLine($"Total: {files.Count} file(s) in {groups.Count} group(s)");
    }

    static string GetBuildingGroup(string filename)
    {
        string name = filename;
        if (name.EndsWith("A", StringComparison.OrdinalIgnoreCase) && name.Length > 1 && char.IsDigit(name[name.Length - 2]))
            name = name.Substring(0, name.Length - 1);
        else if (name.EndsWith("B", StringComparison.OrdinalIgnoreCase) && name.Length > 1 && char.IsDigit(name[name.Length - 2]))
            name = name.Substring(0, name.Length - 1);
        return name;
    }

    static void HandleCatalog(string bitmapDir)
    {
        var files = Directory.GetFiles(bitmapDir, "*.bmp", SearchOption.TopDirectoryOnly)
            .OrderBy(f => f, new NaturalSortComparer())
            .ToList();

        if (files.Count == 0)
        {
            Console.WriteLine($"No BMP files found in {bitmapDir}");
            return;
        }

        Console.WriteLine($"Bitmap Catalog: {bitmapDir}");
        Console.WriteLine($"Total files: {files.Count}");
        Console.WriteLine();

        var dimGroups = new Dictionary<string, (int Count, long TotalSize, List<string> Samples)>();
        var unreadable = new List<string>();

        foreach (var f in files)
        {
            try
            {
                BmpInfo info = BmpReader.Read(f);
                string key = info.Dimensions;
                if (!dimGroups.ContainsKey(key))
                    dimGroups[key] = (0, 0, new List<string>());
                var g = dimGroups[key];
                g.Count++;
                g.TotalSize += info.FileSize;
                if (g.Samples.Count < 3)
                    g.Samples.Add(Path.GetFileName(f));
                dimGroups[key] = g;
            }
            catch
            {
                unreadable.Add(Path.GetFileName(f));
            }
        }

        Console.WriteLine($"{"Dimensions",-14} {"Count",6} {"Total Size",12}  Samples");
        Console.WriteLine(new string('-', 80));

        foreach (var kvp in dimGroups.OrderByDescending(g => g.Value.Count))
        {
            var g = kvp.Value;
            string samples = g.Samples.Count > 0 ? string.Join(", ", g.Samples) : "-";
            if (g.Count > 3)
                samples += $" (+{g.Count - 3} more)";
            Console.WriteLine($"{kvp.Key,-14} {g.Count,6} {SizeFormat.Format(g.TotalSize),12}  {samples}");
        }

        if (unreadable.Count > 0)
        {
            Console.WriteLine();
            Console.WriteLine($"Unreadable files ({unreadable.Count}): {string.Join(", ", unreadable)}");
        }
    }

    static void TrySavePng(string bmpPath, string outputPath)
    {
        if (string.IsNullOrEmpty(outputPath))
            return;

        try
        {
            byte[] data = File.ReadAllBytes(bmpPath);
            int width = Math.Abs(BmpReader.ReadI32(data, 18));
            int height = Math.Abs(BmpReader.ReadI32(data, 22));
            short bpp = BmpReader.ReadI16(data, 28);
            int pixelOffset = BmpReader.ReadI32(data, 10);

            byte[][] palette = new byte[256][];
            for (int i = 0; i < 256; i++)
            {
                int off = 54 + i * 4;
                palette[i] = new byte[] { data[off + 2], data[off + 1], data[off + 0], 255 };
            }

            int srcStride = ((width * bpp + 31) / 32) * 4;

            if (bpp == 8)
            {
                byte[] rgba = new byte[width * height * 4];
                for (int y = 0; y < height; y++)
                {
                    int srcRow = pixelOffset + y * srcStride;
                    int dstRow = (height - 1 - y) * width * 4;
                    for (int x = 0; x < width; x++)
                    {
                        int idx = data[srcRow + x];
                        int dst = dstRow + x * 4;
                        rgba[dst] = palette[idx][2];
                        rgba[dst + 1] = palette[idx][1];
                        rgba[dst + 2] = palette[idx][0];
                        rgba[dst + 3] = 255;
                    }
                }
                SavePngRaw(rgba, width, height, outputPath);
            }
            else if (bpp == 24 || bpp == 32)
            {
                int bytesPerPixel = bpp / 8;
                byte[] rgba = new byte[width * height * 4];
                for (int y = 0; y < height; y++)
                {
                    int srcRow = pixelOffset + y * srcStride;
                    int dstRow = (height - 1 - y) * width * 4;
                    for (int x = 0; x < width; x++)
                    {
                        int src = srcRow + x * bytesPerPixel;
                        int dst = dstRow + x * 4;
                        rgba[dst] = data[src];
                        rgba[dst + 1] = data[src + 1];
                        rgba[dst + 2] = data[src + 2];
                        rgba[dst + 3] = bytesPerPixel == 4 ? data[src + 3] : (byte)255;
                    }
                }
                SavePngRaw(rgba, width, height, outputPath);
            }
            else
            {
                Console.WriteLine($"  PNG output not supported for {bpp}-bit images (only 8, 24, 32)");
                return;
            }

            Console.WriteLine($"  Saved: {Path.GetFullPath(outputPath)}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"  Warning: Could not save PNG ({ex.Message})");
        }
    }

    static void SavePngRaw(byte[] rgba, int width, int height, string path)
    {
        using var fs = new FileStream(path, FileMode.Create, FileAccess.ReadWrite);
        using var bw = new BinaryWriter(fs);

        bw.Write(new byte[] { 0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A });

        WritePngChunk(bw, "IHDR", w =>
        {
            w.Write(BigEndian(width));
            w.Write(BigEndian(height));
            w.Write((byte)8);
            w.Write((byte)6);
            w.Write((byte)0);
            w.Write((byte)0);
            w.Write((byte)0);
        });

        int stride = width * 4;
        byte[] raw = new byte[(stride + 1) * height];
        for (int y = 0; y < height; y++)
        {
            raw[y * (stride + 1)] = 0;
            Buffer.BlockCopy(rgba, y * stride, raw, y * (stride + 1) + 1, stride);
        }

        byte[] compressed = Deflate(raw);
        WritePngChunk(bw, "IDAT", w => w.Write(compressed));

        WritePngChunk(bw, "IEND", w => { });
    }

    static void WritePngChunk(BinaryWriter bw, string type, Action<BinaryWriter> writeData)
    {
        long startPos = bw.BaseStream.Position;
        bw.Write(0);
        bw.Write(Encoding.ASCII.GetBytes(type));
        long dataPos = bw.BaseStream.Position;
        writeData(bw);
        long endPos = bw.BaseStream.Position;
        int dataLen = (int)(endPos - dataPos);

        long oldPos = bw.BaseStream.Position;
        bw.BaseStream.Position = dataPos;
        byte[] dataBuf = new byte[dataLen];
        bw.BaseStream.Read(dataBuf, 0, dataLen);
        bw.BaseStream.Position = oldPos;

        byte[] crcInput = new byte[4 + dataLen];
        Array.Copy(Encoding.ASCII.GetBytes(type), 0, crcInput, 0, 4);
        Array.Copy(dataBuf, 0, crcInput, 4, dataLen);
        int crc = Crc32(crcInput);

        bw.BaseStream.Position = startPos;
        bw.Write(BigEndian(dataLen));
        bw.BaseStream.Position = endPos;
        bw.Write(crc);
    }

    static byte[] Deflate(byte[] data)
    {
        using var ms = new MemoryStream();
        ms.WriteByte(0x78);
        ms.WriteByte(0x01);
        using (var deflate = new System.IO.Compression.DeflateStream(ms, System.IO.Compression.CompressionLevel.Optimal, true))
        {
            deflate.Write(data, 0, data.Length);
        }
        return ms.ToArray();
    }

    static int BigEndian(int value)
    {
        return (value << 24) | ((value & 0xFF00) << 8) | ((value >> 8) & 0xFF00) | (value >> 24);
    }

    static int Crc32(byte[] data)
    {
        uint crc = 0xFFFFFFFF;
        foreach (byte b in data)
        {
            crc ^= b;
            for (int i = 0; i < 8; i++)
                crc = (crc >> 1) ^ ((crc & 1) * 0xEDB88320);
        }
        return (int)(crc ^ 0xFFFFFFFF);
    }
}

class NaturalSortComparer : IComparer<string>
{
    public int Compare(string x, string y)
    {
        if (x == null || y == null) return string.Compare(x, y, StringComparison.OrdinalIgnoreCase);

        int i = 0, j = 0;
        while (i < x.Length && j < y.Length)
        {
            if (char.IsDigit(x[i]) && char.IsDigit(y[j]))
            {
                int nx = 0, ny = 0;
                while (i < x.Length && char.IsDigit(x[i])) nx = nx * 10 + (x[i++] - '0');
                while (j < y.Length && char.IsDigit(y[j])) ny = ny * 10 + (y[j++] - '0');
                if (nx != ny) return nx.CompareTo(ny);
            }
            else
            {
                if (x[i] != y[j]) return char.ToUpperInvariant(x[i]).CompareTo(char.ToUpperInvariant(y[j]));
                i++; j++;
            }
        }
        return x.Length.CompareTo(y.Length);
    }
}
