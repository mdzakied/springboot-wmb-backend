<h1 align="center" id="title">springboot-wmb-backend</h1>

<p align="center">
  <strong>Webservice API for managing data at 'Warung Makan Bahari'</strong>
</p>

<p align="center">
  A modern and secure REST API designed to handle all aspects of restaurant data management for <strong>Warung Makan Bahari</strong>.
</p>

---

## 🌟 Project Overview 

The **Warung Makan Bahari - Webservice API** is a comprehensive REST API built to manage restaurant operations. It supports core functionalities such as:

- **User Authentication & Authorization 🔐:** Leveraging Spring Security to ensure secure access.
- **CRUD Operations 🍔:** Manage menus, tables, users, and transactions.
- **Payment Integration 💳:** Secure payment processing via Midtrans.
- **Data Export 📊:** Ability to export transaction data into CSV and PDF formats.

---

## ⚙️ Technologies Used 

- **Backend 💻:** Java with Spring Boot
- **Database 🗄️:** PostgreSQL
- **Security 🔐:** Spring Security for authentication and authorization
- **Testing 🧪:** JUnit and Mockito for unit testing and mocking
- **API Documentation 📜:** Spring Doc OpenAPI Starter with WebMVC UI and Postman

---

## 🏗️ Architecture 

The API follows **Clean Architecture**, ensuring maintainability and scalability. The structure includes:

- **Repositories 📦:** For data persistence
- **Services 🔄:** Organized with interfaces for better modularity
- **DTOs (Data Transfer Objects) 📝:** Used for request and response handling

By implementing clean architecture, this project aims for clear separation of concerns and high-quality code that is easy to maintain and extend.

---

<h2>🌐 Api Endpoint</h2>

Here're some of the project's API Endpoint :

<br />

> [!NOTE]  
> * **Authentication**: Using Bearer token (JWT) for requests requiring authentication.

<br />
<h3>Authentication</h3>

| Endpoint                         | Method | Authentication Required | Description                                       | Request Body                                                                                       | Query Parameters       |
|----------------------------------|--------|-------------------------|---------------------------------------------------|----------------------------------------------------------------------------------------------------|------------------------|
| `/auth/register`                 | POST   | None                    | Register a new user                               | `{ "username": "Andi2", "password": "password" }`                                                   | None                   |
| `/auth/register/admin`           | POST   | User or Admin            | Register a new admin                              | `{ "username": "Admin_Admin", "password": "password" }`                                             | None                   |
| `/auth/login`                    | POST   | None                    | Login a user and obtain JWT token                 | `{ "username": "superadmin", "password": "password" }`                                              | None                   |
| `/auth/validate-token`           | GET    | User or Admin            | Validate the JWT token                            | None                                                                                               | None                   |

<br />
<h3>User Management</h3>

| Endpoint                      | Method | Authentication Required | Description                                         | Request Body                                                                                  | Query Parameters           |
|-------------------------------|--------|-------------------------|-----------------------------------------------------|------------------------------------------------------------------------------------------------|----------------------------|
| `/users`                       | POST   | Admin                   | Create a new user                                  | `{ "name": "John Doe", "email": "john@example.com", "phoneNumber": "08123456789", "role": "USER" }` | None                       |
| `/users`                       | GET    | User or Admin           | Get all users                                      | None                                                                                           | `name=and&phoneNumber=81&page=2&size=3&sortBy=phoneNumber&direction=desc` |
| `/users/{id}`                  | GET    | User or Admin           | Get a user by ID                                   | None                                                                                           | None                       |
| `/users/{id}`                  | PUT    | Admin                   | Update user details                                | `{ "id": "d4f8a465-fda4-4e45-bbf1-1fbdb6b68a06", "name": "Andi", "phoneNumber": "089" }`        | None                       |
| `/users/{id}`                  | DELETE | Admin                   | Delete a user                                      | None                                                                                           | None                       |

<br />
<h3>Table Management</h3>

| Endpoint                      | Method | Authentication Required | Description                                         | Request Body                                                                                      | Query Parameters           |
|-------------------------------|--------|-------------------------|-----------------------------------------------------|----------------------------------------------------------------------------------------------------|----------------------------|
| `/tables`                      | POST   | Bearer token (Admin)     | Create a new table                                 | `{ "name": "T99" }`                                                                                 | None                       |
| `/tables`                      | GET    | Bearer token (Admin)     | Get all tables                                     | None                                                                                                 | `name=0&page=1&size=5&sortBy=price&direction=desc` |
| `/tables/{id}`                 | GET    | None                    | Get a table by ID                                  | None                                                                                                 | None                       |
| `/tables/{id}`                 | PUT    | Bearer token (Admin)     | Update an existing table                           | `{ "id": "e414fe74-5ff3-4442-8535-7aeb47c74c02", "name": "88" }`                                      | None                       |
| `/tables/{id}`                 | DELETE | Bearer token (Admin)     | Delete a table by ID                               | None                                                                                                 | None                       |

<br />
<h3>Menu Management</h3>

| Endpoint                     | Method | Authentication Required | Description                                       | Request Body                                                                                  | Query Parameters           |
|------------------------------|--------|-------------------------|---------------------------------------------------|------------------------------------------------------------------------------------------------|----------------------------|
| `/menus`                     | POST   | Admin                   | Add a new menu item                               | `{ "name": "Mie Seafood", "price": 75000 }` (image is included in form-data) | None                       |
| `/menus`                     | GET    | User or Admin          | Get all menu items                               | None                                                                                           | `name=nAsI kuNING&price=10000&minPrice=10000&maxPrice=20000&page=1&size=1&sortBy=price&direction=desc` |
| `/menus/{id}`                | GET    | User or Admin          | Get a menu item by ID                            | None                                                                                           | None                       |
| `/menus/{id}`                | PUT    | Admin                   | Update menu item                                 | `{ "id": "6e220867-a3a9-4995-a980-eb17c1c84ac6", "name": "Nasi Edit", "price": 2 }` (image is optional) | None                       |
| `/menus/{id}`                | DELETE | Admin                   | Delete a menu item                               | None                                                                                           | None                       |

<br />

> [!NOTE]  
> * **Request Body**: For `POST` and `PUT`, the body includes a JSON object with `name`, `price`, and optional `image` file uploaded as form-data..

<br />
<h3>Transaction</h3>

| Endpoint                        | Method | Authentication Required | Description                                    | Request Body                                                                                                               | Query Parameters                                                     |
|----------------------------------|--------|-------------------------|------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| `/transactions`                  | POST   | User                    | Create a new transaction                      | `{ "userId": "a793dc92-eb81-4f0a-9236-aabd5fd6dec4", "transactionDetails": [{ "menuId": "c391f1a8-cf2f-4156-8213-49c68ac96229", "qty": 2 }, { "menuId": "31983cac-53a2-4686-be3e-6975d46e192c", "qty": 1 }] }` | None                                                                 |
| `/transactions`                  | GET    | User or Admin           | Get all transactions                          | None                                                                                                                       | None                                                                 |
| `/transactions/{id}`             | GET    | User or Admin           | Get transaction by ID                         | None                                                                                                                       | None                                                                 |
| `/transactions/filter`           | GET    | User or Admin           | Get transactions with filters                 | `{ "transDate": "2024-01-05", "userName": "dz", "menuName": "es", "startTransDate": "2024-03-11", "endTransDate": "2024-03-07", "page": "1", "size": "1", "sortBy": "user", "direction": "asc" }` | `transDate`, `userName`, `menuName`, `startTransDate`, `endTransDate`, `page`, `size`, `sortBy`, `direction` |
| `/transactions/export/csv`       | GET    | User or Admin           | Export transactions to CSV with filters       | `{ "userName": "AdINDa", "menuName": "Aneka Gorengan", "transDate": "2024-03-10", "startTransDate": "2024-03-02", "endTransDate": "2024-03-07", "page": "1", "size": "1", "sortBy": "user", "direction": "asc" }` | `userName`, `menuName`, `transDate`, `startTransDate`, `endTransDate`, `page`, `size`, `sortBy`, `direction` |
| `/transactions/export/pdf`       | GET    | User or Admin           | Export transactions to PDF with filters       | `{ "userName": "AdINDa", "menuName": "Aneka Gorengan", "transDate": "2024-03-10", "startTransDate": "2024-03-02", "endTransDate": "2024-03-07", "page": "1", "size": "1", "sortBy": "user", "direction": "asc" }` | `userName`, `menuName`, `transDate`, `startTransDate`, `endTransDate`, `page`, `size`, `sortBy`, `direction` |

---

<h2>🛠️ Installation Steps :</h2>

<p>1. Clone Repository</p>

```
git clone https://github.com/mdzakied/wmb-api.git
```

<br />
<p>2. Prepare database wmb-api with Import dbwmb_api.sql </p>

[dbwmb_api.sql](src/main/resources/docs)

<br />
<p>3. Complete configuration in Application Properties</p>

 * Database config for connecting to database
 * Multipart config for custom max/request file size and path location (feature upload image)
 * Midtrans config for key and snap-url for connecting to midtrans (feature payment)
 * Json Web Token (JWT) config for authentication and authorization (feature security)
 * Auth config for auto create superadmin for authentication and authorization (feature security)

[Application Properties](src/main/resources/application.properties)

<br />
<p>4. Run Project for Development</p>

Run in [WmbApiApplication](src/main/java/com/enigma/wmb_api/WmbApiApplication.java)

<br />
<p>5. Run Project for Deployment</p>

* Build Maven without Test
  
  ```
  mvn package -DskipTests
  ```
  
* Run Project
  
  ```
  java -jar target/wmb_api-0.0.1-SNAPSHOT.jar
  ```

---

<h2>📃 Docs API</h2>

Sweagger UI :

* Run Project
* [Open Swagger Ui in Localhost](http://localhost:8080/swagger-ui/index.html)
* Login in Api [ /api/auth/login ] with username "superadmin" and password "password"
* Insert Authorize with bearer token
  
Postman :
* Run Project
* Open Postman and Import [WMB API.postman_collection.json](src/main/resources/docs)
* Login in Folder Auth Api Login with username "superadmin" and password "password"
* Insert Authorize with bearer token in another API

---
