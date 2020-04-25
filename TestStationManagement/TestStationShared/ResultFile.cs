using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;

namespace TestStationShared
{
    public class ResultFileException : Exception
    {
        public ResultFileException(string message)
            : base(message)
        {
        }

    }


    class ResultFile
    {

        private uint cksm32;

        //File Checksum,'11223344
        //Final Result  ,P+
        //Sample-ID, SARS-CoV-2#d87f7e0c#11FEB2020-134021
        //Date,01-JAN-2000
        //Time,04:16 AM
        public string check_sum_from_file;
        public string final_result;
        public string sample_id;

        public bool load_from_file(string _filename)
        {
            check_sum_from_file = "";
            string[] lines = File.ReadAllLines(_filename);
            foreach (string s in lines)
            {
                if (s.Trim().ToLower().IndexOf("file checksum") == 0) 
                {
                    check_sum_from_file = get_csv_value(s);
                }
                if (s.Trim().ToLower().IndexOf("final result") == 0)
                {
                    final_result = get_csv_value(s);
                }
                if (s.Trim().ToLower().IndexOf("sample-id") == 0)
                {
                    sample_id = get_csv_value(s);
                }
            }
            if (check_sum_from_file == "")
                throw new ResultFileException("Checksum not found in file");
            Debug.WriteLine(check_sum_from_file);
            uint res = 0;
            // last line is ignored because is the File Checksum,'11223344
            for (int i = 0; i < lines.Count() - 1; i++)
            {
                res = ResultsFileWriteString(lines[i] + "\r\n", i == 0);
            }
            if (check_sum_from_file != res.ToString())
                throw new ResultFileException($"Invalid Checksum found in file");
            return true;
        }
       
        public  uint ResultsFileWriteString(string str, bool _first_line)
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
