using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestStationManagement
{
    public class ResultFileException : Exception
    {
        public ResultFileException(string message)
            : base(message)
        {
        }

    }


    public class  ResultFile
    {

        private static uint cksm32;

        //File Checksum,'11223344
        //Final Result  ,P+
        //Sample-ID, SARS-CoV-2#d87f7e0c#11FEB2020-134021
        //Date,01-JAN-2000
        //Time,04:16 AM
        public string check_sum_from_file;
        public string final_result;
        public string sample_id;
        public string test_date;
        public string test_time;
        public DateTime test_date_time;
        public string file_name;
        public string file_content;

        public static string make_result_file(string sample_id, string final_result, string test_date, string test_time, string file_name)
        {
            string res = ResultFileMockData.data;
            res = res.Replace("[sample-id]", sample_id);
            res = res.Replace("[final_result]", final_result);
            res = res.Replace("[test-date]", test_date);
            res = res.Replace("[test-time]", test_time);
            // SRARS-CoV-2_72955434_20200430-090120 
            res = res.Replace("[SID-Hash]", sample_id.Substring(12,8));
            res = res.Replace("[SID-SampleDate]", sample_id.Substring(21, 15));
            string[] lines = res.Split('\n');
            uint check_sum = get_check_sum(lines);
            res = res + $"File Checksum,'{check_sum.ToString()}";
            File.WriteAllText(file_name, res);
            return res;
        }

        public bool load_from_file(string _filename)
        {
            check_sum_from_file = "";            
            string[] lines = File.ReadAllLines(_filename);
            foreach (string s in lines)
            {
                if (s.Trim().ToLower().IndexOf("file checksum") == 0)
                {
                    check_sum_from_file = get_csv_value(s).Trim();
                }
                if (s.Trim().ToLower().IndexOf("final result") == 0)
                {
                    final_result = get_csv_value(s).Trim();
                }
                if (s.Trim().ToLower().IndexOf("sample-id") == 0)
                {
                    sample_id = get_csv_value(s).Trim();
                }
                if (s.Trim().ToLower().IndexOf("date,") == 0)
                {
                    test_date = get_csv_value(s).Trim();
                }
                if (s.Trim().ToLower().IndexOf("time,") == 0)
                {
                    test_time = get_csv_value(s).Trim();
                }
            }
            if (check_sum_from_file == "")
                throw new ResultFileException("Checksum not found in file");
            test_date_time = date_time_from_strings(test_date, test_time);
            Debug.WriteLine(check_sum_from_file);
            uint res = get_check_sum(lines);
            if (check_sum_from_file != res.ToString())
                throw new ResultFileException($"Invalid Checksum found in file");
            file_name = Path.GetFileName(_filename);
            file_content = File.ReadAllText(_filename);
            return true;
        }

        private static uint get_check_sum(string[] lines)
        {
            uint res = 0;
            for (int i = 0; i < lines.Count() - 1; i++)
            {
                if (lines[i].Trim().ToLower().IndexOf("file checksum") == 0)
                    continue;
                res = ResultsFileWriteString(lines[i] + "\r\n", i == 0);
            }
            return res;
        }

        public static uint ResultsFileWriteString(string str, bool _first_line)
        {
            if (_first_line)
                cksm32 = 0;
            for (int i = 0; i < str.Length; i++)
            {
                cksm32 += str[i];
                cksm32 = cksm32 << 3;
            }
            return cksm32;
        }

        private int  GetMonthNumberFromAbbreviation(string mmm)
        {
            mmm = mmm.ToUpper();
            string[] monthAbbrev =
               CultureInfo.CurrentCulture.DateTimeFormat.AbbreviatedMonthNames;
            for (int i = 0; i < monthAbbrev.Count(); i++)
                monthAbbrev[i] = monthAbbrev[i].ToUpper();
            int index = Array.IndexOf(monthAbbrev, mmm) + 1;
            return index;
        }

        public DateTime date_time_from_strings(string date, string time)
        {
            // 01-JAN-2000  
            // 04:16 AM
            if (date.Length < 11)
                throw new ResultFileException($"Invalid Test Date in file");
            if (time.Length < 8)
                throw new ResultFileException($"Invalid Test Time in file");
            int d;
            bool success = Int32.TryParse(date.Substring(0, 2), out d);
            if (!success)
                throw new ResultFileException($"Invalid Test Date in file");
            int m = GetMonthNumberFromAbbreviation(date.Substring(3, 3));
            int y;
            success = Int32.TryParse(date.Substring(7, 4), out y);
            if (!success)
                throw new ResultFileException($"Invalid Test Date in file");
            int h;
            success = Int32.TryParse(time.Substring(0, 2), out h);
            if (!success)
                throw new ResultFileException($"Invalid Test Time in file");
            if (time.ToUpper().IndexOf("PM") > 0)
                h += 11;
            int min;
            success = Int32.TryParse(time.Substring(3, 2), out min);
            if (!success)
                throw new ResultFileException($"Invalid Test Time in file");
            DateTime res = new DateTime(y, m, d, h, min, 0);
            return res;

        }

        private string get_csv_value(string csv)
        {
            string res = "";
            string[] cols = csv.Split(',');
            if (cols.Count() == 2)
            {
                res = cols[1];
                res = res.Replace("'", "");
            }
            return res;
        }

    }
}
