using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Windows.Forms;

namespace TestStationManagement
{
    public class SqlData
    {
        public MySqlDataAdapter mySqlDataAdapter;
        public DataTable myDataTable;
        public BindingSource myBindingSource;
        private String sql;
        public String data_source;
        public String nak_value;


        public string GetStringField(String _fieldName)
        {
            if (myDataTable.Rows.Count < 1) return "";
            DataRow r = myDataTable.Rows[0];
            if (!DBNull.Value.Equals(r[_fieldName]))
                return r[_fieldName].ToString();
            return "";
        }

        public Boolean check_nak_value(String _value)
        {
            Boolean result = false;
            if (data_source.IndexOf("eval_matrix") < 0)
                return result;
            if (nak_value is null)
                return result;
            if (nak_value.Trim() == "")
                return result;
            if (_value.ToLower() == nak_value.ToLower())
                result = true;
            return result;
        }

        public DataRow find_record(String _fieldName, int _value)
        {
            for (int _idx = 0; _idx < myDataTable.Rows.Count; _idx++)
            {
                DataRow r = myDataTable.Rows[_idx];
                if (r.RowState == DataRowState.Deleted) continue;
                if (r[_fieldName] == null) continue;
                if ((int)r[_fieldName] != _value) continue;
                return r;
            }
            return null;
        }


        public SqlData(String _sql, String _data_source = "")
        {
            sql = _sql;
            data_source = _data_source;
            mySqlDataAdapter = new MySqlDataAdapter();
            mySqlDataAdapter.SelectCommand = new MySqlCommand(sql, Database.MySql());
            MySqlCommandBuilder mySqlCommandBuilder = new MySqlCommandBuilder(mySqlDataAdapter);
            myDataTable = new DataTable();
            if (_sql.Trim() == "") return;
            mySqlDataAdapter.Fill(myDataTable);
            try
            {
                DataRow dr1, dr_next_up;
                for (int row_idx = myDataTable.Rows.Count - 1; row_idx > 0; row_idx--)
                {
                    dr1 = myDataTable.Rows[row_idx];
                    dr_next_up = myDataTable.Rows[row_idx - 1];
                    if (dr1["sample_id"].ToString() == dr_next_up["sample_id"].ToString())
                    {
                        dr1["sample_id"] = " retest";
                    }
                }
            }
            catch
            {

            }
            myBindingSource = new BindingSource();
            myBindingSource.DataSource = myDataTable;
        }

        public void refresh()
        {
            myDataTable.Clear();
            mySqlDataAdapter.Fill(myDataTable);
            try
            {
                DataRow dr1, dr_next_up;
                for (int row_idx = myDataTable.Rows.Count - 1; row_idx > 0; row_idx--)
                {
                    dr1 = myDataTable.Rows[row_idx];
                    dr_next_up = myDataTable.Rows[row_idx-1];
                    if (dr1["sample_id"].ToString() == dr_next_up["sample_id"].ToString())
                    {
                        dr1["sample_id"] = " retest";
                    } 
                }
            }
            catch
            {

            }

        }


        public Boolean save_to_db()
        {
            //   if (mySqlDataAdapter.UpdateCommand != null) MessageBox.Show(mySqlDataAdapter.UpdateCommand.CommandText);  
            int i = 0;
            foreach (DataRow r in myDataTable.Rows)
            {
                r.EndEdit();
            };
            // myDataTable.AcceptChanges();
            i = mySqlDataAdapter.Update(myDataTable);
            return i != 0;
        }

    }

}
