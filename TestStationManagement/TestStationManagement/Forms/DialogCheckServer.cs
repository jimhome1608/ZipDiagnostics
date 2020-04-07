using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TestStationManagement
{
    public partial class DialogCheckServer : Form
    {

        public static DialogResult dialogResult = DialogResult.None;

        public DialogCheckServer()
        {
            InitializeComponent();
        }

        public static DialogResult ask()
        {
            using (DialogCheckServer dialogCheckServer = new DialogCheckServer())
            {
                dialogCheckServer.btnSave.Enabled = false;
                dialogCheckServer.tbAddress.Text = Database.database_host;
                dialogCheckServer.ShowDialog();
                return dialogResult;
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.AppSettings.Settings["DatabaseHost"].Value = tbAddress.Text;
            config.Save();
            Database.clear_connection();
            Database.database_host = tbAddress.Text;
           dialogResult = DialogResult.OK;
            Close();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            dialogResult = DialogResult.Cancel;
            Close();
        }

        private void btnTestConnection_Click(object sender, EventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;
            string res = Database.check_connection(tbAddress.Text);
            Cursor.Current = Cursors.Default;
            btnSave.Enabled = res == "";
            if (res != "")
            {
                String err_message =
                   $"Test Connection: <b>Failed</b>.\nCould not connect to host: {tbAddress.Text}\n\n" +
                   $"{res}";
                XtraMessageBox.Show(err_message, "Test Connection", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                String _message =
                  $"Test Connection: <b>Success</b>.\nClick save to make {tbAddress.Text} the Database Host at this location.\n\n"; 
                XtraMessageBox.Show(_message, "Test Connection", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
