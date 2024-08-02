# Ansible Playbooks: MySQL and Web Server Configuration
<img width="833" alt="Screenshot 2024-07-25 at 12 11 08 PM" src="https://github.com/user-attachments/assets/02c132c4-904d-4e6b-b7eb-f05744c8bc11">

## Overview

This project consists of two Ansible playbooks designed to automate the setup and configuration of MySQL and a web server environment. Each playbook addresses different aspects of server configuration and application deployment:


<img width="675" alt="Screenshot 2024-07-25 at 2 19 58 PM" src="https://github.com/user-attachments/assets/2008fe13-5472-4722-8fd8-3e6e8062f131">


1. **MySQL Configuration Playbook**: Automates the installation, setup, and configuration of a MySQL server.
2. **Web Server Configuration Playbook**: Sets up a web server, installs Python, and deploys a Python application.

## MySQL Configuration Playbook

### Purpose

The MySQL Configuration playbook is intended to configure a MySQL server on a target host. It performs the following tasks:

- Sets the hostname of the server.
- Installs MySQL and necessary dependencies.
- Starts and enables the MySQL service.
- Creates a MySQL user with specified privileges.
- Copies an SQL initialization script to the server.
- Creates a MySQL database.
- Checks for the existence of a table and imports it if it does not exist.
- Configures MySQL to allow remote connections.

### Prerequisites

- Ansible installed on your local machine.
- Access to a target host (e.g., a server running a Debian-based Linux distribution) via SSH.
- SSH access to the target host.
- The `init.sql` file located on the control machine.

### Variables

The playbook uses the following variables:

- `hostname`: Desired hostname for the server.
- `db_name`: Name of the database to be created.
- `db_table`: Name of the table to be checked and created.
- `db_user`: MySQL username to be created.
- `db_password`: Password for the MySQL user.

### Tasks

1. **Set Hostname**: Configures the server hostname using the `hostnamectl` command.
2. **Install MySQL and Dependencies**: Installs MySQL server, client, Python MySQL library, and client development libraries.
3. **Start and Enable MySQL Service**: Starts and enables the MySQL service.
4. **Create MySQL User**: Creates a MySQL user with specified privileges.
5. **Copy SQL Script**: Copies the SQL initialization script to the server.
6. **Create Database**: Creates a MySQL database if it does not exist.
7. **Check for Existing Table**: Checks if a specified table exists in the database.
8. **Import Database Table**: Imports the SQL script if the table does not exist.
9. **Enable Remote Login**: Configures MySQL to allow remote connections by updating the `bind-address` setting.
10. **Restart MySQL Service**: Restarts the MySQL service to apply configuration changes.

### Usage

Run the playbook against your target host:

```sh
ansible-playbook -i inventory_file mysql_playbook.yml
```

Replace `inventory_file` with the path to your inventory file and `mysql_playbook.yml` with the filename of your MySQL playbook.

### Example Inventory File

```ini
[db_server]
db_server_ip ansible_ssh_user=your_ssh_user
```

Replace `db_server_ip` with the IP address of your target server and `your_ssh_user` with your SSH username.

### Notes

- Ensure you have correct access rights to the target host and repository.
- Update the `init.sql` script path if necessary.
- Review and adjust variables and configurations as needed.

## Web Server Configuration Playbook

### Purpose

The Web Server Configuration playbook sets up a web server and deploys a Python application. It performs the following tasks:

1. **Set Hostname**: Configures the server hostname.
2. **Install Python**: Installs Python 3 and pip.
3. **Copy Application Files**: Transfers the Python application script, requirements file, and templates to the server.
4. **Install Dependencies**: Installs Python dependencies from the requirements file.
5. **Run the Application**: Starts the Python application script.

### Requirements

- Ansible 2.9 or later.
- Python 3.
- SSH access to the target server.

### Tasks

1. **Set Hostname**: Configures the server with the specified hostname.
2. **Install Python**: Installs Python 3 and pip.
3. **Copy Application Files**: Transfers the Python application script, requirements file, and templates from the control machine to the server.
4. **Install Dependencies**: Uses pip to install Python packages listed in `requirements.txt`.
5. **Run the Application**: Executes the Python application script in the background.

### Usage

Run the playbook against your target server:

```sh
ansible-playbook -i inventory_file web_server_playbook.yml
```

Replace `inventory_file` with the path to your inventory file and `web_server_playbook.yml` with the filename of your web server playbook.

### Example Inventory File

```ini
[web_server]
web_server_ip ansible_ssh_user=your_ssh_user
```

Replace `web_server_ip` with the IP address of your target server and `your_ssh_user` with your SSH username.

### Notes

- Ensure Python and pip are installed on the target server.
- Verify the paths to the application files are correct.
- Adjust variables and paths according to your specific requirements.
