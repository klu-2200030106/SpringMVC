<!DOCTYPE html>
<html>
<head>
    <title>Spring MVC</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
        .navbar {
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 10px;
            padding: 15px 25px;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .navbar a {
            text-decoration: none;
            color: #333;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }

        .navbar a:hover {
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

        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input[type="number"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        /* Buttons */
        .button-container {
            text-align: center;
            padding-top: 20px;
        }

        input[type="submit"] {
            margin: 5px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            background-color: #4CAF50;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        @media screen and (max-width: 768px) {
            form {
                padding: 20px;
            }

            .navbar {
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
    <h2>Spring MVC CRUD Operations with ORM/Hibernate</h2>
    <div class="navbar">
        <a href="home">Home</a>
        <a href="addemp">Add Employee</a>
        <a href="viewallemps">View All Employees</a>
        <a href="updateemp">Update Employee</a>
        <a href="deleteemp">Delete Employee</a>
        <a href="viewempbyid">View Employee By ID</a>
    </div>
    
    <h3 style="text-align: center;"><u>View Employee By ID</u></h3>
    <div class="form-container">
        <form method="post" action="displayemp">
            <table>
                <tr>
                    <td><label for="eid">Enter Employee ID</label></td>
                    <td><input type="number" id="eid" name="eid" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="View"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
