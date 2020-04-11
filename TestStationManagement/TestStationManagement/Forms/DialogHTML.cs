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
    public partial class HTMLDialog : Form
    {
        public static DialogResult dialogResult = DialogResult.None;

        public HTMLDialog(String caption_text, String _html, String b1, string b2)
        {
            int max_height =  480;
            InitializeComponent();
            btn_cancel.Text = b1;
            btnOK.Text = b2;
            if (btn_cancel.Text == "")
                btn_cancel.Visible = false;
            Text = caption_text;
            lblHTML.Text = _html;
            this.Height = lblHTML.Height + 100;
            if (this.Height > max_height)
                this.Height = max_height;
        }

        public static DialogResult confirm(String caption_text, String _html, String b1, string b2)
        {
            using (HTMLDialog dialogHTML = new HTMLDialog(caption_text, _html, b1, b2))
            {
                dialogHTML.ShowDialog();
                return dialogResult;
            }
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            dialogResult = DialogResult.OK;
            Close();
        }

        private void btn_cancel_Click(object sender, EventArgs e)
        {
            dialogResult = DialogResult.Cancel;
            Close();
        }
    }
}
