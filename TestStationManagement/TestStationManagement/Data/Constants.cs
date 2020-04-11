using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestStationManagement.Data
{
    public static class Constants
    {

        public const string SQL_SAMPLES_SELECT = "select *, get_test_barcode(samples.id) as test_barcode, concat(first_name,' ', family_name) as full_name  from samples ";

        public static Color BACKGROUND_COLOR_FOR_SELECTED_VIEW_BUTTON = Color.DarkGray;
        public static Color EDITING_BACKCOLOR = Color.LightYellow;
        public static Color TEST_IN_PROGRESS_BACKCOLOR = Color.Yellow;
        public static Color TEST_COMPLETED_BACKCOLOR = Color.Red;
        public static Color TEST_WAITING_BACKCOLOR = Color.LightGreen;
        public static Color WEB_SAVED_OK_COLOR = Color.Green;

        public static string TEST_IN_PROGRESS_TEXT = "Test in Progress";
        public static string TEST_COMPLETE_TEXT = "Test Completed";
        public static string TEST_WAITING_TEXT = "Sample Collected";

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
