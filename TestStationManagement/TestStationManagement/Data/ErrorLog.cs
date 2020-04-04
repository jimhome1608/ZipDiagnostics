using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestStationManagement.Data;

namespace TestStationManagement
{
    public static class ErrorLog
    {

        public static void write_error_log(string key_word, string data)
        {
            string sql_insert = "insert into error_log (id, event_time, computer, user, key_word, data) " +
                            $"values (@id, @event_time, @computer, @user, @key_word, @data);";
            MySqlCommand command = new MySqlCommand(sql_insert, Database.MySql()); // @id, @proj_id, @heading_name, @heading_code, @heading_order, @spec_type
            command.Parameters.Add("@id", MySqlDbType.Int32).Value = 0;
            command.Parameters.Add("@event_time", MySqlDbType.DateTime, 11).Value = DateTime.Now;
            command.Parameters.Add("@computer", MySqlDbType.VarChar, 255).Value = Environment.MachineName.ToString(); ;
            command.Parameters.Add("@user", MySqlDbType.VarChar, 255).Value = CurrentUser.user_full_name;
            command.Parameters.Add("@key_word", MySqlDbType.VarChar, 255).Value = key_word;
            command.Parameters.Add("@data", MySqlDbType.LongText, 255).Value = data;
            command.ExecuteNonQuery();
        }
    }
}
