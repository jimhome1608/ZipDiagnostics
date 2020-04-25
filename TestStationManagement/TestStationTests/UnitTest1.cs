using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TestStationManagement;

namespace TestStationTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestCheckSumOneLine()
        {
            uint res = ResultFile.ResultsFileWriteString("abcdef\r\n", true);
            Assert.AreEqual((uint)1862606736, res);
        }

        [TestMethod]
        public void TestCheckSumTwoLines()
        {
            uint res = ResultFile.ResultsFileWriteString("abc\r\n", true);
            res = ResultFile.ResultsFileWriteString("def\r\n", false);
            Assert.AreEqual((uint)0xB5011F90, res);
        }

        [TestMethod]
        public void TestCheckSumTwoLineFile()
        {
            string[] lines = File.ReadAllLines(@"..\..\.\TestData\TwoLines.csv");
            uint res = 0;
            for (int i= 0; i < lines.Count(); i++)
            {
                res = ResultFile.ResultsFileWriteString(lines[i] + "\r\n", i==0);
            }
            Assert.AreEqual((uint)0xB5011F90, res);
        }

        [TestMethod]
        public void TestResultFilCheckSum()
        {
            // have deleted the last line for the File Checksum,'11223344 from this test data.
            ResultFile resultFile = new ResultFile();
            bool res = resultFile.load_from_file(@"..\..\.\TestData\modified_checksum.csv");
            Assert.AreEqual(true, res);
            return;
        }
    }
}
