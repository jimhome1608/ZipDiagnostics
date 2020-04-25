using DevExpress.ClipboardSource.SpreadsheetML;
using System;
using System.Collections.Generic;
using System.Text;

namespace TestStationManagement
{
    public class ResultFileMockData
    {
        public static string data  = 
				"T8C2-S043741-2000-01-01-005-[sample-id] \n"+
				"Instrument Model,T8C2 \n"+
				"Instrument S/N,S043741 \n"+
				"Instrument SW Ver,V3.1.02 - 0 \n"+
				"Date,[test-date] \n"+
				"Time,[test-time] \n"+
				"Test Number,T005 \n"+
				"User ID,N/A \n"+
				"Test Type,COVID-19 \n"+
				"Test Type Version,1 \n"+
				"Sample-ID, [sample-id] \n"+
				"SID-Name,SARS-Cov-2 \n"+
				"SID-Hash,d87f7e0c \n"+
				"SID-SampleDate,11FEB2020-134021 \n"+
				"Cartridge-ID, 102#123456#200421 \n"+
				"CID-TestType,102 \n"+
				"CID-LotNo,123456 \n"+
				"CID-ExpDate,21Apr2020 \n"+
				"##### \n"+
				"Test Type Version,1 \n"+
				"Scan Duration (s),150 \n"+
				"Time to Second Temp (s),0 \n"+
				"Sampling Interval (s),15 \n"+
				"Test Temperature (C x10),400 \n"+
				"Second Temperature (C x10),0 \n"+
				"Channel Assignment,0 \n"+
				"FAM LED Duty (% x10),170 \n"+
				"HEX LED Duty (% x10),170 \n"+
				"Control Curve,1 \n"+
				"Display Graphs,1 \n"+
				"Display Tube Results,0 \n"+
				"Mixing Cycles,0 \n"+
				"Mixing Speed,0 \n"+
				"Custom Option,0 \n"+
				"Time at Open Lid,0 \n"+
				"Pre Delay,0 \n"+
				"Initial Start Time,15,15 \n"+
				"Initial End Time,60,60 \n"+
				"Initial Average Min Limit,400,400 \n"+
				"Initial Average Max Limit,2000,2000 \n"+
				"Normalized Response Graph,0,0 \n"+
				"Gradient Window Width,3,3 \n"+
				"Gradient Window Points,2,2 \n"+
				"Gradient Threshold (x10),1000,1000 \n"+
				"Gradient Start Time,60,60 \n"+
				"Gradient End Time,105,105 \n"+
				"Amplitude Window Width,2,2 \n"+
				"Amplitude Window Points,2,2 \n"+
				"Amplitude Threshold (&),3500,3000 \n"+
				"Amplitude Threshold (v),0,0 \n"+
				"Amplitude Start Time,105,105 \n"+
				"Amplitude End Time,150,150 \n"+
				"Option1,0,0 \n"+
				"Option2,0,0 \n"+
				"Test Type CRC,52E6 \n"+
				"Headings,,Time,Test,Ctrl \n"+
				"Units,Reading #,ms,mV,mV \n"+
				"@@@@@ \n"+
				">, 1, 0, 33, 30 \n"+
				">, 2, 15000, 34, 31 \n"+
				">, 3, 30005, 34, 31 \n"+
				">, 4, 45010, 34, 31 \n"+
				">, 5, 60015, 34, 31 \n"+
				">, 6, 75020, 34, 31 \n"+
				">, 7, 90025, 34, 31 \n"+
				">, 8, 105025, 34, 31 \n"+
				">, 9, 120030, 34, 31 \n"+
				">, 10, 135035, 34, 31 \n"+
				"^^^^^ \n"+
				"Result Table: ,TEST ,CONTROL \n"+
				"              ,T1 ,T2 \n"+
				"Initial:      ,1  ,1 \n"+
				"Gradient:     ,1  ,1 \n"+
				"AmplitudeOR:  ,1  ,1 \n"+
				"AmplitudeOnly ,X  ,X \n"+
				"Combined      ,1  ,1 \n"+
				"Final Result  ,[final_result] \n"+
				"Decision Time ,105025 \n"+
				"Block Temp. End (C),40.0 \n"+
				"Check Home,0 \n"+
				"Test Completed,0 \n"+
				"Tube Result,POS+ \n";
    }
}
