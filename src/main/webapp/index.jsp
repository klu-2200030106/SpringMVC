<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring MVC</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
        h2 {
            color: #333;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            margin-top: 50px;
        }
        .nav-container {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 20px;
            margin-top: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .nav-link {
            text-decoration: none;
            color: #333;
            padding: 10px 15px;
            margin: 0 5px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        .nav-link:hover {
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>
    <h2>Spring MVC CRUD Operations with ORM</h2>
    <div class="nav-container">
        <a href="home" class="nav-link">Home</a>
        <a href="addemp" class="nav-link">Add Employee</a>
        <a href="viewallemps" class="nav-link">View All Employees</a>
        <a href="deleteemp" class="nav-link">Delete Employee</a>
        <a href="updateemp" class="nav-link">Update Employee</a>
        <a href="viewempbyid" class="nav-link">View Employee By id</a>
    </div>
</body>
</html>