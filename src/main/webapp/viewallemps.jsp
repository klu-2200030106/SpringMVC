<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Employees</title>
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
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

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
    background-color: #f9f9f9 !important;
}

tr:hover {
    background-color: #f1f1f1 !important;
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
        

        .back-button {
            align-self: flex-start;
            margin-bottom: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .back-button:hover {
            background-color: #0056b3;
        }
        .search-container {
        margin: 20px 0;
        text-align: center;
    }
    
    .search-input {
        padding: 10px;
        width: 300px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }
    
    #employeeTable {
        width: 100%;
        border-collapse: collapse;
    }
    
    #employeeTable th, #employeeTable td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    
    #employeeTable th {
        background-color: #f2f2f2;
    }
    /* Explicitly target even and odd rows */
.even-row {
    background-color: #f9f9f9;
}

.odd-row {
    background-color: #ffffff;
}

.even-row:hover,
.odd-row:hover {
    background-color: #f1f1f1;
}
    
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $('#searchInput').on('input', function() {
        var searchTerm = $(this).val();
        $.ajax({
            url: 'searchEmployees',
            data: { searchTerm: searchTerm },
            dataType: 'json',
            success: function(response) {
                console.log("Search response:", response);
                updateTable(response);
            },
            error: function(xhr, status, error) {
                console.error("Search error:", error);
                console.error("Response Text:", xhr.responseText);
            }
        });
    });
});

function updateTable(employees) {
    var tableBody = $('#employeeTable tbody');
    tableBody.empty();
    if (employees && employees.length > 0) {
        $.each(employees, function(i, emp) {
            var row = $('<tr>');
            
            // Apply even/odd class based on index
            if (i % 2 === 0) {
                row.addClass('even-row');
            } else {
                row.addClass('odd-row');
            }

            row.append($('<td>').text(emp.id));
            row.append($('<td>').text(emp.name));
            row.append($('<td>').text(emp.gender));
            row.append($('<td>').text(emp.dateofbirth));
            row.append($('<td>').text(emp.department));
            row.append($('<td>').text(emp.salary));
            row.append($('<td>').text(emp.location));
            row.append($('<td>').text(emp.email));
            row.append($('<td>').text(emp.contact));
            tableBody.append(row);
        });
    } else {
        tableBody.append($('<tr>').append($('<td colspan="9">').text('No results found')));
    }
}

</script>
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

<h3><u>View All Employees</u></h3>


<div class="search-container">
    <input type="text" id="searchInput" placeholder="Search by ID, name, department, location, email or contact" class="search-input">
</div>


<table id="employeeTable">
    <thead>
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>GENDER</th>
            <th>DATE OF BIRTH</th>
            <th>DEPARTMENT</th>
            <th>SALARY</th>
            <th>LOCATION</th>
            <th>EMAIL</th>
            <th>CONTACT</th>
        </tr>
    </thead>
    <tbody>
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
            </tr>
        </c:forEach>
    </tbody>
</table>


</body>
</html>
