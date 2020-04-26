using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace TestStationManagement.Data
{

    public class TestStationSampleData
    {


        public string station_id;
        public int id;
        public Nullable<DateTime> sample_time;
        public string first_name;
        public string family_name;
        public Nullable<DateTime> date_of_birth;
        public string postcode;
        public string phone;
        public string email;
        public string notes;
        public string sample_id;
        public string test_result;
        public string test_status;
        public Nullable<DateTime> test_start_time;
        public Nullable<DateTime> result_import_time;
        public Nullable<DateTime> test_time;
        public int web_saved;
        public string sample_user_name;
        public string test_start_user_name;
        public string test_result_user_name;
        public int sample_user_id;
        public int test_start_user_id;
        public int test_result_user_id;
        public string result_file;
        public string request_action;

        public TestStationSampleData()
        {
            sample_time = null;
            date_of_birth = null;
            test_start_time = null;
            result_import_time = null;
            test_time = null;

        }
    }

    public static class WebApi
    {
        static string host_address = "http://localhost:52647";
        //static string host_address = "https://www.multilink2.com.au";
        public static bool internet_connection_ok = false;

        public static bool CheckForInternetConnection()
        {
            try
            {
                // https://www.multilink2.com.au/api/TestStation/status_sumamry
                using (var client = new WebClient())
                {
                    Stream s =  client.OpenRead($"{host_address}/api/TestStation/status_sumamry");
                    StreamReader sr = new StreamReader(s);
                    var response = sr.ReadToEnd();
                    Debug.WriteLine("CheckForInternetConnection");
                    Debug.WriteLine(response);
                    internet_connection_ok = true;
                    return true;
                }
            }
            catch
            {
                internet_connection_ok = false;
                return false;
            }
        }

        public static string get_next_station_id()
        {
            string station_id = "";
            var httpWebRequest = (HttpWebRequest)WebRequest.Create($"{host_address}/api/TestStation");
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
                dynamic myDetails = JsonConvert.DeserializeObject(result);
                if (myDetails.request_action == "done")
                {
                    Debug.WriteLine("done");
                    station_id = myDetails.station_id;
                    Database.execute_non_query("delete from settings where code = 'station.id'");
                    Database.execute_non_query($"insert into settings (code, value, description) values('station.id', '{station_id}', 'Station ID is unique to each install and used as part of Test ID.')");
                }

            }
            return station_id;
        }

        public static bool save_sample(int id)
        {
            SqlData _data = new SqlData($"{Constants.SQL_SAMPLES_SELECT} where id = {id} ");
            if (_data.myDataTable.Rows.Count < 1)
                return false;
            DataRow r = _data.myDataTable.Rows[0];
            if (r == null) return false;
            return save_sample(r);
        }

        public static bool save_sample(DataRow r)
        {

            if (!WebApi.internet_connection_ok)
                return false;
            try
            {
                SplashScreen2.Start("Backup in progress...");
                TestStationSampleData data = new TestStationSampleData();
                data.station_id = r["station_id"].ToString();
                data.id = (int)r["id"];
                data.sample_time = Database.safe_read_nullable_datetime(r, "sample_time");
                data.first_name = r["first_name"].ToString();
                data.family_name = r["family_name"].ToString();
                data.date_of_birth = Database.safe_read_nullable_datetime(r, "date_of_birth");
                data.postcode = r["postcode"].ToString();
                data.phone = r["phone"].ToString();
                data.email = r["email"].ToString();
                data.notes = r["notes"].ToString();
                data.sample_id = r["sample_id"].ToString();
                data.test_result = r["test_result"].ToString();
                data.test_status = r["test_status"].ToString();
                data.test_start_time = Database.safe_read_nullable_datetime(r, "test_start_time");
                data.result_import_time = Database.safe_read_nullable_datetime(r, "result_import_time");
                data.test_time = Database.safe_read_nullable_datetime(r, "test_time");
                data.sample_user_name = r["sample_user_name"].ToString();
                data.test_result_user_name = r["test_result_user_name"].ToString();
                data.notes = r["notes"].ToString();
                data.sample_user_id = Database.safe_read_int(r, "sample_user_id");
                data.test_start_user_id = Database.safe_read_int(r, "test_start_user_id");
                data.test_result_user_id = Database.safe_read_int(r, "test_result_user_id");
                data.result_file = r["result_file"].ToString();
                data.request_action = "save_sample";

                JObject json_data = (JObject)JToken.FromObject(data);

                var httpWebRequest = (HttpWebRequest)WebRequest.Create($"{host_address}/api/TestStation");
                httpWebRequest.ContentType = "application/json";
                httpWebRequest.Method = "POST";

                using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                {
                    streamWriter.Write(json_data);
                }

                var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    var result = streamReader.ReadToEnd();
                    Debug.WriteLine(result);
                    dynamic myDetails = JsonConvert.DeserializeObject(result);
                    if (myDetails.request_action == "done")
                    {
                        SplashScreen2.Stop();
                        return true;
                    }
                }
                SplashScreen2.Stop();
                return true;
            }
            catch (Exception ex)
            {
                WebApi.internet_connection_ok = false;                
                return false;
            }
        }
    }
}
