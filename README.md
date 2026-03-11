# AI-Powered Linux Service Installer & Web Deployment (RHEL 10)

## Overview

This project demonstrates how to automate Linux server tasks using **Bash scripting and cloud infrastructure**.
The script installs and configures the **Apache HTTP server (httpd)** on a **Red Hat Enterprise Linux 10 EC2 instance**, allows the user to add HTML code, and deploys a live website that can be accessed through the server’s public IP.

The project shows how basic **DevOps automation** can simplify server setup and website deployment.

---

## Features

* Automated installation of Apache (httpd)
* Starts and enables the web server service
* Opens the `index.html` file for editing
* Allows users to paste their HTML code
* Deploys the website instantly
* Displays the live server URL
* Maintains a log file for installation and deployment activities

---

## Technologies Used

* Bash Scripting
* Red Hat Enterprise Linux 10
* AWS EC2
* Apache HTTP Server (httpd)
* HTML, CSS, JavaScript

---

## Project Workflow

1. Launch an EC2 instance running RHEL 10.
2. Connect to the instance using SSH.
3. Run the automated Bash script.
4. The script installs and configures the Apache server.
5. User pastes HTML code into the `index.html` file.
6. Apache restarts automatically.
7. The website becomes accessible through the public IP address.

---
## Architecture Diagram & Commands Used

### Architecture Diagram

```
+----------------------+
|        User          |
|  (Runs Bash Script)  |
+----------+-----------+
           |
           | SSH
           v
+------------------------------+
|      AWS EC2 Instance        |
|   (RHEL 10 Linux Server)     |
+--------------+---------------+
               |
               | Executes
               v
+------------------------------+
|      Bash Automation Script  |
|        setup_website.sh      |
+--------------+---------------+
               |
               | Installs & Configures
               v
+------------------------------+
|      Apache Web Server       |
|           (httpd)            |
+--------------+---------------+
               |
               | Hosts Website
               v
+------------------------------+
|   /var/www/html/index.html   |
|  (HTML + CSS + JavaScript)   |
+--------------+---------------+
               |
               | HTTP Request
               v
+------------------------------+
|      Web Browser Client      |
|    http://EC2-Public-IP      |
+------------------------------+
```

### Explanation

1. The user connects to the AWS EC2 instance using SSH.
2. The Bash automation script runs on the RHEL server.
3. The script installs and configures the Apache HTTP server.
4. The user adds HTML code to the `index.html` file.
5. Apache hosts the webpage.
6. The website becomes accessible through the EC2 public IP.

---

### Commands Used

**1. Connect to EC2 Instance**

```
ssh -i keypair.pem ec2-user@<public-ip>
```

**2. Update System**

```
sudo dnf update -y
```

**3. Install Apache HTTP Server**

```
sudo dnf install httpd -y
```

**4. Start Apache Service**

```
sudo systemctl start httpd
```

**5. Enable Apache on Boot**

```
sudo systemctl enable httpd
```

**6. Configure Firewall**

```
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
```

**7. Edit the Webpage**

```
sudo nano /var/www/html/index.html
```

**8. Restart Apache**

```
sudo systemctl restart httpd
```

**9. Check Apache Status**

```
sudo systemctl status httpd
```

**10. Access Website**

```
http://<EC2-public-ip>
```


## How to Run the Script

### 1. Clone the Repository

```
git clone https://github.com/yourusername/ai-apache-installer.git
cd ai-apache-installer
```

### 2. Make Script Executable

```
chmod +x setup_website.sh
```

### 3. Run the Script

```
./setup_website.sh
```

---

## AWS Security Group Requirement

Make sure the EC2 security group allows **HTTP traffic on port 80**.

Inbound Rule:

* Type: HTTP
* Port: 80
* Source: 0.0.0.0/0

---

## Output

After running the script and adding HTML code, your website will be available at:

```
http://<your-ec2-public-ip>
```

---

## Log File

All installation and deployment details are stored in:

```
apache_setup.log
```

---


## Learning Outcomes

* Understanding Linux service management
* Automating server setup using Bash
* Deploying a website on AWS EC2
* Basic DevOps and cloud deployment concepts

---

## Author

Developed as part of a **cloud and Linux automation learning project**.
