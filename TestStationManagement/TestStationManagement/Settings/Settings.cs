using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using TestStationManagement.Data;

namespace TestStationManagement
{
    public static class Settings
    {
        public static string station_id = "";
        

        public static string get_station_id()
        {
            station_id = Database.sql_to_string("select value from settings where code = 'station.id'");
            if (station_id == "")
            {
                WebApi.get_next_station_id();
                station_id = Database.sql_to_string("select value from settings where code = 'station.id'");
            }
            return station_id;
        }
    }
}
