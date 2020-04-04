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

        public HTMLDialog(String caption_text, String _html)
        {
            int max_height =  480;
            InitializeComponent();
            Text = caption_text;
            lblHTML.Text = _html;
            this.Height = lblHTML.Height + 100;
            if (this.Height > max_height)
                this.Height = max_height;
        }

        public static DialogResult confirm(String caption_text, String _html)
        {
            using (HTMLDialog dialogHTML = new HTMLDialog(caption_text, _html))
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
