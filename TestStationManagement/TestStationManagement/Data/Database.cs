/*

GRANT ALL PRIVILEGES ON test_station.*  TO 'axxin_spectrace'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON test_station.* TO 'axxin_spectrace'@'localhost' WITH GRANT OPTION;

*/
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace TestStationManagement
{

    public class AxxinDatabaseRuleException : Exception
    {
        public AxxinDatabaseRuleException(string message)
        : base(message)
        {
        }
    };

    public class SelectedIdEventArgs : EventArgs
    {
        public int SelectedID;
        public String SelectedIDName;
        public String ref_code;
        public int ref_id;
        public string item_name;
    }

    public static class Database    {


        public static string database_host = ConfigurationManager.AppSettings["DatabaseHost"];
        public static String str_clean(String s)
        {
            s = s.Replace("\\", "\\\\"); ;
            s = s.Replace("'", "\\'"); ;
            return s;
        }

        public static String connection_string = "user=axxin_spectrace;database=test_station;port=3306;password=XN!qr01;default command timeout=120;CharSet=utf8 ";
        private static MySqlConnection fMySql = null;

        public static bool running_on_dev_machine
        {
            get
            {
                if (" DESKTOP-F0HV160 DESKTOP-136ALIH".IndexOf(Environment.MachineName.ToString()) > 0 || Environment.MachineName.ToString() == "DESKTOP-BV74EJH")
                    return true;
                else
                    return false;
            }
        }


        public static MySqlConnection MySql()
        {
            if (fMySql == null)
            {
                // "DESKTOP-136ALIH"
                if (running_on_dev_machine)
                {
                    database_host = "localhost";
                }
                fMySql = new MySqlConnection("server=" + database_host + "; " + connection_string);
                fMySql.Open();
            }

            return fMySql;
        }

        private static Random random = new Random();
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        

        public static Boolean field_exists(String _schema, String _table, String _field)
        {
            String _sql =
                "select COUNT(*) from INFORMATION_SCHEMA.COLUMNS where " +
                $"COLUMN_NAME = \"{_field}\" AND  TABLE_NAME = \"{_table}\" " +
                $"AND TABLE_SCHEMA = \"{_schema}\" ";
            int r = sql_to_int(_sql);
            return r != 0;
        }

        public static String get_field_type(String _schema, String _table, String _field)
        {
            String _sql =
                "select DATA_TYPE from INFORMATION_SCHEMA.COLUMNS where " +
                $"COLUMN_NAME = \"{_field}\" AND  TABLE_NAME = \"{_table}\" " +
                $"AND TABLE_SCHEMA = \"{_schema}\" ";
            String r = sql_to_string(_sql);
            return r;
        }


        // select * from information_schema.triggers where event_object_table = 'prop' and trigger_schema = 'proplink' and trigger_name= 'in_prop'

        public static Boolean trigger_exists(String _schema, String _table, String _trigger_name)
        {
            String _sql =
                $"select count(*) from information_schema.triggers where event_object_table = '{_table}' and trigger_schema = '{_schema}' and trigger_name= '{_trigger_name}'";
            int r = sql_to_int(_sql);
            return r != 0;
        }

        public static Boolean table_exists(String _schema, String _table)
        {
            String _sql =
                "select COUNT(*) from INFORMATION_SCHEMA.TABLES where " +
                $"table_name = \"{_table}\" " +
                $"AND TABLE_SCHEMA = \"{_schema}\" ";
            int r = sql_to_int(_sql);
            return r != 0;
        }

        public static Boolean proc_exists(String _schema, String _routine)
        {
            String _sql =
               "select count(*) from INFORMATION_SCHEMA.ROUTINES where " +
               $"ROUTINE_NAME = \"{_routine}\" " +
               $"AND ROUTINE_SCHEMA  = \"{_schema}\" ";
            int r = sql_to_int(_sql);
            return r != 0;
        }

        public static Boolean index_exists(String _schema, String _table, String _index)
        {
            String _sql =
               "select count(*) from information_schema.statistics where " +
               $"table_name = \"{_table}\" " +
               $"and  table_schema  = \"{_schema}\" and index_name = \"{_index}\"  ";
            int r = sql_to_int(_sql);
            return r != 0;
        }

        public static Boolean safe_drop_proc(String _schema, String _routine)
        {
            if (proc_exists(_schema, _routine))
            {
                execute_non_query($"use {_schema}; drop procedure  {_routine}; use axxin;");
                return true;
            }
            return false;
        }

        public static Boolean safe_drop_function(String _schema, String _routine)
        {
            if (proc_exists(_schema, _routine))
            {
                execute_non_query($"use {_schema}; drop function  {_routine}; use axxin;");
                return true;
            }
            return false;
        }

        public static Boolean safe_drop_table(String _schema, String _table)
        {
            if (table_exists(_schema, _table))
            {
                execute_non_query($"use {_schema}; drop table  {_table}; use axxin;");
                return true;
            }
            return false;
        }

        public static String safe_read(DataRowView r, String fieldname)
        {
            if (r[fieldname] != System.DBNull.Value)
                return r[fieldname].ToString();
            else
                return "";
        }

        public static String safe_read(DataRow r, String fieldname)
        {
            if (r[fieldname] != System.DBNull.Value)
                return r[fieldname].ToString();
            else
                return "";
        }

        public static String safe_read(DevExpress.XtraGrid.Views.Grid.GridView grid, int rowHandle, String fieldname)
        {
            if (grid.GetRowCellValue(rowHandle, fieldname) != System.DBNull.Value)
                return (string)grid.GetRowCellValue(rowHandle, fieldname);
            else
                return "";
        }

       
        public static void run_over_change_log()
        {
            //int cl = sql_to_int("select count(*) from db_change_log where change_id = 2");
            //if (cl < 1)
            //{
            //    execute_non_query("use axxin; drop table ref_docs;");
            //    execute_non_query("use axxin_edit; drop table ref_docs; use axxin;");
            //    execute_non_query("insert into db_change_log values (2, 'drop and recreate ref_docs')");
            //}
        }

        public static Boolean check_db()
        {
            run_over_change_log();
            execute_non_query("update users set user_full_name = 'Fullname not set' where ifnull(user_full_name,'') = ''");
            List<string> schema_list = new List<string>() { "test_station" };
            foreach (String schema in schema_list)
            {
                //if (!field_exists(schema, "proj", "spec_wfr_change"))
                //{
                //    execute_non_query($"use {schema}; alter table proj add spec_wfr_change int default 0; use axxin;");
                //}
            }
            return true;
        }

        public static void execute_non_query(String _sql)
        {
            var cmd = new MySqlCommand(_sql, MySql());
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public static int sql_to_int(String _sql)
        {
            int result = 0;
            var cmd = new MySqlCommand(_sql, MySql());
            MySqlDataReader myReader;
            myReader = cmd.ExecuteReader();
            // Always call Read before accessing data.
            if (myReader.Read())
            {
                result = myReader.GetInt32(0);
            }
            myReader.Close();
            return result;
        }

        public static int try_sql_to_int(String _sql, int default_return)
        {
            int result = default_return;
            var cmd = new MySqlCommand(_sql, MySql());
            MySqlDataReader myReader;
            myReader = cmd.ExecuteReader();
            // Always call Read before accessing data.
            if (myReader.Read())
            {
                if (myReader[0] != System.DBNull.Value)
                    result = myReader.GetInt32(0);
            }
            myReader.Close();
            return result;
        }

        public static String sql_to_string(String _sql)
        {
            String result = "";
            var cmd = new MySqlCommand(_sql, MySql());
            MySqlDataReader myReader;
            myReader = cmd.ExecuteReader();
            // Always call Read before accessing data.
            if (myReader.Read())
            {
                if (DBNull.Value.Equals(myReader[0]))
                    result = "";
                else
                    result = myReader[0].ToString();
            }
            myReader.Close();
            return result;
        }

        public static byte[] sql_blob_to_bytese(String _sql)
        {
            byte[] result = null;
            int ordinal = 0;
            using (var cmd = new MySqlCommand(_sql, MySql()))
            {
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                myReader.Read();
                if (!myReader.HasRows)
                    return result;
                if (myReader.IsDBNull(0))
                    return result;
                long size = myReader.GetBytes(ordinal, 0, null, 0, 0); //get the length of data 
                result = new byte[size];
                int bufferSize = 1024;
                long bytesRead = 0;
                long inc_bytesRead = 0;
                int curPos = 0;
                while (bytesRead < size)
                {
                    long next_buffer_size = size - bytesRead;
                    if (next_buffer_size > 1024) bufferSize = 1024;
                    else bufferSize = (int)next_buffer_size;
                    inc_bytesRead = myReader.GetBytes(ordinal, curPos, result, curPos, bufferSize);
                    bytesRead += inc_bytesRead;
                    curPos += (int)inc_bytesRead;
                }
                myReader.Close();
            }

            return result;
        }

    }
}
