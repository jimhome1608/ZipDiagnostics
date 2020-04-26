using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestStationManagement.Data
{
    public static class writeTestResult
    {

        public static void write(int _id, ResultFile resultFile)
        {
            string sql_insert = 
                "update samples set  result_import_time = now(), test_result = @test_result, test_status = @test_status, test_time = @test_time, "+
                "test_result_user_name = @test_result_user_name, test_result_user_id = @test_result_user_id, result_file = @result_file where id = @id ";
            MySqlCommand command = new MySqlCommand(sql_insert, Database.MySql()); 
            command.Parameters.Add("@id", MySqlDbType.Int32).Value = _id;
            command.Parameters.Add("@test_result", MySqlDbType.LongText, 255).Value = resultFile.final_result;
            command.Parameters.Add("@test_time", MySqlDbType.Datetime, 11).Value = resultFile.test_date_time;
            command.Parameters.Add("@test_status", MySqlDbType.VarChar, 255).Value = Constants.TEST_COMPLETE_TEXT;
            command.Parameters.Add("@test_result_user_name", MySqlDbType.VarChar, 255).Value = CurrentUser.user_full_name;
            command.Parameters.Add("@test_result_user_id", MySqlDbType.Int32, 11).Value = CurrentUser.user_id;
            command.Parameters.Add("@result_file", MySqlDbType.LongText, 11).Value = Database.str_clean(resultFile.file_content);
            command.ExecuteNonQuery();
        }
    }
}
