<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fail</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8d7da; /* Light red background for error indication */
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh; /* Center vertically */
        }

        h1 {
            color: #721c24; /* Dark red color for title */
            font-size: 36px;
            margin-bottom: 20px;
            text-align: center;
        }

        .message {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
            max-width: 600px;
            width: 90%;
            margin-bottom: 30px;
            font-size: 18px; /* Increased font size for better readability */
            color: #721c24; /* Dark red for message text */
        }

        a {
            text-decoration: none;
            color: #ffffff;
            font-weight: bold;
            padding: 10px 15px;
            border: 1px solid #dc3545; /* Red border */
            border-radius: 5px;
            background-color: #dc3545; /* Red button background */
            transition: background-color 0.3s, transform 0.3s;
        }

        a:hover {
            background-color: #c82333; /* Darker red on hover */
            transform: scale(1.05); /* Slight zoom effect */
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 28px; /* Responsive heading size */
            }
            .message {
                font-size: 16px; /* Responsive message text size */
            }
        }
    </style>
</head>
<body>
    <h1>Failure</h1>
    <div class="message">
        <c:out value="${message}"></c:out>
    </div>
    <a href="viewempbyid">Try Again</a>
</body>
</html>
