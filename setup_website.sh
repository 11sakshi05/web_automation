#!/bin/bash

LOGFILE="apache_setup.log"

echo "======================================"
echo "  Apache Web Server Auto Installer"
echo "  Red Hat Enterprise Linux 10"
echo "======================================"

echo "[INFO] Starting installation..." | tee -a $LOGFILE

# Update system
sudo dnf update -y >> $LOGFILE 2>&1

# Install Apache
echo "[INFO] Installing Apache httpd..." | tee -a $LOGFILE
sudo dnf install httpd -y >> $LOGFILE 2>&1

# Start Apache
echo "[INFO] Starting Apache service..." | tee -a $LOGFILE
sudo systemctl start httpd >> $LOGFILE 2>&1

# Enable Apache at boot
echo "[INFO] Enabling Apache on boot..." | tee -a $LOGFILE
sudo systemctl enable httpd >> $LOGFILE 2>&1

# Allow HTTP in firewall (if active)
echo "[INFO] Configuring firewall..." | tee -a $LOGFILE
sudo firewall-cmd --permanent --add-service=http >> $LOGFILE 2>&1
sudo firewall-cmd --reload >> $LOGFILE 2>&1

INDEX="/var/www/html/index.html"

echo ""
echo "======================================"
echo "Opening index.html for editing"
echo "Paste your HTML code"
echo "Press CTRL+D when finished"
echo "======================================"

sudo tee $INDEX > /dev/null

echo "[INFO] HTML file saved." | tee -a $LOGFILE

# Restart Apache
echo "[INFO] Restarting Apache..." | tee -a $LOGFILE
sudo systemctl restart httpd >> $LOGFILE 2>&1

# Get public IP
PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)

echo ""
echo "======================================"
echo " Website is now LIVE!"
echo "======================================"
echo "Open this URL in your browser:"
echo ""
echo "http://$PUBLIC_IP"
echo ""
echo "======================================"

echo "[INFO] Website deployed at http://$PUBLIC_IP" >> $LOGFILE
