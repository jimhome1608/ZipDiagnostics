using DevExpress.BarCodes;
using DevExpress.Office;
using DevExpress.Skins;
using DevExpress.Utils.Helpers;
using DevExpress.XtraEditors;
using Force.Crc32;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using TestStationManagement.Data;
using static System.Collections.Specialized.BitVector32;

namespace TestStationManagement
{
    public partial class frmMain : Form
    {
        
        private OpenFileDialog openFileDialog1;

        public static event EventHandler current_test_data_id_changed;
        Dictionary<Control, Control> shift_focus = new Dictionary<Control, Control>();

        private static int _current_test_data_id = -1;
        public static int current_test_data_id
        {
            get
            {
                return _current_test_data_id;
            }
            set
            {
                _current_test_data_id = value;
                if (current_test_data_id_changed != null)
                {
                    current_test_data_id_changed(null, null);
                }
            }
        }

        public SqlData samples_data, current_test_data = null;

        public frmMain()
        {


            AppView.error_log = Directory.GetCurrentDirectory() + "..\\..\\error_log";
            if (!Directory.Exists(AppView.error_log))
                Directory.CreateDirectory(AppView.error_log);
            AppView.temp_directory = Directory.GetCurrentDirectory() + "..\\..\\temp";
            if (!Directory.Exists(AppView.temp_directory))
                Directory.CreateDirectory(AppView.temp_directory);
            AppView.print_directory = Directory.GetCurrentDirectory() + "..\\..\\print";
            if (!Directory.Exists(AppView.print_directory))
                Directory.CreateDirectory(AppView.print_directory);
            AppView.dump_directory = Directory.GetCurrentDirectory() + "..\\..\\dump";
            if (!Directory.Exists(AppView.dump_directory))
                Directory.CreateDirectory(AppView.dump_directory);

            InitializeComponent();

            lblTestInstructions.Text = Constants.RUN_TEST_INSTRUCTIONS;
            AppView.get_versions();
            AppView.computer_name = Environment.MachineName.ToString();
            string hostName = Dns.GetHostName();
            AppView.ip_address = Dns.GetHostByName(hostName).AddressList[0].ToString();

            openFileDialog1 = new OpenFileDialog()
            {
                FileName = "",
                Filter = "Test Result files (*.csv)|*.csv|All files (*.*)|*.*",
                Title = "Import Test Results"
            };
            Text = $"Test Station - Version: {AppView.version_info.test_station}";

            shift_focus.Add(edName, edFamilyName);
            shift_focus.Add(edFamilyName, deDOB);
            shift_focus.Add(deDOB, edPostCode);
            shift_focus.Add(edPostCode, edPhone);
            shift_focus.Add(edPhone, edEmail);
            shift_focus.Add(edEmail, mmNotes);
            shift_focus.Add(mmNotes, edName);

            deDOB.Properties.Mask.EditMask = Constants.DATE_FORMAT;
            deDOB.Properties.Mask.UseMaskAsDisplayFormat = true;
            deRunTestsDateofBirth.Properties.Mask.EditMask = Constants.DATE_FORMAT;
            deRunTestsDateofBirth.Properties.Mask.UseMaskAsDisplayFormat = true;

            repoDateEditWithTime.Mask.EditMask = Constants.DATE_TIME_FORMAT;
            repoDateEditWithTime.Mask.UseMaskAsDisplayFormat = true;
            colSampleDateTime.ColumnEdit = repoDateEditWithTime;
            colTestDateTime.ColumnEdit = repoDateEditWithTime;



            lblInfoSampleCollection.Text = "<br><size=24>Sample Collection<size=14><br>";
            lblInfoTestLists.Text = "<br><size=24>Test Lists<size=14><br>";
            lblInfoRunTest.Text = "<br><size=24>Run Test<size=14><br>";
            Skin skin_ = TabSkins.GetSkin(DevExpress.LookAndFeel.UserLookAndFeel.Default.ActiveLookAndFeel);
            SkinElement element = skin_[TabSkins.SkinTabHeader];
            element.Properties["AllowTouch"] = false;
            element.ContentMargins.Top = 10;
            element.ContentMargins.Bottom = 10;
            element.ContentMargins.Left = 10;
            element.ContentMargins.Right = 10;

            TabControl.LayoutChanged();

            clear_runtest_controls();

            CurrentUser.user_status_changed += (s, e) =>
            {
                if (CurrentUser.user_status == CurrentUser.UserStatus.LoggedOut)
                {
                    TabControl.ShowTabHeader = DevExpress.Utils.DefaultBoolean.False;
                    lblLoggedIn3.Text = "";
                    lblLoggedIn.Text = "";
                    lblLoggedIn2.Text = "";
                }                    
                else
                {
                    TabControl.ShowTabHeader = DevExpress.Utils.DefaultBoolean.True;
                    lblLoggedIn3.Text = $"<b>{CurrentUser.user_full_name}</b> ";
                    lblLoggedIn.Text = $"<b>{CurrentUser.user_full_name}</b> ";
                    lblLoggedIn2.Text = $"<b>{CurrentUser.user_full_name}</b> ";
                }
                    
                tbLogin.PageVisible = CurrentUser.user_status == CurrentUser.UserStatus.LoggedOut;
                tbSampleEntry.PageVisible = CurrentUser.user_status == CurrentUser.UserStatus.LoggedIn;
                tbTestManagement.PageVisible = CurrentUser.user_status == CurrentUser.UserStatus.LoggedIn;
                tbRunTests.PageVisible = CurrentUser.user_status == CurrentUser.UserStatus.LoggedIn;

            };

            CurrentUser.user_status = CurrentUser.UserStatus.LoggedOut;

            // click one othe buttons on the Sample Collection tab
           AppView.sample_state_changed += (s, e) =>
            {
                btnSave.Enabled = AppView.sample_state == AppView.DataStates.Editing;
                btnCancel.Enabled = AppView.sample_state == AppView.DataStates.Editing;
                btnNew.Enabled = AppView.sample_state != AppView.DataStates.Editing;
                btnPrintSampleLabel.Enabled = AppView.sample_state != AppView.DataStates.Editing;
                btnLogout.Enabled = AppView.sample_state != AppView.DataStates.Editing;
                bntPrintTicket.Enabled = AppView.sample_state == AppView.DataStates.Saved && edTicketId.Text.Length > 1; 
                btnPrintSampleLabel.Enabled = AppView.sample_state == AppView.DataStates.Saved && edTicketId.Text.Length > 1;
                if (AppView.sample_state == AppView.DataStates.Editing)
                    set_new_sample();
                if (AppView.sample_state == AppView.DataStates.Saved)
                    set_saved_sample();
            };


            // click one of the view buttons on the Test Lists tab
            AppView.test_view_state_changed += (s, e) =>
            {
                btnWaitingToBeTested.BackColor = Color.Transparent;
                btnInProgress.BackColor = Color.Transparent;
                btnCompleted.BackColor = Color.Transparent;
                btnAll.BackColor = Color.Transparent;
                if (AppView.test_view_state == AppView.DataView.Waiting)
                    btnWaitingToBeTested.BackColor = Constants.BACKGROUND_COLOR_FOR_SELECTED_VIEW_BUTTON;
                if (AppView.test_view_state == AppView.DataView.InProgress)
                    btnInProgress.BackColor = Constants.BACKGROUND_COLOR_FOR_SELECTED_VIEW_BUTTON;
                if (AppView.test_view_state == AppView.DataView.Completed)
                    btnCompleted.BackColor = Constants.BACKGROUND_COLOR_FOR_SELECTED_VIEW_BUTTON;
                if (AppView.test_view_state == AppView.DataView.All)
                    btnAll.BackColor = Constants.BACKGROUND_COLOR_FOR_SELECTED_VIEW_BUTTON;
                gvTestManagement.RefreshData();

            };


            Database.backup_percent_changed += (s, e) =>
            {
                colWebSaved.Caption = "Backup " + $"{Math.Round(Database.backup_percent, 0)}%";
                btnWaitingToBeTested.Text = $"Waiting ({Database.test_waiting})";
                btnInProgress.Text = $"In Progress ({Database.test_in_progress})";
                btnCompleted.Text = $"Completed ({Database.test_completed})";
                btnAll.Text = $"All ({Database.sample_count})";


            };

            AppView.sample_state = AppView.DataStates.Saved;
            AppView.test_view_state = AppView.DataView.All;

            current_test_data_id_changed += (s, e) =>
            {
                current_test_data = null;
                btnStartTest.Enabled = current_test_data_id >= 0;
                tbTestStatus.BackColor = SystemColors.Control;
                if (current_test_data_id >= 0)
                {
                    tbTestStatus.DataBindings.Clear();
                    bcRunTestTestBarcode.DataBindings.Clear();
                    teRunTestTestBarcode.DataBindings.Clear();
                    teRunTestsName.DataBindings.Clear();
                    teRunTestsPhone.DataBindings.Clear();
                    deRunTestsDateofBirth.DataBindings.Clear();
                    teRunTestsPostCode.DataBindings.Clear();
                    teRunTestsEmail.DataBindings.Clear();
                    teRunTestsMemo.DataBindings.Clear();

                    current_test_data = new SqlData($"{Constants.SQL_SAMPLES_SELECT} where id = {current_test_data_id} ");

                    tbTestStatus.DataBindings.Add(new Binding("text", current_test_data.myBindingSource, "test_status"));
                    if (Constants.match_in_progress(tbTestStatus.Text))
                        tbTestStatus.BackColor = Constants.TEST_IN_PROGRESS_BACKCOLOR;
                    else if (Constants.match_completed(tbTestStatus.Text))
                        tbTestStatus.BackColor = Constants.TEST_COMPLETED_BACKCOLOR;
                    else
                        tbTestStatus.BackColor = Constants.TEST_WAITING_BACKCOLOR;

                    teRunTestsName.DataBindings.Add(new Binding("text", current_test_data.myBindingSource, "full_name"));
                    teRunTestsPhone.DataBindings.Add(new Binding("text", current_test_data.myBindingSource, "phone"));
                    deRunTestsDateofBirth.DataBindings.Add(new Binding("datetime", current_test_data.myBindingSource, "date_of_birth"));
                    teRunTestsPostCode.DataBindings.Add(new Binding("text", current_test_data.myBindingSource, "postcode"));
                    teRunTestsEmail.DataBindings.Add(new Binding("text", current_test_data.myBindingSource, "email"));
                    teRunTestsMemo.DataBindings.Add(new Binding("text", current_test_data.myBindingSource, "notes"));

                    current_test_data.refresh();
                }
            };

            current_test_data_id = -1;

            var c = GetAll(this, typeof(Panel));
            foreach (Control con in c)
            {
                if (con is null)
                    continue;
                if (con is Panel)
                {
                    Panel p = (Panel)con;
                    p.BorderStyle = BorderStyle.None;
                }
                
            }
            deDOB.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.DateTimeAdvancingCaret;
            XtraMessageBox.AllowHtmlText = true;
            AppView.get_versions();
            //TabControl.ShowTabHeader = DevExpress.Utils.DefaultBoolean.False;
            //  lblInfo.Text = "<size=24>Sample Collection<size=14><br>";                
            string last_userName = ConfigurationManager.AppSettings["LastUserLogin"];
            if (last_userName != null && last_userName.Length > 1)
                edtUserName.Text = last_userName;
            while (true)
            try
            {
                    pnlLoginLeft.Enabled = true;
                    Settings.station_id = Settings.get_station_id();
                    if (Settings.station_id.Length < 1)
                    {
                        throw new Exception("Could not get/set station id");
                    }
                    samples_data = new SqlData($"{Constants.SQL_SAMPLES_SELECT} order by sample_time desc, test_time desc ");
                    load_info_screen();
                    grdSamplesTest.DataSource = samples_data.myBindingSource;
                    break;
            }
            catch (Exception ex)
            {
                    pnlLoginLeft.Enabled = false;
                    lblInfo.Text = lblInfo.Text + $"<font='Tahoma'size=16 color=red><br>Cannot connect to MySql Database on Host: <b>\"{Database.database_host}\"<color=black></b><br>Please contact support.<br>{ex.Message}";
                    lblInfo.Text = lblInfo.Text + "<br><b>Setup</b>";
                    lblInfo.Text = lblInfo.Text + $"<br>Station ID: {Settings.station_id}";
                    lblInfo.Text = lblInfo.Text + $"<br>Database Host: {Database.database_host}";
                    lblInfo.Text = lblInfo.Text + "<br><br><b>This Computer</b>";
                    lblInfo.Text = lblInfo.Text + $"<br>Computer Name: {AppView.computer_name}";
                    lblInfo.Text = lblInfo.Text + $"<br>IP Address: {AppView.ip_address}";
                    if (new[] { "localhost", "127.0.0.1", $"{AppView.computer_name.ToLower()}", $"{AppView.ip_address}" }.Any(c2 => Database.database_host.ToLower().Contains(c2)))
                    {
                        lblInfo.Text = lblInfo.Text + $"<br><b>Note:</b> This is the machine with the SQL Database.";
                        lblInfo.Text = lblInfo.Text + $"<br>Please configure each other computer to use this IP Address or Computer Name";
                    }
                    if  (DialogCheckServer.ask() != DialogResult.OK)
                    {
                            break;
                    }
            }            
        }

        private void load_info_screen()
        {
            WebApi.CheckForInternetConnection();
            lblInfo.Text = $" <font='Tahoma'size=12><br><image=ZipDiagnosticsLogo.jpg><br><br>Test Station - Version: {AppView.version_info.test_station}<br>© 2020 Zip Diagnostics,  All Rights Reserved<br><br>";
            lblInfo.Text = lblInfo.Text + "<br><b>Setup</b>";            
            lblInfo.Text = lblInfo.Text + $"<br>Station ID: {Settings.station_id}";
            lblInfo.Text = lblInfo.Text + $"<br>Database Host: {Database.database_host}";
            lblInfo.Text = lblInfo.Text + $"<br>Database Connected: <b>OK</b>";
            string internet_connection_ok = (WebApi.internet_connection_ok) ? "<br>Internet Connection: <b>OK</b>" : "<br>Internet Connection: <b><color=red>Not Available <color=black></b>";
            lblInfo.Text = lblInfo.Text + internet_connection_ok;
            Database.refresh_backup_percent();
            if (Database.need_backup != 0 && WebApi.internet_connection_ok)
            {
                lblInfo.Text = lblInfo.Text + $"<br>Backup in progress ({DateTime.Now.ToString()}) ";
                SqlData need_backup = new SqlData($"select * from samples where ifnull(web_saved,0) <> 1 ");
                foreach (DataRow dr in need_backup.myDataTable.Rows)
                {
                    if (WebApi.save_sample(dr))
                    {
                        Database.execute_non_query($"update samples set web_saved=1 where station_id ={dr["station_id"]} and id ={dr["id"]}");
                        need_backup.save_to_db();
                    }
                }
                lblInfo.Text = lblInfo.Text + $"<br>Backup finished. ({DateTime.Now.ToString()}) ";
            }
            lblInfo.Text = lblInfo.Text + Database.get_backup_status();            
            samples_data.refresh();
            lblInfo.Text = lblInfo.Text + "<br><br><b>This Computer</b>";
            lblInfo.Text = lblInfo.Text + $"<br>Computer Name: {AppView.computer_name}";
            lblInfo.Text = lblInfo.Text + $"<br>IP Address: {AppView.ip_address}";
            if (new[] { "localhost", "127.0.0.1", $"{AppView.computer_name.ToLower()}", $"{AppView.ip_address}" }.Any(c => Database.database_host.ToLower().Contains(c)))
            {
                lblInfo.Text = lblInfo.Text + $"<br><b>Note:</b> This is the machine with the SQL Database.";
                lblInfo.Text = lblInfo.Text + $"<br>Please configure each other computer to use this IP Address or Computer Name";
            }                
        }

        private IEnumerable<Control> GetAll(Control control, Type type)
        {
            var controls = control.Controls.Cast<Control>();

            return controls.SelectMany(ctrl => GetAll(ctrl, type))
                                      .Concat(controls)
                                      .Where(c => c.GetType() == type);
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            String dev_expres_required = "19.2.6.0"; //18.2.8.0
            String dev_express_version = typeof(SimpleButton).Assembly.GetName(true).Version.ToString();
            if (dev_express_version != dev_expres_required)
            {
                String err_message =
                    "The DevExpress libraries need to be updated on this pc.\n\nPlease run the latest installer to fix this issue." +
                    $"\n\nFound Devexpress: {dev_express_version}, require {dev_expres_required}";
                XtraMessageBox.Show(err_message, "DevExpress Libraries", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                Close();
                return;
            }
            CurrentUser.load_from_db(edtUserName.Text, edtUserPassword.Text, AppView.version_info.test_station, "test_station", "main");
            if (CurrentUser.status == 1)
            {                
                TabControl.SelectedTabPage = tbSampleEntry;
                CurrentUser.user_status = CurrentUser.UserStatus.LoggedIn;
                return;
            };
            MessageBox.Show("User Name and password combination not correct", "Login", MessageBoxButtons.OK, MessageBoxIcon.Warning);



        }

        private void btnLogout_Click(object sender, EventArgs e)
        {            
            CurrentUser.user_status = CurrentUser.UserStatus.LoggedOut;
            TabControl.SelectedTabPage = tbLogin;
            load_info_screen();
        }

        private void set_new_sample()
        {
            edName.BackColor = Constants.EDITING_BACKCOLOR;
            edFamilyName.BackColor = Constants.EDITING_BACKCOLOR;
            edEmail.BackColor = Constants.EDITING_BACKCOLOR;
            edPhone.BackColor = Constants.EDITING_BACKCOLOR;
            deDOB.BackColor = Constants.EDITING_BACKCOLOR;
            edPostCode.BackColor = Constants.EDITING_BACKCOLOR;
            edEmail.BackColor = Constants.EDITING_BACKCOLOR;
            mmNotes.BackColor = Constants.EDITING_BACKCOLOR;
            edFamilyName.BackColor = Constants.EDITING_BACKCOLOR;

            edTicketId.ReadOnly = false;
            edName.ReadOnly = false;
            edFamilyName.ReadOnly = false;
            edEmail.ReadOnly = false;
            edPhone.ReadOnly = false;
            deDOB.ReadOnly = false;
            edPostCode.ReadOnly = false;
            edEmail.ReadOnly = false;
            mmNotes.ReadOnly = false;
            edFamilyName.ReadOnly = false;

            clear_sample_controls();
        }

        private void clear_sample_controls()
        {
            edTicketId.Text = "";
            bcTicketId.Text = "";
            edName.Text = "";
            edFamilyName.Text = "";
            edEmail.Text = "";
            edPhone.Text = "";
            deDOB.Text = "";
            edPostCode.Text = "";
            mmNotes.Text = "";
        }

        private void clear_runtest_controls()
        {
            teRunTestsName.Text = "";
            teRunTestsPhone.Text = "";
            deRunTestsDateofBirth.Text = "";
            deRunTestsDateofBirth.Text = "";
            tbTestStatus.Text = "";
            teRunTestsEmail.Text = "";
            teRunTestsMemo.Text = "";
            teRunTestsPostCode.Text = "";
            mmNotes.Text = "";
            bcRunTestTestBarcode.Text = "";
            teRunTestTestBarcode.Text = "";
        }


        private void set_saved_sample()
        {
            edName.BackColor = SystemColors.Control;
            edFamilyName.BackColor = SystemColors.Control;
            edEmail.BackColor = SystemColors.Control;
            edPhone.BackColor = SystemColors.Control;
            deDOB.BackColor = SystemColors.Control;
            edPostCode.BackColor = SystemColors.Control;
            mmNotes.BackColor = SystemColors.Control;
            edFamilyName.BackColor = SystemColors.Control;

            edTicketId.ReadOnly = true;
            edName.ReadOnly = true;
            edFamilyName.ReadOnly = true;
            edEmail.ReadOnly = true;
            edPhone.ReadOnly = true;
            deDOB.ReadOnly = true;
            edPostCode.ReadOnly = true;
            edEmail.ReadOnly = true;
            mmNotes.ReadOnly = true;
        }

        private string clean_sql_str(string s)
        {
            s = s.Replace("'", "`");
            return s;
        }

        private Boolean valid_to_save()
        {
            if (edName.Text.Trim() == "")
            {
                edName.Focus();
                XtraMessageBox.Show("<b>Name</b> is a required field", "Save", MessageBoxButtons.OK, MessageBoxIcon.Information); 
                return false;
            }
            if (deDOB.Text.Trim() == "")
            {
                deDOB.Focus();
                XtraMessageBox.Show("<b>Date of Birth</b> is a required field", "Save", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            if (edPostCode.Text.Trim() == "")
            {
                edPostCode.Focus();
                XtraMessageBox.Show("<b>Post Code</b> is a required field", "Save", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            if (edPhone.Text.Trim() == "")
            {
                edPhone.Focus();
                XtraMessageBox.Show("<b>Phone</b> is a required field", "Save", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            return true;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (!valid_to_save())
                return;
            int next_id = Database.sql_to_int("select get_next_id()");
            DateTime dt = DateTime.Now;            
            String _dob = deDOB.DateTime.ToString(Constants.DATE_FORMAT);
            string hash_this = edName.Text + edFamilyName.Text + deDOB.DateTime.ToString("yyyyMMdd");
            uint _hash_ing = Crc32Algorithm.Compute(Encoding.UTF8.GetBytes(hash_this));
            string _sample_id = "SRARS-CoV-2_" + _hash_ing.ToString("X") + "_" + dt.ToString(Constants.DATE_TIME_FORMAT_SAMPLE_ID).ToUpper();
            String _html = "<font=Tahoma></font><size=18>Please confirm these details are correct before saving<size=14><br><br>";
            _html = _html + $"Name:<backcolor=yellow>&nbsp;{edName.Text}  {edFamilyName.Text}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Email: <backcolor=yellow>&nbsp;{edEmail.Text}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Phone: <backcolor=yellow>&nbsp;{edPhone.Text}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Date of Birth: <backcolor=yellow>&nbsp;{_dob}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Post Code: <backcolor=yellow>&nbsp;{edPostCode.Text}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Notes: <backcolor=yellow>&nbsp;{mmNotes.Text}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Sample ID: {_sample_id}&<br>";
            HTMLDialog.confirm("Confirm", _html, "GO BACK", "SAVE");
            if (HTMLDialog.dialogResult != DialogResult.OK)
                return;

            string sql_insert =
                "insert into samples (station_id, id, sample_time, first_name, family_name, date_of_birth, postcode, phone, email, notes,"+
                "sample_id, test_result, test_status, test_start_time, result_import_time, web_saved, sample_user_name, sample_user_id) " +
                "values "+
                "(@station_id, @id, @sample_time, @first_name, @family_name, @date_of_birth, @postcode, @phone, @email, @notes, " +
                "@sample_id, @test_result, @test_status, @test_start_time, @result_import_time, @web_saved, @sample_user_name, @sample_user_id); ";
            MySqlCommand command = new MySqlCommand(sql_insert, Database.MySql());
            command.Parameters.Add("@station_id", MySqlDbType.VarChar, 255).Value = Settings.station_id;
            command.Parameters.Add("@id", MySqlDbType.Int32).Value = next_id;
            command.Parameters.Add("@sample_time", MySqlDbType.DateTime, 11).Value = dt;
            command.Parameters.Add("@first_name", MySqlDbType.VarChar, 255).Value = edName.Text;
            command.Parameters.Add("@family_name", MySqlDbType.VarChar, 255).Value = edFamilyName.Text;
            command.Parameters.Add("@date_of_birth", MySqlDbType.DateTime, 11).Value = deDOB.DateTime.ToString("yyyy-MM-dd");
            command.Parameters.Add("@postcode", MySqlDbType.VarChar, 255).Value = edPostCode.Text;
            command.Parameters.Add("@phone", MySqlDbType.VarChar, 255).Value = edPhone.Text;
            command.Parameters.Add("@email", MySqlDbType.VarChar, 255).Value = edEmail.Text;
            command.Parameters.Add("@notes", MySqlDbType.LongText, 255).Value = mmNotes.Text;
            command.Parameters.Add("@sample_id", MySqlDbType.VarChar, 255).Value = _sample_id;
            command.Parameters.Add("@test_result", MySqlDbType.LongText, 255).Value = "";
            command.Parameters.Add("@test_status", MySqlDbType.VarChar, 255).Value = Constants.TEST_WAITING_TEXT;
            command.Parameters.Add("@test_start_time", MySqlDbType.DateTime, 11).Value = null;
            command.Parameters.Add("@result_import_time", MySqlDbType.DateTime, 11).Value = null;
            command.Parameters.Add("@sample_user_name", MySqlDbType.VarChar, 255).Value = CurrentUser.user_full_name;
            command.Parameters.Add("@sample_user_id", MySqlDbType.Int32).Value = CurrentUser.user_id;
            command.Parameters.Add("@web_saved", MySqlDbType.Int32).Value = 0;
            command.ExecuteNonQuery();

            edTicketId.Text = _sample_id;
            bcTicketId.Text = _sample_id;
            int sample_id = Database.sql_to_int("select max(id) from samples");           
            AppView.sample_state = AppView.DataStates.Saved;
            if (WebApi.save_sample(sample_id))
            {
                Database.execute_non_query($"update samples set web_saved = 1 where id = {sample_id}");                
            }
            Database.refresh_backup_percent();
            samples_data.refresh();
            string mock_result_file = $"{AppView.temp_directory}\\{_sample_id}";
            string _final_result = "P+";
            Random random = new Random();
            int random_number = random.Next(3);
            if (random_number == 0)
                _final_result = "!";
            if (random_number == 1)
                _final_result = "N-";
            dt = dt.AddMinutes(5);
            ResultFile.make_result_file(_sample_id, "!", dt.ToString(Constants.DATE_FORMAT), dt.ToString(Constants.RESULT_TIME_FORMAT), mock_result_file + "_inconclusive.csv");
            dt = dt.AddMinutes(5);
            ResultFile.make_result_file(_sample_id, "P+", dt.ToString(Constants.DATE_FORMAT), dt.ToString(Constants.RESULT_TIME_FORMAT), mock_result_file + "_positive.csv");
            dt = dt.AddMinutes(5);
            ResultFile.make_result_file(_sample_id, "N-", dt.ToString(Constants.DATE_FORMAT), dt.ToString(Constants.RESULT_TIME_FORMAT), mock_result_file + "_negative.csv");
            
            
        }

        private void btnNew_Click(object sender, EventArgs e)
        {                        
            AppView.sample_state = AppView.DataStates.Editing;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            DialogResult dr = XtraMessageBox.Show("Are you sure you want to cancel this New Record?", "Cancel New Reacord", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr != DialogResult.Yes)
                return;
            clear_sample_controls();
            set_saved_sample();
            AppView.sample_state = AppView.DataStates.Saved;
        }        


        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (current_test_data.myDataTable.Rows.Count < 1)
                return;
            DataRow r = current_test_data.myDataTable.Rows[0];
            if (r == null) return;
            string test_status = r["test_status"].ToString().ToLower();
            if (Constants.match_in_progress(test_status))
            {
                XtraMessageBox.Show("The test on this sample is already flagged as In Progres.", "Test Started", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (Constants.match_completed(test_status))
            {
                XtraMessageBox.Show("This test on this sample has been completed and cannot be started.", "Test Started", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            String _html = "<font=Tahoma></font><size=18>Please confirm the test is running on this sample...<size=14><br><br>";
            HTMLDialog.confirm("Confirm", _html, "GO BACK", "SAVE");
            if (HTMLDialog.dialogResult != DialogResult.OK)
                return;
            r["test_status"] = Constants.TEST_IN_PROGRESS_TEXT;
            r["test_start_user_id"] = CurrentUser.user_id;
            r["test_start_user_name"] = CurrentUser.user_full_name;
            r["test_status"] = Constants.TEST_IN_PROGRESS_TEXT;
            current_test_data.save_to_db();
            if (!WebApi.save_sample(r))
                Database.execute_non_query($"update samples set web_saved = 0 where id = {r["id"].ToString()}");
            Database.refresh_backup_percent();
            samples_data.refresh();
            tbTestStatus.BackColor = Constants.TEST_IN_PROGRESS_BACKCOLOR;
        }


        private void gvTestManagement_CustomDrawCell(object sender, DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs e)
        {
            if (e.Column == colSampleID)
            {
                if (e.DisplayText.Trim().ToLower() == "retest")
                {
                    e.Appearance.Font = new Font("Arial", 8, FontStyle.Bold);
                }
            }
            if (e.Column == colTestDateTime)
            {
                if (e.DisplayText == "")
                    e.DisplayText = "N/A";
            }

            if (e.Column == colTestResult)
            {
                String test_result = e.CellValue.ToString().ToUpper().Trim();
                Rectangle rrect = e.Bounds;
                Brush b = new SolidBrush(Color.White);
                e.Graphics.FillRectangle(b, rrect);                
                Rectangle rec = new Rectangle(e.Bounds.X + 80, e.Bounds.Y, 32, 32);
                switch (test_result)
                {
                    case "!":
                        e.Appearance.DrawString(e.Cache, "  Invalid", e.Bounds);
                        e.Graphics.DrawImage(Properties.Resources.test_result_invalid_yellow, rec);
                        break;
                    case "N-":
                        e.Appearance.DrawString(e.Cache, "  Negative", e.Bounds);
                        e.Graphics.DrawImage(Properties.Resources.test_result_negative_green, rec);
                        break;
                    case "P+":
                        e.Appearance.DrawString(e.Cache, "  Positive", e.Bounds);
                        e.Graphics.DrawImage(Properties.Resources.test_result_positive_red, rec);
                        break;
                    case "":
                        e.Appearance.DrawString(e.Cache, "  Pending", e.Bounds);
                        e.Graphics.DrawImage(Properties.Resources.test_result_waiting_blank, rec);
                        break;
                }                    
                e.Handled = true;
            }
            if (e.Column == ColTestStatusTests)
            {
                String s = e.CellValue.ToString().ToLower();
                if (Constants.match_in_progress(s))
                    e.Appearance.BackColor = Constants.TEST_IN_PROGRESS_BACKCOLOR;
                else if (Constants.match_completed(s))
                    e.Appearance.BackColor = Constants.TEST_COMPLETED_BACKCOLOR;
                else
                    e.Appearance.BackColor = Constants.TEST_WAITING_BACKCOLOR;
                //
            } //
            if (e.Column == colWebSaved )
            {
                Color c =Color.Yellow;
                String s = e.CellValue.ToString().ToLower();
                bool backed_up_ok = s == "1";
                e.DisplayText = "";
                Rectangle rrect = e.Bounds;
                Rectangle r = new Rectangle(e.Bounds.X + 12, e.Bounds.Y + 5, 16, 16);
                if (backed_up_ok)
                    e.Graphics.DrawImage(Properties.Resources.apply_16x16_no_color3, r); //   
                else
                {
                    e.Graphics.DrawImage(Properties.Resources.mini_circle, r); //   mini_circle
                }                
                e.Handled = true;
            } //col
            if (e.Column == colTestResultSent)
            {
                Rectangle rrect = e.Bounds;
                Rectangle r = new Rectangle(e.Bounds.X + 12, e.Bounds.Y + 5, 16, 16);
                switch (e.RowHandle)
                {
                    case 0:
                        e.Graphics.DrawImage(Properties.Resources.apply_16x16_no_color3, r);
                        break;
                    case 1:
                        e.Graphics.DrawImage(Properties.Resources.mini_circle, r);
                        break;
                    case 2:
                        e.Graphics.DrawImage(Properties.Resources.apply_16x16_no_color3, r);
                        break;
                    case 3:
                        e.Graphics.DrawImage(Properties.Resources.mini_circle, r);
                        break;
                }
                e.Handled = true;
            } //col

        }

        private void gvTestManagement_CustomRowFilter(object sender, DevExpress.XtraGrid.Views.Base.RowFilterEventArgs e)
        {
            DataRow r = gvTestManagement.GetDataRow(e.ListSourceRow);
            if (r == null) return;
            string test_status = r["test_status"].ToString().ToLower();
            if (AppView.test_view_state == AppView.DataView.Waiting)
                if (Constants.match_waiting(test_status))
                    return;
            if (AppView.test_view_state == AppView.DataView.InProgress)
                if (Constants.match_in_progress(test_status))
                    return;
            if (AppView.test_view_state == AppView.DataView.Completed)
                if (Constants.match_completed(test_status))
                    return;
            if (AppView.test_view_state == AppView.DataView.All)
                return;
            e.Visible = false;
            e.Handled = true;
        }

        private void btnWaitingToBeTested_Click(object sender, EventArgs e)
        {
            AppView.test_view_state = AppView.DataView.Waiting;
        }

        private void btnInProgress_Click(object sender, EventArgs e)
        {
            AppView.test_view_state = AppView.DataView.InProgress;
        }

        private void btnCompleted_Click(object sender, EventArgs e)
        {
            AppView.test_view_state = AppView.DataView.Completed;
        }

        private void btnAll_Click(object sender, EventArgs e)
        {
            AppView.test_view_state = AppView.DataView.All;
        }

        private void btnLoadTest_Click(object sender, EventArgs e)
        {
            DataRow r = gvTestManagement.GetFocusedDataRow();
            if (r == null) return;
            current_test_data_id = (int) r["id"];
        }

        private void te_scan_sample_id_TextChanged(object sender, EventArgs e)
        {
            //SVVALBIHTJAIHXOM/XTPFQ
            int samle_id = Database.try_sql_to_int($"select id from samples where sample_id = '{te_scan_sample_id.Text.Trim()}' ", -1);
            if (samle_id < 0)
            {
                clear_runtest_controls();
            }
            current_test_data_id = samle_id;
        }

        private void deTestListDateOfBirth_QueryPopUp(object sender, CancelEventArgs e)
        {
            e.Cancel = true;
        }

        private void deRunTestsDateofBirth_QueryPopUp(object sender, CancelEventArgs e)
        {
            e.Cancel = true;
        }

        private void btnImportTestResults_Click_1(object sender, EventArgs e)
        {
            samples_data.refresh();
            if (openFileDialog1.ShowDialog() != DialogResult.OK)
                return;
            bool tested_already_need_to_insert_new_record = false;
            int id_of_sample_to_update = -1;
            int test_id_of_sample_to_update = -1;
            string result_file = openFileDialog1.FileName;
            ResultFile resFile = new ResultFile();
            bool res = resFile.load_from_file(result_file);
            SqlData samples = new SqlData($"select test_time, id, test_id from samples where  sample_id = '{resFile.sample_id}' and station_id = {Settings.station_id}");            
            foreach (DataRow dr in samples.myDataTable.Rows)
            {
                if (dr["test_time"] == System.DBNull.Value)
                {
                    id_of_sample_to_update = (int)dr["id"];
                    test_id_of_sample_to_update = (int)dr["test_id"];
                    break;
                }                                  
                if ((DateTime) dr["test_time"] == resFile.test_date_time)
                {
                    ErrorLog.write_error_log("Import Test Results", $"Test Result for sample {resFile.sample_id} has already imported.\n\n" + File.ReadAllText(result_file));
                    XtraMessageBox.Show($"Test Result for sample\n{resFile.sample_id}\nhas <b>already been imported</b>.\n\nNo need to import this file again.", "Import Test Results", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                tested_already_need_to_insert_new_record = true;
            }            
            if (samples.myDataTable.Rows.Count < 1)
            {
                String err_message =
                     $"No matching Sample found\n\nFile: {Path.GetFileName(result_file)}\nSample ID: {resFile.sample_id}\nFile Content\n========================\n";
                ErrorLog.write_error_log("Import Test Results", err_message + File.ReadAllText(result_file));
                err_message =
                   $"<b>No matching Sample found</b>\n\nFile: {Path.GetFileName(result_file)}\nSample ID: {resFile.sample_id}\n\n";
                XtraMessageBox.Show(err_message, "Import Test Results", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (tested_already_need_to_insert_new_record)
            {
                int next_text_id = Database.try_sql_to_int($"select max(test_id) from samples where sample_id = '{resFile.sample_id}'", 0);
                next_text_id++;
                test_id_of_sample_to_update = next_text_id;
                string sql_clone =
                $"insert into samples (select station_id, id, {next_text_id},  sample_time, first_name,  family_name, date_of_birth,  postcode,  phone,  email, notes,  sample_id,   \n" +
                "test_result,  test_status,  test_start_time,  result_import_time,  test_time, web_saved,  sample_user_name,  test_start_user_name,   \n" +
                "test_result_user_name,  sample_user_id, test_start_user_id,  test_result_user_id,  result_file \n" +
                $"from samples where station_id = {Settings.station_id} and sample_id = '{resFile.sample_id}' limit 1);";
                Database.execute_non_query(sql_clone);
                id_of_sample_to_update = Database.sql_to_int($"select id from samples where sample_id = '{resFile.sample_id}' and test_id = {next_text_id} and station_id = {Settings.station_id}");
            }

            writeTestResult.write(id_of_sample_to_update, test_id_of_sample_to_update,  resFile); ;
            if (!WebApi.save_sample(id_of_sample_to_update))
                Database.execute_non_query($"update samples set web_saved = 0 where id = {id_of_sample_to_update}");
            Database.refresh_backup_percent();
            samples_data.refresh();
            
            XtraMessageBox.Show($"Import Success, 1 file[s] imported from USB.", "Import Test Results", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnSettings_Click(object sender, EventArgs e)
        {

        }

        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (CurrentUser.user_status == CurrentUser.UserStatus.LoggedIn)
            {
                XtraMessageBox.Show("<br>Click the <b>Logout Button</b> and then you can close Test Station<br><br>Need to logout before closing", "Close", MessageBoxButtons.OK, MessageBoxIcon.Information);
                e.Cancel = true;
                return;
            }            
        }


        private void btnCopy_Click(object sender, EventArgs e)
        {
            String s = lblInfo.Text;
            s = s.Replace("<br>", "\n").Replace("</br>", "").Replace("<b>", "").Replace("</b>", "").Replace("<font='Tahoma'size=12>", "").Replace("<image=ZipDiagnosticsLogo.jpg>", "").Replace("<font='Tahoma'size=16 color=red>", "").Replace("<color=black>", "");
            Clipboard.SetData(DataFormats.Text, (Object)s);
            XtraMessageBox.Show("Test Station setup info has been copied to clipboard", "Copy", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnAbout_Click_1(object sender, EventArgs e)
        {
            string _html = $" <font='Tahoma'size=12><br><image=ZipDiagnosticsLogo.jpg><br><br>Test Station - Version: {AppView.version_info.test_station}<br>© 2020 Zip Diagnostics,  All Rights Reserved<br><br>";
            _html = _html + "<b>Setup</b>";
            _html = _html + $"<br>Station ID: {Settings.station_id}";
            _html = _html + $"<br>Database Host: {Database.database_host}";
            _html = _html + $"<br>Database Connected: <b>OK</b>";
            string internet_connection_ok = (WebApi.internet_connection_ok) ? "<br>Internet Connection: <b>OK</b>" : "<br>Internet Connection: <b><color=red>Not Available <color=black></b>";
            _html = _html + internet_connection_ok;           
            samples_data.refresh();
            _html = _html + "<br><b>This Computer</b>";
            _html = _html + $"<br>Computer Name: {AppView.computer_name}";
            _html = _html + $"<br>IP Address: {AppView.ip_address}";
            if (new[] { "localhost", "127.0.0.1", $"{AppView.computer_name.ToLower()}", $"{AppView.ip_address}" }.Any(c => Database.database_host.ToLower().Contains(c)))
            {
                _html = _html + $"<br><b>Note:</b> This is the machine with the SQL Database.";
                _html = _html + $"<br>Please configure each other computer to use this IP Address or Computer Name";
            }
            HTMLDialog.confirm("About", _html, "", "OK");
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            samples_data.refresh();
            Database.refresh_backup_percent();
        }

        private void colDetailsButtonEdit_ButtonClick(object sender, DevExpress.XtraEditors.Controls.ButtonPressedEventArgs e)
        {
            DataRow r = gvTestManagement.GetFocusedDataRow();
            if (r == null) return;
            SampleDetails.show(r);
        }

        private void edit_PreviewKeyDown(object sender, PreviewKeyDownEventArgs e)
        {
            if (!(sender is Control))
                return;
            if (sender == mmNotes && e.KeyData == Keys.Enter)
                return;
            if (e.KeyData == Keys.Tab || e.KeyData == Keys.Enter || e.KeyData == (Keys.Tab | Keys.Shift) || e.KeyData == (Keys.Enter | Keys.Shift))
            {
                Control result;
                if (e.KeyData == (Keys.Tab | Keys.Shift) || e.KeyData == (Keys.Enter | Keys.Shift))
                {
                    var key = shift_focus.FirstOrDefault(x => x.Value == (Control)sender).Key;
                    if (key != null)
                    {
                        e.IsInputKey = true;
                        key.Focus();
                    }
                }
                else
                {
                    if (shift_focus.TryGetValue((Control)sender, out result))
                    {
                        e.IsInputKey = true;
                        result.Focus();
                    }
                }
            }
                
        }

    }
}
