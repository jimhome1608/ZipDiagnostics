using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Timers;
using System.Windows.Forms;

namespace TestStationManagement
{
   public class SplashScreen2 : Form
    {
        private Label label1;
        private static String splash_message;
        private System.Windows.Forms.Timer tmr;
        private System.ComponentModel.IContainer components;
        private Label label2;
        private int secs = 0;
        private static Boolean withCounter = true;

        //Delegate for cross thread call to close
        private delegate void CloseDelegate();

        //The type of form to be displayed as the splash screen.
        private static SplashScreen2 splashScreen;

        static public void Start(String msg)
        {
            // Make sure it is only launched once.
            splash_message = msg;
            withCounter = true;
            if (splashScreen != null)
                return;
            Thread thread = new Thread(new ThreadStart(SplashScreen2.ShowForm));
            thread.IsBackground = true;
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
        }

        static public void Start(String msg, int millisecs)
        {
            // Make sure it is only launched once.
            splash_message = msg;
            withCounter = false;
            if (splashScreen != null)
                return;
            Thread thread = new Thread(new ThreadStart(SplashScreen2.ShowForm));
            thread.IsBackground = true;
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
            if (millisecs < 1)
                return;
            var aTimer = new System.Timers.Timer(millisecs);
            // Hook up the Elapsed event for the timer. 
            aTimer.Elapsed += OnTimedEvent;
            aTimer.AutoReset = false;
            aTimer.Enabled = true;
        }

        private static void OnTimedEvent(Object source, ElapsedEventArgs e)
        {
            Stop();
            source = null;
        }

        static private void ShowForm()
        {
            splashScreen = new SplashScreen2();
            splashScreen.InitializeComponent();
            splashScreen.label2.Visible = withCounter;
            splashScreen.label1.Text = splash_message;
            splashScreen.StartPosition = FormStartPosition.CenterScreen;
            Application.Run(splashScreen);
        }

        static public void StopAfter(int millisecs)
        {
            if (splashScreen == null)
                return;
            if (millisecs < 1)
            {
                Stop();
                return;
            }
            var aTimer = new System.Timers.Timer(millisecs);
            // Hook up the Elapsed event for the timer. 
            aTimer.Elapsed += OnTimedEvent;
            aTimer.AutoReset = true;
            aTimer.Enabled = true;
        }

        static public void Stop()
        {
            if (splashScreen == null)
                return;
            splashScreen.Invoke(new CloseDelegate(SplashScreen2.CloseFormInternal));
        }

        static private void CloseFormInternal()
        {
            splashScreen.Close();
            splashScreen = null;
        }

        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.label1 = new System.Windows.Forms.Label();
            this.tmr = new System.Windows.Forms.Timer(this.components);
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(166, 24);
            this.label1.TabIndex = 0;
            this.label1.Text = "Axxin Spec Trace ";
            // 
            // tmr
            // 
            this.tmr.Enabled = true;
            this.tmr.Interval = 1000;
            this.tmr.Tick += new System.EventHandler(this.tmr_Tick);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Dock = System.Windows.Forms.DockStyle.Right;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(546, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(16, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "0";
            // 
            // SplashScreen2
            // 
            this.BackColor = System.Drawing.Color.SkyBlue;
            this.ClientSize = new System.Drawing.Size(562, 67);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "SplashScreen2";
            this.Opacity = 0.85D;
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        private void tmr_Tick(object sender, EventArgs e)
        {
            secs++;
            label2.Text = $"{secs} seconds.";
            if (secs > 60)
                label2.Text = label2.Text + $" ! timeout/error in {120 - secs}";
            else
               if (secs > 30)
                label2.Text = label2.Text + " !This is a bit slow need to review setup";
        }


    }

}
