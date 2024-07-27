# Ansible Playbook: MySQL Configuration
## Overview
This Ansible playbook is designed to set up and configure a MySQL server on a target host. It performs the following tasks:
- Sets the hostname of the server.
- Installs MySQL and necessary dependencies.
- Starts and enables the MySQL service.
- Creates a MySQL user with specified privileges.
- Copies an SQL initialization script to the server.
- Creates a MySQL database.
- Checks for the existence of a table and imports it if it does not exist.
- Configures MySQL to allow remote connections.

## Prerequisites
- Ansible installed on your local machine.
- Access to a target host that you want to configure as a MySQL server.
- The target host should be accessible via SSH.
- The target host should be running a Debian-based Linux distribution (e.g., Ubuntu).

## Variables
The playbook uses the following variables:
- `hostname`: Desired hostname for the server.
- `db_name`: Name of the database to be created.
- `db_table`: Name of the table to be checked and created.
- `db_user`: MySQL username to be created.
- `db_password`: Password for the MySQL user.

## Tasks
### 1. Set Hostname
Sets the hostname of the server to `db_server` using the `hostnamectl` command.

### 2. Install MySQL and Dependencies
Installs MySQL server, client, Python MySQL library, and MySQL client development libraries.

### 3. Start and Enable MySQL Service
Starts the MySQL service and ensures it is enabled to start on boot.

### 4. Create MySQL User
Creates a MySQL user with the specified username, password, and privileges. The user can connect from any host.
### 5. Copy SQL Script
Copies the SQL initialization script (`init.sql`) from the control machine to the remote server's home directory.
### 6. Create Database
Creates a MySQL database with the specified name if it does not already exist.
### 7. Check for Existing Table
Checks if the specified table exists in the database. The result is registered for further processing.
### 8. Import Database Table
Imports the SQL script into the database only if the specified table does not already exist. This task is conditional based on the result of the table check.
### 9. Enable Remote Login
Updates the MySQL configuration file to allow remote connections by modifying the `bind-address` setting. A backup of the configuration file is created before making changes.
### 10. Restart MySQL Service
Restarts the MySQL service to apply the new configuration.


## Usage
 **Run the Playbook**
   Execute the playbook against your target host:

   ```
   ansible-playbook -i inventory_file playbook.yml
   ```

   Replace `inventory_file` with the path to your inventory file and `playbook.yml` with the filename of your playbook.

## Example Inventory File
An example inventory file might look like this:

```ini
[db_server]
db_server_ip ansible_ssh_user=your_ssh_user
```

Replace `db_server_ip` with the IP address of your target server and `your_ssh_user` with your SSH username.

## Notes
- Ensure that you have the correct access rights to the target host and the repository.
- Make sure to update the `init.sql` script path in the playbook if it is located in a different directory.
- Review and adjust the variables and configurations according to your specific requirements.



*************************************************



# Web Server Configuration Playbook
This Ansible playbook sets up a web server with a Python application. It targets hosts in the `web_server` group and performs the following tasks:

1. **Set Hostname**: Configures the server hostname.
2. **Install Python**: Installs Python 3 and pip.
3. **Copy Application Files**: Transfers the Python application, requirements file, and templates to the server.
4. **Install Dependencies**: Installs Python dependencies from the requirements file.
5. **Run the Application**: Starts the Python application script.

## Requirements
- Ansible 2.9 or later
- Python 3
- SSH access to the target server

## Playbook Details
It performs the following tasks:

- Sets the Server Hostname: Configures the server with a specified hostname for better identification.
- Installs Python and Dependencies: Ensures Python 3 and pip are installed, which are necessary for running the application.
- Transfers Application Files: Copies the Python application script, requirements file, and templates from the control machine to the server.
- Installs Python Packages: Uses pip to install required Python libraries as listed in the requirements.txt.
- Starts the Application: Runs the Python application in the background to ensure it continues operating after the session ends.

  
This playbook is designed to streamline the setup process for deploying Python applications on a web server, making it easier to manage and maintain the server environment.
