using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Text;

namespace TestStationManagement
{


    public class VersionInfo
    {
        public String test_station;

    }

    public static class AppView
    {

        public static event EventHandler sample_state_changed;
        public static event EventHandler test_view_state_changed;

        public enum DataView { All, Completed, InProgress, Waiting };
        private static DataView _test_view_state = DataView.All;
        public static DataView test_view_state
        {
            get
            {
                return _test_view_state;
            }
            set
            {
                _test_view_state = value;
                if (test_view_state_changed != null)
                {
                    test_view_state_changed(null, null);
                }
            }
        }
        public enum DataStates { Editing, Saved };
        private static DataStates _sample_state = DataStates.Saved;
        public static DataStates sample_state
        {
            get
            {
                return _sample_state;
            }
            set
            {
                _sample_state = value;
                if (sample_state_changed != null)
                {
                    sample_state_changed(null, null);
                }
            }
        }

        public static String about_text = "";
        public static String temp_directory = "";
        public static String dump_directory = "";
        public static String error_log = "";
        public static String print_directory = "";
        public static VersionInfo version_info = new VersionInfo();
        public static String application_filename = "";
        public static String application_name = "";
        public static Boolean show_confirmation_move_tests = true;
        public static string computer_name;
        public static string ip_address;


        public static void write_error_log(String error_message)
        {
            string error_log_filename = DateTime.Now.ToFileTime().ToString() + ".txt";
            File.WriteAllText(error_log + "\\" + error_log_filename, error_message);
        }



        public static void get_versions()
        {
            application_filename = System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName;

            FileVersionInfo fvi;
            fvi = FileVersionInfo.GetVersionInfo(application_filename);
            version_info.test_station = fvi.FileVersion;
        }


        public static Color axxin_red()
        {
            return Color.FromArgb(243, 189, 181);
        }

        public static Color axxin_proposal_background()
        {
            return Color.LightSkyBlue;
        }

        public static Color axxin_proposal_foreground()
        {
            return Color.Navy;
        }


        public static Color axxin_green()
        {
            return Color.FromArgb(80, 220, 100);
        }


        public static Color info_readonly_background()
        {
            return SystemColors.Info;
        }             

    }

}
