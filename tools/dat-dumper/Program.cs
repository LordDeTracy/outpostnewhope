using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace DatDumper
{
    class Program
    {
        static int Main(string[] args)
        {
            if (args.Length == 0)
            {
                PrintUsage();
                return 1;
            }

            switch (args[0].ToLowerInvariant())
            {
                case "--bldgbld":
                    if (args.Length < 2) { Console.Error.WriteLine("Usage: --bldgbld <file>"); return 1; }
                    DumpBldgBld(args[1]);
                    break;
                case "--bldgops":
                    if (args.Length < 2) { Console.Error.WriteLine("Usage: --bldgops <file>"); return 1; }
                    DumpBldgOps(args[1]);
                    break;
                case "--tutor":
                    if (args.Length < 2) { Console.Error.WriteLine("Usage: --tutor <file>"); return 1; }
                    DumpTutor(args[1]);
                    break;
                case "--all":
                    if (args.Length < 4) { Console.Error.WriteLine("Usage: --all <bldgbld> <bldgops> <tutor>"); return 1; }
                    Console.WriteLine("=== BLDGBLD.DAT ===");
                    DumpBldgBld(args[1]);
                    Console.WriteLine();
                    Console.WriteLine("=== BLDGOPS.DAT ===");
                    DumpBldgOps(args[2]);
                    Console.WriteLine();
                    Console.WriteLine("=== TUTOR.OPS ===");
                    DumpTutor(args[3]);
                    break;
                default:
                    Console.Error.WriteLine($"Unknown option: {args[0]}");
                    PrintUsage();
                    return 1;
            }
            return 0;
        }

        static void PrintUsage()
        {
            Console.WriteLine("DatDumper - Sierra Outpost data file dumper");
            Console.WriteLine();
            Console.WriteLine("Usage:");
            Console.WriteLine("  --bldgbld <file>       Dump BLDGBLD.DAT (XOR 0x80 CSV)");
            Console.WriteLine("  --bldgops <file>       Dump BLDGOPS.DAT (XOR 0x80 CSV)");
            Console.WriteLine("  --tutor <file>         Dump TUTOR.OPS (binary sections)");
            Console.WriteLine("  --all <b> <o> <t>      Dump all three files");
        }

        static string[][] DecodeXorCsv(byte[] raw)
        {
            var records = new List<string[]>();
            int start = 0;
            for (int i = 0; i <= raw.Length; i++)
            {
                if (i >= raw.Length || (i + 1 < raw.Length && raw[i] == 0x0D && raw[i + 1] == 0x0A))
                {
                    if (i == raw.Length && start >= raw.Length) break;
                    int len = i >= raw.Length ? raw.Length - start : i - start;
                    var recBytes = new byte[len];
                    Array.Copy(raw, start, recBytes, 0, len);
                    for (int j = 0; j < recBytes.Length; j++)
                        recBytes[j] ^= 0x80;
                    string line = Encoding.ASCII.GetString(recBytes).Trim();
                    if (line.Length > 0)
                    {
                        records.Add(ParseCsvLine(line));
                    }
                    start = i + 2;
                    if (i >= raw.Length) break;
                    i++;
                }
            }
            return records.ToArray();
        }

        static string[] ParseCsvLine(string line)
        {
            var fields = new List<string>();
            bool inQuotes = false;
            int start = 0;
            for (int i = 0; i < line.Length; i++)
            {
                if (line[i] == '"') inQuotes = !inQuotes;
                else if (line[i] == ',' && !inQuotes)
                {
                    fields.Add(ParseCsvField(line.Substring(start, i - start)));
                    start = i + 1;
                }
            }
            fields.Add(ParseCsvField(line.Substring(start)));
            return fields.ToArray();
        }

        static string ParseCsvField(string field)
        {
            field = field.Trim();
            if (field.Length >= 2 && field[0] == '"' && field[field.Length - 1] == '"')
                field = field.Substring(1, field.Length - 2);
            return field;
        }

        static string FormatPrereqs(string[] fields, int start, int count)
        {
            var prereqs = new List<string>();
            for (int i = 0; i < count && start + i < fields.Length; i++)
            {
                if (fields[start + i] != "0")
                    prereqs.Add($"#{start + i + 3}={fields[start + i]}");
            }
            return prereqs.Count > 0 ? string.Join(", ", prereqs) : "(none)";
        }

        static void DumpBldgBld(string path)
        {
            if (!File.Exists(path)) { Console.Error.WriteLine($"File not found: {path}"); return; }

            byte[] raw = File.ReadAllBytes(path);
            string[][] records = DecodeXorCsv(raw);
            Console.WriteLine($"BLDGBLD.DAT: {records.Length} records, {records[0]?.Length ?? 0} fields each");
            Console.WriteLine();

            var fmt = "| {0,3} | {1,-18} | {2,-50} | {3,4} | {4,4} | {5,4} | {6,4} |";
            Console.WriteLine(string.Format(fmt, "Idx", "Name", "Prerequisites (field=val)", "Cost", "Time", "Res", "Cat"));
            Console.WriteLine(new string('-', 110));

            for (int r = 0; r < records.Length; r++)
            {
                var f = records[r];
                string name = f.Length > 0 ? f[0] : "?";
                string prereqs = FormatPrereqs(f, 18, 12);
                string cost = f.Length > 36 ? f[36] : "?";
                string time = f.Length > 37 ? f[37] : "?";
                string res = f.Length > 38 ? f[38] : "?";
                string cat = f.Length > 39 ? f[39] : "?";
                Console.WriteLine(string.Format(fmt, r, name, prereqs, cost, time, res, cat));
            }
        }

        static void DumpBldgOps(string path)
        {
            if (!File.Exists(path)) { Console.Error.WriteLine($"File not found: {path}"); return; }

            byte[] raw = File.ReadAllBytes(path);
            string[][] records = DecodeXorCsv(raw);
            Console.WriteLine($"BLDGOPS.DAT: {records.Length} records, {records[0]?.Length ?? 0} fields each");
            Console.WriteLine();

            var fmt = "| {0,3} | {1,-18} | {2,-50} | {3,4} | {4,4} | {5,4} |";
            Console.WriteLine(string.Format(fmt, "Idx", "Name", "Op Prereqs (field=val)", "Pwr", "Mnt", "Flag"));
            Console.WriteLine(new string('-', 100));

            for (int r = 0; r < records.Length; r++)
            {
                var f = records[r];
                string name = f.Length > 0 ? f[0] : "?";
                string prereqs = FormatPrereqs(f, 22, 8);
                string power = f.Length > 36 ? f[36] : "?";
                string maint = f.Length > 37 ? f[37] : "?";
                string flag = f.Length > 38 ? f[38] : "?";
                Console.WriteLine(string.Format(fmt, r, name, prereqs, power, maint, flag));
            }
        }

        static void DumpTutor(string path)
        {
            if (!File.Exists(path)) { Console.Error.WriteLine($"File not found: {path}"); return; }

            byte[] data = File.ReadAllBytes(path);
            string ascii = Encoding.ASCII.GetString(data);

            Console.WriteLine($"TUTOR.OPS: {data.Length} bytes");
            Console.WriteLine();

            var markers = new List<(string Name, int Offset)>();
            int idx = 0;
            while ((idx = ascii.IndexOf("dcbSC", idx, StringComparison.Ordinal)) >= 0)
            {
                if (idx + 7 <= ascii.Length)
                    markers.Add((ascii.Substring(idx, 7), idx));
                idx++;
            }
            Console.WriteLine($"Found {markers.Count} dcbSC sections:");
            Console.WriteLine();

            var mfmt = "| {0,-10} | 0x{1,-8:X4} | {2,7} |";
            Console.WriteLine(string.Format(mfmt, "Section", "Offset", "Size"));
            Console.WriteLine(new string('-', 40));
            for (int m = 0; m < markers.Count; m++)
            {
                int endOff = (m + 1 < markers.Count) ? markers[m + 1].Offset : data.Length;
                int size = endOff - markers[m].Offset;
                Console.WriteLine(string.Format(mfmt, markers[m].Name, markers[m].Offset, size));
            }

            Console.WriteLine();
            Console.WriteLine("--- dcbSC10 Step Definitions ---");
            const int dcbSC10Offset = 5187;
            const int stepSize = 34;
            if (dcbSC10Offset + 7 < data.Length)
            {
                int bodyStart = dcbSC10Offset + 7;
                int bodyLen = data.Length - bodyStart;
                int stepsFound = 0;
                Console.WriteLine($"Raw body at offset {bodyStart}, length {bodyLen} bytes");
                Console.WriteLine();

                var sfmt = "| {0,4} | {1,4} | {2,6} | {3,7} | {4,6} | {5,6} | {6,6} | {7,-40} |";
                Console.WriteLine(string.Format(sfmt, "Step#", "ID", "TxtLen", "Speaker", "Flag1", "Flag2", "Type", "Hex Dump (start)"));
                Console.WriteLine(new string('-', 110));

                int pos = bodyStart;
                int maxPos = data.Length - stepSize;
                while (pos < maxPos)
                {
                    if (data[pos] == 0x01 && data[pos + 1] == 0x00 &&
                        data[pos + 2] == 0x00 && data[pos + 3] == 0x04)
                    {
                        int stepId = data[pos + 4] | (data[pos + 5] << 8);
                        int txtLen = data[pos + 12] | (data[pos + 13] << 8);
                        int speaker = data[pos + 14] | (data[pos + 15] << 8);
                        int flag1 = data[pos + 16] | (data[pos + 17] << 8);
                        int flag2 = data[pos + 18] | (data[pos + 19] << 8);
                        int condType = data[pos + 20] | (data[pos + 21] << 8);

                        string hexDump = BitConverter.ToString(data, pos, 16);
                        char spChar = speaker >= 0x20 && speaker <= 0x7E ? (char)speaker : '?';
                        Console.WriteLine(string.Format(sfmt, stepsFound + 1, stepId, txtLen, $"{spChar} (0x{speaker:X2})", flag1, flag2, condType, hexDump));
                        stepsFound++;
                        pos += stepSize;
                        if (stepsFound >= 133) break;
                    }
                    else
                    {
                        pos++;
                    }
                }
                Console.WriteLine();
                Console.WriteLine($"Total step records found: {stepsFound}");
            }
        }
    }
}
