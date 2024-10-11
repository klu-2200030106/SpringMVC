<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<html>
<head>
    <title>View Employee By ID</title>
    <style>
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

        h2 {
            color: #343a40;
            margin: 20px 0;
            font-size: 32px;
        }

        h3 {
            color: #495057;
            margin: 15px 0;
            font-size: 24px;
            text-decoration: underline;
        }

        .navbar {
           background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar a {
            text-decoration: none;
              color: #333;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            font-weight: 500;
        }

        .navbar a:hover {
           background-color: #333;
            color: white;
        }

        .employee-info {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: left;
            width: 100%;
            max-width: 600px;
            margin-top: 20px;
        }
        
        .employee-info div {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px; /* Add space between lines */
}
        
        .employee-info b {
            display: block;
            margin-bottom: 8px;
            color: #343a40;
            font-weight: 600;
        }

        .employee-info span {
            color: #6c757d;
            font-size: 16px;
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
    
    <h3>View Employee By ID</h3>

  <div class="employee-info">
    <div><b>ID:</b> <span><c:out value="${emp.id}"/></span></div>
    <div><b>NAME:</b> <span><c:out value="${emp.name}"/></span></div>
    <div><b>GENDER:</b> <span><c:out value="${emp.gender}"/></span></div>
    <div><b>DATE OF BIRTH:</b> <span><c:out value="${emp.dateofbirth}"/></span></div>
    <div><b>DEPARTMENT:</b> <span><c:out value="${emp.department}"/></span></div>
    <div><b>SALARY:</b> <span><c:out value="${emp.salary}"/></span></div>
    <div><b>LOCATION:</b> <span><c:out value="${emp.location}"/></span></div>
    <div><b>EMAIL:</b> <span><c:out value="${emp.email}"/></span></div>
    <div><b>CONTACT:</b> <span><c:out value="${emp.contact}"/></span></div>
</div>
  
</body>
</html>
