<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <title>Delete Employee</title>
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
        }
        
        h2, h3 {
            color: #333;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            margin-top: 30px;
        }
        
        /* Navigation Styles */
        .nav-container {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
       
        /* Table Styles */
        table {
            width: 100%;
            max-width: 1200px;
            margin: 20px auto;
            border-collapse: collapse;
            table-layout: auto;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        
        table, th, td {
            border: 2px solid #ddd;
        }
        
        th, td {
            padding: 12px 15px;
            text-align: center;
            word-wrap: break-word;
        }
        
        th {
            background-color: #4CAF50;
            color: white;
            text-transform: uppercase;
            font-size: 14px;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        tr:hover {
            background-color: #f1f1f1;
        }
        
        /* Action Link Styles */
        .action-link {
            text-decoration: none;
            color: #e74c3c;
            font-weight: bold;
        }
        
        .action-link:hover {
            color: #c0392b;
        }
        
        /* Toast Notification Styles */
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
    <h2>Spring MVC CRUD Operations with ORM/Hibernate</h2>
    
    <div class="nav-container">
        <a href="home" class="nav-link">Home</a>
        <a href="addemp" class="nav-link">Add Employee</a>
        <a href="viewallemps" class="nav-link">View All Employees</a>
        <a href="updateemp" class="nav-link">Update Employee</a>
        <a href="deleteemp" class="nav-link">Delete Employee</a>
        <a href="viewempbyid" class="nav-link">View Employee By ID</a>
    </div>
    
    <h3><u>Delete Employee</u></h3>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Date of Birth</th>
            <th>Department</th>
            <th>Salary</th>
            <th>Location</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${emplist}" var="emp">
            <tr>
                <td><c:out value="${emp.id}"/></td>
                <td><c:out value="${emp.name}"/></td>
                <td><c:out value="${emp.gender}"/></td>
                <td><c:out value="${emp.dateofbirth}"/></td>
                <td><c:out value="${emp.department}"/></td>
                <td><c:out value="${emp.salary}"/></td>
                <td><c:out value="${emp.location}"/></td>
                <td><c:out value="${emp.email}"/></td>
                <td><c:out value="${emp.contact}"/></td>
                <td>
    <a href='<c:url value="delete?id=${emp.id}" />' class="action-link" onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a>
</td>
            </tr>
        </c:forEach>
    </table>
     
   
</body>
</html>
