using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TestStationManagement
{
    public partial class SampleDetails : Form
    {

        private SqlData samples_data;

        public SampleDetails(DataRow r)
        {
            InitializeComponent();
            lblInfo.Text = Constants.SAMPLE_DETAILS_SCREEN_TITLE;
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
            deDOB.Properties.Mask.EditMask = Constants.DATE_FORMAT;
            deDOB.Properties.Mask.UseMaskAsDisplayFormat = true;

            repoDateEditWithTime.Mask.EditMask = Constants.DATE_TIME_FORMAT;
            repoDateEditWithTime.Mask.UseMaskAsDisplayFormat = true;
            colSampleDateTime.ColumnEdit = repoDateEditWithTime;
            colTestDateTime.ColumnEdit = repoDateEditWithTime;

            edName.Text = r["first_name"].ToString();
            edFamilyName.Text = r["family_name"].ToString();
            deDOB.DateTime = (DateTime) r["date_of_birth"];
            edPostCode.Text = r["postcode"].ToString();
            edPhone.Text = r["phone"].ToString();
            edEmail.Text = r["email"].ToString();
            mmNotes.Text = r["notes"].ToString();
            bcTicketId.Text = r["sample_id"].ToString();
            samples_data = new SqlData($"{Constants.SQL_SAMPLES_SELECT} where id = {r["id"].ToString()} ");
            grdSamplesTest.DataSource = samples_data.myBindingSource;
        }

        public static void  show(DataRow r)
        {
            using (SampleDetails patientDetails = new SampleDetails(r))
            {
                patientDetails.ShowDialog();
            }
        }

        private IEnumerable<Control> GetAll(Control control, Type type)
        {
            var controls = control.Controls.Cast<Control>();

            return controls.SelectMany(ctrl => GetAll(ctrl, type))
                                      .Concat(controls)
                                      .Where(c => c.GetType() == type);
        }

        private void gvTestManagement_CustomDrawCell(object sender, DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs e)
        {
            if (e.Column == colTestDateTime)
            {
                if (e.DisplayText == "")
                    e.DisplayText = "N/A";
            }

            if (e.Column == colTestResult)
            {
                DataRow r = gvTestManagement.GetDataRow(e.RowHandle);
                if (r == null) return;
                string test_status = r["test_status"].ToString();
                Rectangle rrect = e.Bounds;
                Brush b = new SolidBrush(Color.White);
                e.Graphics.FillRectangle(b, rrect);
                Rectangle rec = new Rectangle(e.Bounds.X + 80, e.Bounds.Y, 32, 32);
                if (Constants.match_completed(test_status))
                {
                    switch (e.RowHandle)
                    {
                        case 0:
                            e.Appearance.DrawString(e.Cache, "  Invalid", e.Bounds);
                            e.Graphics.DrawImage(Properties.Resources.test_result_invalid_yellow, rec);
                            break;
                        case 1:
                            e.Appearance.DrawString(e.Cache, "  Negative", e.Bounds);
                            e.Graphics.DrawImage(Properties.Resources.test_result_negative_green, rec);
                            break;
                        case 2:
                            e.Appearance.DrawString(e.Cache, "  Positive", e.Bounds);
                            e.Graphics.DrawImage(Properties.Resources.test_result_positive_red, rec);
                            break;
                        case 3:
                            e.Appearance.DrawString(e.Cache, "  Invalid", e.Bounds);
                            e.Graphics.DrawImage(Properties.Resources.test_result_invalid_yellow, rec);
                            break;
                    }

                }
                else
                {
                    e.Appearance.DrawString(e.Cache, "  Pending", e.Bounds);
                    e.Graphics.DrawImage(Properties.Resources.test_result_waiting_blank, rec);
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
    }
}
