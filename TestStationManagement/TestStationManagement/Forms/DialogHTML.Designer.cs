namespace TestStationManagement
{
    partial class HTMLDialog
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.xtraScrollableControl2 = new DevExpress.XtraEditors.XtraScrollableControl();
            this.lblHTML = new DevExpress.XtraEditors.LabelControl();
            this.pnl_bottom = new System.Windows.Forms.Panel();
            this.btn_cancel = new DevExpress.XtraEditors.SimpleButton();
            this.btnOK = new DevExpress.XtraEditors.SimpleButton();
            this.xtraScrollableControl2.SuspendLayout();
            this.pnl_bottom.SuspendLayout();
            this.SuspendLayout();
            // 
            // xtraScrollableControl2
            // 
            this.xtraScrollableControl2.Controls.Add(this.lblHTML);
            this.xtraScrollableControl2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.xtraScrollableControl2.Location = new System.Drawing.Point(0, 0);
            this.xtraScrollableControl2.Name = "xtraScrollableControl2";
            this.xtraScrollableControl2.Size = new System.Drawing.Size(646, 392);
            this.xtraScrollableControl2.TabIndex = 23;
            // 
            // lblHTML
            // 
            this.lblHTML.AllowHtmlString = true;
            this.lblHTML.Appearance.Font = new System.Drawing.Font("Tahoma", 12F);
            this.lblHTML.Appearance.Options.UseFont = true;
            this.lblHTML.Appearance.Options.UseTextOptions = true;
            this.lblHTML.Appearance.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Bottom;
            this.lblHTML.Appearance.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap;
            this.lblHTML.AutoSizeMode = DevExpress.XtraEditors.LabelAutoSizeMode.Vertical;
            this.lblHTML.Dock = System.Windows.Forms.DockStyle.Top;
            this.lblHTML.Location = new System.Drawing.Point(0, 0);
            this.lblHTML.Name = "lblHTML";
            this.lblHTML.Padding = new System.Windows.Forms.Padding(5);
            this.lblHTML.Size = new System.Drawing.Size(646, 29);
            this.lblHTML.TabIndex = 22;
            this.lblHTML.Text = "info";
            // 
            // pnl_bottom
            // 
            this.pnl_bottom.Controls.Add(this.btn_cancel);
            this.pnl_bottom.Controls.Add(this.btnOK);
            this.pnl_bottom.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.pnl_bottom.Location = new System.Drawing.Point(0, 392);
            this.pnl_bottom.Name = "pnl_bottom";
            this.pnl_bottom.Size = new System.Drawing.Size(646, 49);
            this.pnl_bottom.TabIndex = 24;
            // 
            // btn_cancel
            // 
            this.btn_cancel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btn_cancel.Appearance.Font = new System.Drawing.Font("Tahoma", 10F);
            this.btn_cancel.Appearance.Options.UseFont = true;
            this.btn_cancel.Appearance.Options.UseTextOptions = true;
            this.btn_cancel.Appearance.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap;
            this.btn_cancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_cancel.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftCenter;
            this.btn_cancel.ImageOptions.Location = DevExpress.XtraEditors.ImageLocation.BottomRight;
            this.btn_cancel.Location = new System.Drawing.Point(340, 8);
            this.btn_cancel.Name = "btn_cancel";
            this.btn_cancel.Size = new System.Drawing.Size(140, 30);
            this.btn_cancel.TabIndex = 15;
            this.btn_cancel.Text = "GO BACK ";
            this.btn_cancel.Click += new System.EventHandler(this.btn_cancel_Click);
            // 
            // btnOK
            // 
            this.btnOK.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnOK.Appearance.Font = new System.Drawing.Font("Tahoma", 10F);
            this.btnOK.Appearance.Options.UseFont = true;
            this.btnOK.Appearance.Options.UseTextOptions = true;
            this.btnOK.Appearance.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap;
            this.btnOK.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.btnOK.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftCenter;
            this.btnOK.ImageOptions.Location = DevExpress.XtraEditors.ImageLocation.BottomRight;
            this.btnOK.Location = new System.Drawing.Point(500, 8);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(140, 30);
            this.btnOK.TabIndex = 14;
            this.btnOK.Text = "SAVE ";
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // HTMLDialog
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(646, 441);
            this.Controls.Add(this.xtraScrollableControl2);
            this.Controls.Add(this.pnl_bottom);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Name = "HTMLDialog";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "DialogHTML";
            this.xtraScrollableControl2.ResumeLayout(false);
            this.pnl_bottom.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraEditors.XtraScrollableControl xtraScrollableControl2;
        private DevExpress.XtraEditors.LabelControl lblHTML;
        private System.Windows.Forms.Panel pnl_bottom;
        private DevExpress.XtraEditors.SimpleButton btn_cancel;
        private DevExpress.XtraEditors.SimpleButton btnOK;
    }
}