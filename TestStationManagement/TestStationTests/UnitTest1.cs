using System;
using System.Diagnostics;
using System.IO;
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
            uint res = ResultFile.ResultsFileWriteString("abcdef");
            Assert.AreEqual((uint)29103216, res);
        }

        [TestMethod]
        public void TestCheckSumTwoLines()
        {
            uint res = ResultFile.ResultsFileWriteString("abc");
            res += ResultFile.ResultsFileWriteString("def");
            Assert.AreEqual((uint)115208, res);
        }

        [TestMethod]
        public void TestCheckSumTwoLineFile()
        {
            string[] lines = File.ReadAllLines(@"..\..\.\TestData\TwoLines.csv");
            uint res = 0;
            foreach (string s in lines)
            {
                res += ResultFile.ResultsFileWriteString(s);
            }
            Assert.AreEqual((uint)115208, res);
        }

        [TestMethod]
        public void TestResultFilCheckSum()
        {
            // have deleted the last line for the File Checksum,'11223344 from this test data.
            string[] lines = File.ReadAllLines(@"..\..\.\TestData\T8C2-S043741-2000-01-01-005-SARS-CoV-2#d87f7e0c#11FEB2020-134021.csv");
            uint res = 0;
            foreach (string s in lines)
            {
                res += ResultFile.ResultsFileWriteString(s);
            }            
            Assert.AreEqual((uint)11223344, res);
        }
    }
}
