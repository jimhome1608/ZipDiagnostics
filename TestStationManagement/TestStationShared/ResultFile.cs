using System;
using System.Collections.Generic;
using System.Text;

namespace TestStationShared
{
    class ResultFile
    {
        static public  uint ResultsFileWriteString(string str)
        {
            uint cksm32 = 0;
            for (int i = 0; i < str.Length; i++)
            {
                cksm32 += str[i];
                cksm32 = cksm32 << 3;
            }
            return cksm32;
        }

    }
}
