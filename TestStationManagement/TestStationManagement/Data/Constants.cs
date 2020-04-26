using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestStationManagement
{
    public static class Constants
    {

        public const string SQL_SAMPLES_SELECT =
            "select *, get_sample_id(samples.station_id, samples.id) as sample_id2, concat(first_name,' ', family_name) as full_name  from samples ";

        public static Color BACKGROUND_COLOR_FOR_SELECTED_VIEW_BUTTON = Color.DarkGray;
        public static Color EDITING_BACKCOLOR = Color.LightYellow;
        public static Color TEST_IN_PROGRESS_BACKCOLOR = Color.DarkGray;
        public static Color TEST_COMPLETED_BACKCOLOR = Color.LightGray;
        public static Color TEST_WAITING_BACKCOLOR = Color.LightBlue;
        public static Color WEB_SAVED_OK_COLOR = Color.Green;

        public static string TEST_IN_PROGRESS_TEXT = "Test in Progress";
        public static string TEST_COMPLETE_TEXT = "Test Completed";
        public static string TEST_WAITING_TEXT = "Sample Collected";

        public static string SAMPLE_DETAILS_SCREEN_TITLE = "<br><size=24>Sample Details<size=14>";

        public static string DATE_TIME_FORMAT = "dd MMM yyyy hh:mm:ss";
        public static string RESULT_TIME_FORMAT = "hh:mm tt";
        public static string DATE_TIME_FORMAT_SAMPLE_ID = "ddMMMyyyy-HHmmss"; //11FEB2020-13:40:21
        public static string DATE_FORMAT = "dd MMM yyyy";

        public static string RUN_TEST_INSTRUCTIONS =
            "<b>Instructions<b><br></b>1/ Scan the Sample ID into the Test Machine<br>" +
            "2/ Scan the Cartridge ID into the Test Machine<br>";

        public static bool match_in_progress(string s)
        {
            s = s.ToLower().Trim();
            if (s.IndexOf("progress") > 0)
                return true;
            else
                return false;
        }

        public static bool match_completed(string s)
        {
            s = s.ToLower().Trim();
            if (s.IndexOf("completed") > 0)
                return true;
            else
                return false;
        }

        public static bool match_waiting(string s)
        {
            s = s.ToLower().Trim();
            if (s.IndexOf("collected") > 0)
                return true;
            else
                return false;
        }
    }
}
