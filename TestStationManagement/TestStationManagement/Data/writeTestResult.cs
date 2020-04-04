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

        public static void write(int _id, string test_result)
        {
            string sql_insert = "update samples set  result_import_time = now(), test_result = @test_result, test_status = @test_status where id = @id ";
            MySqlCommand command = new MySqlCommand(sql_insert, Database.MySql()); // @id, @proj_id, @heading_name, @heading_code, @heading_order, @spec_type
            command.Parameters.Add("@id", MySqlDbType.Int32).Value = _id;
            command.Parameters.Add("@test_result", MySqlDbType.LongText, 255).Value = test_result;
            command.Parameters.Add("@test_status", MySqlDbType.VarChar, 255).Value = Constants.TEST_COMPLETE_TEXT;
            command.ExecuteNonQuery();
        }
    }
}
