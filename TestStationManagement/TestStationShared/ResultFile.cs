using System;
using System.Collections.Generic;
using System.Text;

namespace TestStationShared
{
    class ResultFile
    {

         private uint cksm32;
       
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

    }
}
