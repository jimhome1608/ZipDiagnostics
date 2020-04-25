using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TestStationShared;

namespace TestStationTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestCheckSumOneLine()
        {
            ResultFile resultFile = new ResultFile();
            uint res = resultFile.ResultsFileWriteString("abcdef\r\n", true);
            Assert.AreEqual((uint)1862606736, res);
        }

        [TestMethod]
        public void TestCheckSumTwoLines()
        {
            ResultFile resultFile = new ResultFile();
            uint res = resultFile.ResultsFileWriteString("abc\r\n", true);
            res = resultFile.ResultsFileWriteString("def\r\n", false);
            Assert.AreEqual((uint)0xB5011F90, res);
        }

        [TestMethod]
        public void TestCheckSumTwoLineFile()
        {
            ResultFile resultFile = new ResultFile();
            string[] lines = File.ReadAllLines(@"..\..\.\TestData\TwoLines.csv");
            uint res = 0;
            for (int i= 0; i < lines.Count(); i++)
            {
                res = resultFile.ResultsFileWriteString(lines[i] + "\r\n", i==0);
            }
            Assert.AreEqual((uint)0xB5011F90, res);
        }

        [TestMethod]
        public void TestResultFilCheckSum()
        {
            // have deleted the last line for the File Checksum,'11223344 from this test data.
            ResultFile resultFile = new ResultFile();
            string[] lines = File.ReadAllLines(@"..\..\.\TestData\T8C2-S043741-2000-01-01-005-SARS-CoV-2#d87f7e0c#11FEB2020-134021_orig.csv");
            uint res = 0;
            for (int i = 0; i < lines.Count()-1; i++)
            {
                res = resultFile.ResultsFileWriteString(lines[i] + "\r\n", i == 0);
            }            
            Assert.AreEqual((uint)11223344, res);
        }
    }
}
