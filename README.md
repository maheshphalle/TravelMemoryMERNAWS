# TravelMemoryMernAws

Deploying TravelMemory MERN on AWS with Terraform and Ansible

Here's a detailed, beginner-friendly `README.md` file for  TravelMemory MERN stack project with Terraform and Ansible deployment:

---

```markdown
# 🌍 TravelMemory MERN Stack Deployment using Terraform and Ansible

This project demonstrates a full-stack **TravelMemory** application built with the **MERN stack** (MongoDB, Express.js, React, Node.js), and deployed using **Terraform** (for infrastructure provisioning) and **Ansible** (for configuration management and deployment automation) on AWS EC2 instances.

> ⚠️ This guide is designed for beginners — no prior DevOps or cloud experience required.

---

## 📁 Project Structure

```

TravelMemoryMERNAWS/
├── terraform/                # Contains Terraform configuration to set up AWS infrastructure
├── ansible/                  # Contains Ansible playbooks to configure EC2 instances
├── backend/                  # Node.js + Express backend API
├── frontend/                 # React frontend
└── README.md

````

---

## 🧰 Tools and Technologies

- **MongoDB Atlas** (Cloud DB)
- **Express.js**
- **React.js**
- **Node.js**
- **AWS EC2**
- **Terraform** (Infra as Code)
- **Ansible** (Automation)
- **GitHub**

---

## 📦 Prerequisites

Install the following on your local machine:

| Tool         | Link                                                                 |
|--------------|----------------------------------------------------------------------|
| Node.js      | https://nodejs.org/en/download/                                      |
| Git          | https://git-scm.com/downloads                                        |
| Terraform    | https://developer.hashicorp.com/terraform/downloads                  |
| Ansible      | [Install on WSL/Linux](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) |
| AWS CLI      | https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html  |
| VS Code      | https://code.visualstudio.com/                                       |

Create accounts on:

- [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
- [AWS](https://aws.amazon.com/)

---

## 🚀 Project Setup Steps

---

### 🔑 1. Configure AWS Credentials

```bash
aws configure
````

Provide:

* AWS Access Key ID
* AWS Secret Access Key
* Default region (e.g., `us-east-1`)
* Output format (e.g., `json`)

---

### ☁️ 2. Provision AWS Infrastructure using Terraform

Navigate to the `terraform/` directory:

```bash
cd terraform
```

#### ✅ Initialize Terraform

```bash
terraform init
```

#### 🔍 Review the execution plan

```bash
terraform plan
```

#### 🚀 Apply to create EC2 instances

```bash
terraform apply
```

* Confirm with `yes` when prompted.
* Terraform will output the public IPs of created EC2 instances.

---

### 🤖 3. Configure EC2 using Ansible

Go to the `ansible/` directory:

```bash
cd ../ansible
```

#### 📝 Update `inventory.ini` with the public IPs from Terraform:

```ini
[backend]
<backend-ec2-ip>

[frontend]
<frontend-ec2-ip>
```

#### 📂 Run the Ansible Playbook

```bash
ansible-playbook -i inventory.ini site.yml
```

This will:

* Install Node.js, Git, and other dependencies
* Clone the project repository
* Start both backend and frontend servers using PM2 or npm
* Configure firewall and ports

---

### 🌐 4. Access the Application

* Open browser: `http://<frontend-ec2-ip>:3000`
* Backend: `http://<backend-ec2-ip>:5000`

📝 If using Nginx as reverse proxy (configured via Ansible), use `http://<ip>` without port.

---

## 📌 Application Features

* 🧾 User Authentication (JWT)
* 📸 Upload & store travel memories (images, notes, location)
* 🔍 View all or personal memories
* 🗺️ Filter by tags or locations
* 💻 Responsive design for mobile & desktop

---

## 🧪 Testing Locally

Install dependencies:

```bash
cd backend
npm install

cd ../frontend
npm install
```

Start locally:

```bash
# In backend/
npm start

# In frontend/
npm start
```

Ensure `.env` files are configured correctly for local MongoDB or Atlas access.

---

## 📤 Deploying Updates

1. Update the code in GitHub
2. Re-run the Ansible playbook:

```bash
ansible-playbook -i inventory.ini site.yml
```

---

## 🧹 Clean Up

Destroy AWS resources to avoid charges:

```bash
cd terraform
terraform destroy
```

---

## 📸 Architecture Diagram

```text
                    +-------------+
                    |   Browser   |
                    +------+------+            
                           |                
                           v                
                    +-------------+               
                    |  Frontend   | (EC2 - React)       
                    +------+------+
                           |
                           v
                    +-------------+
                    |  Backend    | (EC2 - Node.js)
                    +------+------+
                           |
                           v
                    +-------------+
                    | MongoDB Atlas |
                    +-------------+
```

---

## 🛠️ Troubleshooting

| Issue                    | Solution                                                    |
| ------------------------ | ----------------------------------------------------------- |
| Terraform apply fails    | Check AWS credentials and IAM permissions                   |
| Ansible connection fails | Ensure EC2 has port 22 open and keypair is used             |
| App not loading          | Check `npm start` status or port access via security groups |
| Cannot push to GitHub    | Add remote using `git remote add origin <repo-url>`         |

---

## 📬 Contact

For any help, reach out via [GitHub Issues](https://github.com/maheshphalle/TravelMemoryMERNAWS/issues)

---
