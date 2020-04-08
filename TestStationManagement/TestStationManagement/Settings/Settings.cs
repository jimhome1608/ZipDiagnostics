using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace TestStationManagement
{
    public static class Settings
    {

        public static bool get_next_station_id ()
        {
            var httpWebRequest = (HttpWebRequest)WebRequest.Create("http://localhost:52647/api/TestStation");
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string json = "{\"request_action\":\"get_new_station_id\"," +
                              "\"station_id\":\"\"}";

                streamWriter.Write(json);
            }

            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            {
                var result = streamReader.ReadToEnd();
                Debug.WriteLine(result);
            }
            return true; ;
        }

        public static string station_id = "";
        public static void set_station_id(string _station_id)
        {
            station_id = Database.sql_to_string("select value from settings where code = 'station.id'");
            if (station_id == "")
            {
                Random random = new Random();
                int num = random.Next(0xFFFF);
                station_id = num.ToString("X"); ;
                Database.execute_non_query("delete from settings where code = 'station.id'");
                Database.execute_non_query($"insert into settings (code, value, description) values('station.id', '{station_id}', 'Station ID is unique to each install and used as part of Test ID.')");
            }
        }

        public static string get_station_id()
        {
            station_id = Database.sql_to_string("select value from settings where code = 'station.id'");
            return station_id;
        }
    }
}
