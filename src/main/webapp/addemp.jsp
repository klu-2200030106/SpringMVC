<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee</title>
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
        h2, h3 {
            color: #333;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            margin-top: 30px;
        }
        .nav-container {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
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
        form {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            width: 300px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="radio"] {
            width: auto;
            margin-right: 10px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        #toast {
            visibility: hidden;
            min-width: 250px;
            color: white;
            text-align: left;
            border-radius: 4px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            right: 30px;
            top: 30px;
            font-size: 17px;
            display: flex;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        #toast.show {
            visibility: visible;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }
        #toast i {
            margin-right: 12px;
            font-size: 24px;
            font-style: normal;
        }
        @keyframes fadein {
            from {top: 0; opacity: 0;}
            to {top: 30px; opacity: 1;}
        }
        @keyframes fadeout {
            from {top: 30px; opacity: 1;}
            to {top: 0; opacity: 0;}
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
    <h3><u>Add Employee</u></h3>
    <form method="post" action="insertemp">
        <input type="number" name="eid" required placeholder="Enter ID">
        <input type="text" name="ename" required placeholder="Enter Name">
        <div>
            <label>Select Gender</label><br>
            <input type="radio" name="egender" value="MALE" required> Male
            <input type="radio" name="egender" value="FEMALE" required> Female
            <input type="radio" name="egender" value="OTHERS" required> Others
        </div>
        <input type="date" name="edob" required placeholder="Enter Date of Birth">
        <select name="edept" required>
            <option value="">Select Department</option>
            <option value="TECHNICAL">Technical</option>
            <option value="MARKETING">Marketing</option>
            <option value="SALES">Sales</option>
        </select>
        <input type="number" name="esalary" required placeholder="Enter Salary">
        <input type="text" name="elocation" required placeholder="Enter Location">
        <input type="email" name="eemail" required placeholder="Enter Email">
        <input type="number" name="econtact" required placeholder="Enter Contact">
        <input type="submit" value="Add Employee">
    </form>

    <div id="toast"><i></i><span></span></div>

    <script>
    window.onload = function() {
        var message = "${message}";
        if (message) {
            showToast(message);
        }
    };

    function showToast(message) {
        var toast = document.getElementById("toast");
        var icon = toast.querySelector("i");
        var messageSpan = toast.querySelector("span");

        if (message.includes("Duplicate Entry") || message.includes("Invalid Data")) {
            toast.style.backgroundColor = "#FF0000"; // Red for errors
            icon.textContent = "\u2718"; // ✘ Cross mark
        } else if (message.includes("successfully")) {
            toast.style.backgroundColor = "#4CAF50"; // Green for success
            icon.textContent = "\u2714"; // ✔ Heavy check mark
        } else {
            toast.style.backgroundColor = "#4CAF50"; // Orange for warnings
            icon.textContent = "\u2714"; // ⚠ Warning sign
        }

        messageSpan.textContent = message;
        toast.className = "show";
        setTimeout(function(){ toast.className = toast.className.replace("show", ""); }, 3000);
    }
    </script>
</body>
</html>