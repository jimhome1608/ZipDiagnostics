﻿using DevExpress.BarCodes;
using DevExpress.Office;
using DevExpress.Skins;
using DevExpress.XtraEditors;
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
using System.Security.Cryptography;
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

            AppView.get_versions();
            AppView.computer_name = Environment.MachineName.ToString();
            string hostName = Dns.GetHostName();
            AppView.ip_address = Dns.GetHostByName(hostName).AddressList[0].ToString();

            Settings.station_id = Settings.get_station_id();
            if (Settings.station_id.Length < 1)
            {
                throw new Exception("Could not get/set station id");
            }


            openFileDialog1 = new OpenFileDialog()
            {
                FileName = "",
                Filter = "Test Result files (*.dat)|*.dat|All files (*.*)|*.*",
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
                btnPrint.Enabled = AppView.sample_state != AppView.DataStates.Editing;
                btnLogout.Enabled = AppView.sample_state != AppView.DataStates.Editing;

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
                    btnWaitingToBeTested.BackColor = Color.Yellow;
                if (AppView.test_view_state == AppView.DataView.InProgress)
                    btnInProgress.BackColor = Color.Yellow;
                if (AppView.test_view_state == AppView.DataView.Completed)
                    btnCompleted.BackColor = Color.Yellow;
                if (AppView.test_view_state == AppView.DataView.All)
                    btnAll.BackColor = Color.Yellow;
                gvTestManagement.RefreshData();

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
                    bcRunTestTestBarcode.DataBindings.Add(new Binding("text", current_test_data.myBindingSource, "test_barcode"));
                    teRunTestTestBarcode.DataBindings.Add(new Binding("text", current_test_data.myBindingSource, "test_barcode"));

                    teRunTestsName.DataBindings.Add(new Binding("text", current_test_data.myBindingSource, "full_name"));
                    teRunTestsPhone.DataBindings.Add(new Binding("text", current_test_data.myBindingSource, "phone"));
                    deRunTestsDateofBirth.DataBindings.Add(new Binding("text", current_test_data.myBindingSource, "date_of_birth"));
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
     
            const string data = "Ladyshipitdaughtersecuringprocuredorammoreovermr.Putsirsheexercisevicinitycheerfulwondered.Continualsaysuspicionprovisionyouneglectedsircuriosityunwilling.Simplicityendthemselvesincreasingleddaysympathizeyet";
            string original = "Here is some data to encrypt!";
            string key = "";
            string iv = "";
            using (Aes myAes = Aes.Create())
            {
                for (int i = 0; i < data.Length; i++)
                {
                    if (i % 6 == 0 && key.Length != 16)
                        key = key + data.Substring(i, 1);
                    if (i > 20 && i % 4 == 0 && iv.Length != 16)
                        iv = iv + data.Substring(i, 1);
                }
                // Key:Liusnuao.revtrn. InitialVal:noeare.shescteun
                myAes.IV = Encoding.UTF8.GetBytes(iv);
                myAes.Key = Encoding.UTF8.GetBytes(key);
                // Encrypt the string to an array of bytes.
                byte[] encrypted = Encryption.encrypt(original, myAes.Key, myAes.IV);

                // Decrypt the bytes to a string.
                string roundtrip = Encryption.decrypt(encrypted, myAes.Key, myAes.IV);
                Debug.WriteLine($"Key:{Encoding.UTF8.GetString(myAes.Key, 0, myAes.Key.Length)} InitialVal:{Encoding.UTF8.GetString(myAes.IV, 0, myAes.IV.Length)}");
                //Display the original data and the decrypted data.
                Debug.WriteLine($"Original:   {original}");
                Debug.WriteLine($"Round Trip: {roundtrip}");
            }   
            string last_userName = ConfigurationManager.AppSettings["LastUserLogin"];
            if (last_userName != null && last_userName.Length > 1)
                edtUserName.Text = last_userName;
            while (true)
            try
            {                                                                           
                    this.Enabled = true;                    
                    samples_data = new SqlData($"{Constants.SQL_SAMPLES_SELECT} order by save_time desc ");
                    load_info_screen();
                    grdSamplesTest.DataSource = samples_data.myBindingSource;
                    teTestListName.DataBindings.Add(new Binding("text", samples_data.myBindingSource, "full_name"));
                    teTestListPhone.DataBindings.Add(new Binding("text", samples_data.myBindingSource, "phone"));
                    deTestListDateOfBirth.DataBindings.Add(new Binding("text", samples_data.myBindingSource, "date_of_birth"));
                    teTestListPostCode.DataBindings.Add(new Binding("text", samples_data.myBindingSource, "postcode"));
                    teTestListEmail.DataBindings.Add(new Binding("text", samples_data.myBindingSource, "email"));
                    teTestListMemo.DataBindings.Add(new Binding("text", samples_data.myBindingSource, "notes"));
                    break;
            }
            catch (Exception ex)
            {
                    this.Enabled = false;
                    lblInfo.Text = lblInfo.Text + $"<font='Tahoma'size=16 color=red><br>Cannot connect to MySql Database on Host: <b>\"{Database.database_host}\"<color=black></b><br>Please contact support.<br>{ex.Message}";
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
            lblInfo.Text = lblInfo.Text + Database.get_backup_status();
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
                lblInfo.Text = lblInfo.Text + Database.get_backup_status();
            }
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
                btnSettings.Visible = CurrentUser.is_admin;
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

        public string ComputeHash(string input)
        {
            Byte[] inputBytes = Encoding.UTF8.GetBytes(input);

            Byte[] hashedBytes = new MD5CryptoServiceProvider().ComputeHash(inputBytes);
            string result = Convert.ToBase64String(hashedBytes);
            result = result.Replace("==", "");
            return result.ToUpper();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (!valid_to_save())
                return;
            String _sample_id = ComputeHash(DateTime.Now.ToString()+ edName.Text+ deDOB.DateTime.ToString("dd/MM/yyyy"));
            String _html = "<font=Tahoma></font><size=18>Please confirm these details are correct before saving<size=14><br><br>";
            _html = _html + $"Name:<backcolor=yellow>&nbsp;{edName.Text}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Email: <backcolor=yellow>&nbsp;{edEmail.Text}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Phone: <backcolor=yellow>&nbsp;{edPhone.Text}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Date of Birth: <backcolor=yellow>&nbsp;{deDOB.DateTime.ToString("dd/MM/yyyy")}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Post Code: <backcolor=yellow>&nbsp;{edPostCode.Text}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Notes: <backcolor=yellow>&nbsp;{mmNotes.Text}&nbsp;<backcolor=control><br><br>";
            _html = _html + $"Ticket #: {_sample_id}&<br>";
            HTMLDialog.confirm("Confirm", _html);
            if (HTMLDialog.dialogResult != DialogResult.OK)
                return;

            //string sql_insert = "insert into samples (internal_id, id,save_time,first_name,family_name, date_of_birth,postcode,phone,email,notes,sample_id,test_result,test_status) " +
            //$"values (_id, _save_time, _first_name, _family_name, _date_of_birth, _postcode, _phone, _email, _notes, _sample_id, _test_result, _test_status);";

            string sql_insert = "insert into samples (station_id, id,save_time,first_name,family_name, date_of_birth,postcode,phone,email,notes,sample_id,test_result,test_status, web_saved) " + 
                $"values( @station_id, get_next_id() , @save_time, @first_name, @family_name, @date_of_birth, @postcode, @phone, @email, @notes, @sample_id, @test_result, @test_status, @web_saved);";
            MySqlCommand command = new MySqlCommand(sql_insert, Database.MySql()); // @id, @proj_id, @heading_name, @heading_code, @heading_order, @spec_type
            command.Parameters.Add("@station_id", MySqlDbType.VarChar).Value = Settings.station_id;
            command.Parameters.Add("@save_time", MySqlDbType.DateTime, 11).Value = DateTime.Now;
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
            command.Parameters.Add("@web_saved", MySqlDbType.VarChar, 255).Value = 0;
            command.ExecuteNonQuery();
            edTicketId.Text = _sample_id;
            bcTicketId.Text = _sample_id;
            int sample_id = Database.sql_to_int("select max(id) from samples");           
            AppView.sample_state = AppView.DataStates.Saved;
            if (WebApi.save_sample(sample_id))
                Database.execute_non_query($"update samples set web_saved = 1 where id = {sample_id}");
            samples_data.refresh();
            String test_r = $"<SAMPLE_ID>{_sample_id}</SAMPLE_ID>\n<RESULT>this is a mock test result, not a real test.</RESULT>";
            File.WriteAllText(AppView.temp_directory + "\\sample_test_result.dat", test_r);
            File.WriteAllText($"F:\\{_sample_id}.dat", test_r);
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
            String _sample_id = ComputeHash(DateTime.Now.ToString() + edName.Text + deDOB.DateTime.ToString("dd/MM/yyyy"));
            String _html = "<font=Tahoma></font><size=18>Please confirm the test is running on this sample...<size=14><br><br>";
            HTMLDialog.confirm("Confirm", _html);
            if (HTMLDialog.dialogResult != DialogResult.OK)
                return;
            r["test_status"] = Constants.TEST_IN_PROGRESS_TEXT;
            r["test_start_time"] = DateTime.Now;            
            current_test_data.save_to_db();
            if (!WebApi.save_sample(r))
                Database.execute_non_query($"update samples set web_saved = 0 where id = {r["id"].ToString()}");
            samples_data.refresh();
            tbTestStatus.BackColor = Constants.TEST_IN_PROGRESS_BACKCOLOR;
        }


        private void gvTestManagement_CustomDrawCell(object sender, DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs e)
        {
            if (e.Column == ColTestStatusTests)
            {
                String s = e.CellValue.ToString().ToLower();
                if (Constants.match_in_progress(s))
                    e.Appearance.BackColor = Constants.TEST_IN_PROGRESS_BACKCOLOR;
                else if (Constants.match_completed(s))
                    e.Appearance.BackColor = Constants.TEST_COMPLETED_BACKCOLOR;
                else
                    e.Appearance.BackColor = Constants.TEST_WAITING_BACKCOLOR;
            } //
            if (e.Column == colWebSaved)
            {
                Color c =Color.Yellow;
                String s = e.CellValue.ToString().ToLower();
                if (s == "1")
                    c = Constants.WEB_SAVED_OK_COLOR;
                e.DisplayText = "";
                Rectangle rrect = e.Bounds;
                Brush brush;
                brush = new SolidBrush(c);
                rrect.Width = rrect.Height - 5;
                rrect.Height = rrect.Width;
                rrect.X += 10;
                e.Graphics.FillEllipse(brush, rrect);
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

            String sample_id = "";
            String test_result = "";
            String result_file = openFileDialog1.FileName;

            XmlReaderSettings settings = new XmlReaderSettings();
            settings.ConformanceLevel = ConformanceLevel.Fragment;
            settings.IgnoreWhitespace = true;
            settings.IgnoreComments = true;
            XmlReader reader = XmlReader.Create(result_file, settings);
            while (reader.Read())
            {
                switch (reader.NodeType)
                {
                    case XmlNodeType.Element:
                        if (reader.Name == "SAMPLE_ID")
                        {
                            reader.Read();
                            sample_id = reader.Value;
                        }
                        if (reader.Name == "RESULT")
                        {
                            reader.Read();
                            test_result = reader.Value;
                        }
                        break;
                }
            }
            if (sample_id == "")
                return;
            int sample_count_found = Database.sql_to_int($"select count(*) from samples where  sample_id = '{sample_id}'") ;
            if (sample_count_found < 1)
            {
                String err_message =
                     $"No matching Sample found\n\nFile: {Path.GetFileName(result_file)}\nSample ID: {sample_id}\nFile Content\n========================\n";
                ErrorLog.write_error_log("Import Test Results", err_message + File.ReadAllText(result_file));
                err_message =
                   $"<b>No matching Sample found</b>\n\nFile: {Path.GetFileName(result_file)}\nSample ID: {sample_id}\n\n";
                XtraMessageBox.Show(err_message, "Import Test Results", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (sample_count_found > 1)
            {
                String err_message =
                     $"Multiple matching Sample found \n\nFile: {Path.GetFileName(result_file)}\nSample ID: {sample_id}\nFile Content\n========================\n";
                ErrorLog.write_error_log("Import Test Results", err_message + File.ReadAllText(result_file));
                err_message =
                   $"<b>Multiple matching Sample found</b>\n\nFile: {Path.GetFileName(result_file)}\nSample ID: {sample_id}\n\n";
                XtraMessageBox.Show(err_message, "Import Test Results", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int id = Database.sql_to_int($"select id from samples where  sample_id = '{sample_id}'");
            string sample_info = Database.sql_to_string($"select concat(first_name,' ',family_name,' ', DATE_FORMAT(date_of_birth,'%d/%c/%Y')) from samples where  id = {id}");
            string test_status = Database.sql_to_string($"select test_status from samples where  id = {id}");
            if (Constants.match_completed(test_status))
            {
                ErrorLog.write_error_log("Import Test Results", $"Test Result for sample {sample_info} has already imported.\n\n" + File.ReadAllText(result_file));
                XtraMessageBox.Show($"Test Result for sample\n{sample_info}\nhas <b>already been imported</b>.\n\nNo need to import this file again.", "Import Test Results", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            
            writeTestResult.write(id, test_result);
            if (!WebApi.save_sample(id))
                Database.execute_non_query($"update samples set web_saved = 0 where id = {id}");
            samples_data.refresh();
            
            XtraMessageBox.Show($"Sample for {sample_info}\nhas been updated with results.", "Import Test Results", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnSettings_Click(object sender, EventArgs e)
        {

        }

        private void gvTestManagement_DoubleClick(object sender, EventArgs e)
        {
            DataRow r = gvTestManagement.GetFocusedDataRow();
            if (r == null) return;
            WebApi.save_sample(r);
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
            s = s.Replace("<br>", "\n").Replace("</br>", "").Replace("<b>", "").Replace("</b>", "").Replace("<font='Tahoma'size=12>","").Replace("<image=ZipDiagnosticsLogo.jpg>","");
            Clipboard.SetData(DataFormats.Text, (Object)s);
            XtraMessageBox.Show("Test Station setup info has been copied to clipboard", "Copy", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void edit_PreviewKeyDown(object sender, PreviewKeyDownEventArgs e)
        {
            if (!(sender is Control))
                return;
            if (sender == mmNotes && e.KeyData == Keys.Enter)
                return;
            Debug.WriteLine(e.KeyData);// Tab, Shift
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
