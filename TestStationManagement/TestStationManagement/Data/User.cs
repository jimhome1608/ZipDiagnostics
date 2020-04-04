using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestStationManagement.Data
{
    public static class CurrentUser
    {
        public static event EventHandler user_status_changed;
        public enum UserStatus { LoggedOut, LoggedIn };
        private static UserStatus _user_status = UserStatus.LoggedOut;
        public static UserStatus user_status
        {
            get
            {
                return _user_status;
            }
            set
            {
                _user_status = value;
                if (user_status_changed != null)
                {
                    user_status_changed(null, null);
                }
            }
        }

        public static int user_id { get; set; }
        public static String user_name { get; set; }
        public static String user_password { get; set; }
        public static String user_role { get; set; }
        public static String user_role_desc {
            
            get 
            {
                if (user_role.ToLower() == "sample")
                    return "Sample Collection";
                if (user_role.ToLower() == "test")
                    return "Run Tests";
                if (user_role.ToLower() == "sample_test")
                    return "Both Tests and Sample Collection";
                if (user_role.ToLower() == "local_admin")
                    return "Local Administrator";
                if (user_role.ToLower() == "system_admin")
                    return "System Administrator";
                return "Unknown Role";
            }
        }

        public static String user_position { get; set; }
        public static String user_full_name { get; set; }
        public static String user_mobile { get; set; }
        public static DateTime logged_on { get; set; }
        public static int status = 0;
        public static String message { get; set; }
        public static bool IsLoggedIn = false;
        public static Boolean is_admin
        {
            get
            {
                //Sample, Test, SampleTest, LocalAdmin, SystemAdmin 
                return user_role.IndexOf("_admin") >= 0;
            }
        }

        public static Boolean is_test_only
        {
            get
            {
                //Sample, Test, SampleTest, LocalAdmin, SystemAdmin 
                return user_role.ToLower() == "test";
            }
        }

        public static Boolean is_sample_only
        {
            get
            {
                //Sample, Test, SampleTest, LocalAdmin, SystemAdmin 
                return user_role.ToLower() == "sample";
            }
        }


        public static void clear()
        {
            user_id = 0;
            user_name = "";
            user_password = "";
            user_role = "";
            user_position = "";
            user_full_name = "";
            user_mobile = "";
            IsLoggedIn = false;
        }

        public static Boolean load_from_db(String _user_name, String _user_password, String app_version, String app, String app_module)
        {
            clear();
            String mn = Environment.MachineName.ToString();
            string user_login_sql = $"call user_login('{_user_name}', '{_user_password}', '{app_version}', '{mn}', '{app}')";
            //;
            var sql = new MySqlCommand(user_login_sql, Database.MySql());
            using (MySqlDataReader reader = sql.ExecuteReader())
            {
                if (reader.Read())
                {
                    status = reader.GetInt32(0);
                    if (status != 1)
                    {
                        message = reader[1].ToString();
                        return false;
                    }
                    user_id = reader.GetInt32("user_id");
                    user_name = reader["user_name"].ToString();
                    user_password = reader["user_password"].ToString();
                    user_role = reader["user_role"].ToString();
                    user_position = reader["user_position"].ToString();
                    user_full_name = reader["user_full_name"].ToString();
                    user_mobile = reader["user_mobile"].ToString();
                    IsLoggedIn = true;
                    Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                    config.AppSettings.Settings.Remove("LastUserLogin");
                    config.AppSettings.Settings.Add("LastUserLogin", _user_name);
                    config.Save(ConfigurationSaveMode.Full);
                    return true;
                }
            }
            //File.WriteAllBytes("c:/a1/az2.jpg", (byte[])reader["user_photo"]);
            //byte[] picData = reader["image_file"] as byte[] ?? null;
            //user_photo = user_photo = Image.FromFile("C:/a1/jim.jpg");
            //user_photo = user_photo.GetThumbnailImage(90, 90, null, IntPtr.Zero);
            // user_photo.Save("c:/a1/az.jpg");
            return false;
        }

    }
}
