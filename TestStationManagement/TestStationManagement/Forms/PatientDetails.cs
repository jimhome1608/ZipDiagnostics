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
    public partial class PatientDetails : Form
    {
        public PatientDetails(DataRow r)
        {
            InitializeComponent();
            lblInfo.Text = "<size=24>Patient Details<size=14><br>";
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
            edName.Text = r["first_name"].ToString();
            edFamilyName.Text = r["family_name"].ToString();
            deDOB.DateTime = (DateTime) r["date_of_birth"];
            edPostCode.Text = r["postcode"].ToString();
            edPhone.Text = r["phone"].ToString();
            edEmail.Text = r["email"].ToString();
            mmNotes.Text = r["notes"].ToString();
            edTicketId.Text = r["sample_id"].ToString();
            bcTicketId.Text = r["sample_id"].ToString();
        }

        public static void  show(DataRow r)
        {
            using (PatientDetails patientDetails = new PatientDetails(r))
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


    }
}
