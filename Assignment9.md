I made a simple application to go into the file registry, detect if there is an NjRAT file in the C:\ directory, and checks if NjRAT is currently running.

Then to remove it, it removes that file it found, takes NjRAT and windows out of the default startup apps, and kill the current tasks.

# Executable File

https://github.com/NathanHoxworth/CS-479-NMSU/blob/main/NjRAT.exe

# Video



# Code



        
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.Data;
    using System.Drawing;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Windows.Forms;
    using System.IO;
    using System.Diagnostics;
    using Microsoft.Win32;

    namespace NjRAT
    {
        public partial class Form1 : Form
        {
            public Form1()
            {
                InitializeComponent();
            }
            private void scanButton_Click_1(object sender, EventArgs e)
            {
                bool njRATDetected = ScanForNjRAT();
                bool njRATRunning = IsNjRATRunning();

                if (njRATDetected)
                {
                    MessageBox.Show("Indicators of njRAT detected in the filesystem.");
                }
                else
                {
                    MessageBox.Show("No indicators of njRAT detected in the filesystem.");
                }

                if (njRATRunning)
                {
                    MessageBox.Show("njRAT is currently running.");
                }
                else
                {
                    MessageBox.Show("njRAT is not currently running.");
                }
            }

            private void removeButton_Click_1(object sender, EventArgs e)
            {
                try
                {
                    RemoveNjRATFile();
                    DisableNjRATStartup();
                    StopProcesses();
                    MessageBox.Show("njRAT removal completed successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error removing njRAT: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
    
            
            private bool ScanForNjRAT()
            {
                string njRATPath = @"C:\njRAT.exe";
                return File.Exists(njRATPath);
            }
    
            bool IsNjRATRunning()
            {
                Process[] processes = Process.GetProcessesByName("njRAT");
                return processes.Length > 0;
            }
    
            private void RemoveNjRATFile()
            {
                string njRATPath = @"C:\njRAT.exe";
                if (File.Exists(njRATPath))
                {
                    File.Delete(njRATPath);
                }
            }
    
            private void DisableNjRATStartup()
            {
                string keyName = @"SOFTWARE\Microsoft\Windows\CurrentVersion\Run";
                using (RegistryKey key = Registry.CurrentUser.OpenSubKey(keyName, true))
                {
                    if (key != null)
                    {
                        key.DeleteValue("njRAT", false);
                    }
                }
            }
    
            private void StopProcesses()
            {
                foreach (Process process in Process.GetProcesses())
                {
                    if (process.ProcessName.Equals("njRAT", StringComparison.OrdinalIgnoreCase) ||
                        process.ProcessName.Equals("windows", StringComparison.OrdinalIgnoreCase))
                    {
                        process.Kill();
                    }
                }
            }
        }
    }
