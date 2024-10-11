<!DOCTYPE html>
<html>
<head>
    <title>Spring MVC</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            box-sizing: border-box;
        }

        h2, h3 {
            color: #333;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
            margin-top: 30px;
            font-size: 28px;
        }

        /* Navigation Bar */
        .nav-container {
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 10px;
            padding: 15px 25px;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .nav-link {
            text-decoration: none;
            color: #333;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }

        .nav-link:hover {
            background-color: #333;
            color: white;
        }

        /* Form Styling */
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        form {
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 12px;
            padding: 30px 40px;
            margin-top: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        table {
            width: 100%;
            border-spacing: 10px;
        }

        label {
            font-weight: bold;
            font-size: 14px;
            color: #444;
        }

        input[type="number"],
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input[type="number"]:focus,
        input[type="text"]:focus,
        input[type="email"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        /* Buttons */
        .button-container {
            text-align: center;
            padding-top: 20px;
        }

        input[type="submit"], input[type="reset"] {
            margin: 5px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"] {
            background-color: #4CAF50;
        }

        input[type="reset"] {
            background-color: #f44336;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        input[type="reset"]:hover {
            background-color: #e53935;
            transform: scale(1.05);
        }

        @media screen and (max-width: 768px) {
            form {
                padding: 20px;
            }

            .nav-container {
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
    <h2>Spring MVC CRUD Operations with ORM/Hibernate</h2>
    <div class="nav-container">
        <a href="home" class="nav-link">Home</a>
        <a href="addemp" class="nav-link">Add Employee</a>
        <a href="viewallemps" class="nav-link">View All Employees</a>
        <a href="deleteemp" class="nav-link">Delete Employee</a>
        <a href="updateemp" class="nav-link">Update Employee</a>
        <a href="viewempbyid" class="nav-link">View Employee By id</a>
    </div>
    
    <h3 style="text-align: center;"><u>Update Employee</u></h3>
    <div class="form-container">
        <form method="post" action="update">
            <table>
                <tr>
                    <td><label for="eid">Enter Existing ID</label></td>
                    <td><input type="number" id="eid" name="eid" required/></td>
                </tr>
                <tr>
                    <td><label for="ename">Enter Name</label></td>
                    <td><input type="text" id="ename" name="ename" required/></td>
                </tr>
                <tr>
                    <td><label for="esalary">Enter Salary</label></td>
                    <td><input type="number" id="esalary" name="esalary" step="0.1" required/></td>
                </tr>
                <tr>
                    <td><label for="eemail">Enter Email ID</label></td>
                    <td><input type="email" id="eemail" name="eemail" required/></td>
                </tr>
                <tr>
                    <td><label for="econtact">Enter Contact</label></td>
                    <td><input type="number" id="econtact" name="econtact" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Update Employee"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
