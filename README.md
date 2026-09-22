# CV Management System

A web-based **CV Management System** built with Symfony that allows users to create, manage, and publish professional CVs while enabling recruiters to browse candidates and manage job positions.

##  Features

* User registration and secure authentication
* Candidate profile management
* Reusable **Attribute Library** with categories, types, and supported values
* Recruiter position creation and management
* Attribute-based position requirements
* Project management with technology tags
* Dynamic CV creation based on user profiles and positions
* Draft and published CV management
* Public CV and profile browsing
* Recruiter CV viewing and liking
* Search and tag-based browsing
* Discussion functionality
* Admin dashboard and user management
* English/Bangla locale support
* Optimistic locking for important entities

##  Technologies

* **Backend:** PHP, Symfony 6.4
* **ORM:** Doctrine ORM
* **Database:** MySQL/MariaDB
* **Frontend:** Twig, Bootstrap, JavaScript
* **JavaScript:** Stimulus & Turbo
* **Authentication:** Symfony Security
* **Testing:** PHPUnit

##  Architecture

The application follows Symfony's MVC architecture with:

* Entities for database modeling
* Controllers for application logic
* Doctrine repositories for database operations
* Twig templates for the user interface
* Symfony Forms and Validator for data handling
* Role-based access control for different users

##  Installation

```bash
git clone <repository-url>
cd CV
composer install
```

Configure your database in `.env`, then run:

```bash
php bin/console doctrine:database:create
php bin/console doctrine:migrations:migrate
symfony server:start
```

Open the application at:

```text
http://127.0.0.1:8000
```

##  User Roles

**Candidates** can create profiles, add projects, and generate CVs.

**Recruiters** can create positions, define requirements, browse CVs, and interact with candidates.

**Administrators** can manage users, CVs, and system data.

##  Project Purpose

The project demonstrates the development of a complete role-based CV management platform using **Symfony, Doctrine ORM, MySQL, and JavaScript**, with an emphasis on structured data management, security, reusable attributes, and dynamic CV generation.
