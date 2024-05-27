<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Manager Clients</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
body,h1 {font-family: "Raleway", Arial, sans-serif;
transition: background-color 0.3s, color 0.3s;
}
h1 {letter-spacing: 6px}

.container {
            width: 60%;
            margin: 25px auto;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ccc;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, color 0.3s;
}
.breadcrumb {
            font-size: 14px;
            margin-bottom: 20px;
}
.breadcrumb a {
            text-decoration: none;
            color: #007bff;
}
.breadcrumb a:hover {
            text-decoration: underline;
}
.title-menor {
            font-size: 15px;
            text-align: left;
            margin: 20px 20px;
}

.title-menor a {
            padding: 15px 30px;
            text-decoration: none;
}

#linka {

	font-weight: bold;
}

.content {
            font-size: 16px;
            text-align: justify;
            line-height: 1.6;
            padding: 15px 120px;
}

.content .navigation {
            font-size: 14px;
            margin-bottom: 20px;
        }

        .content .tabs {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .content .tabs div {
            font-weight: bold;
            cursor: pointer;
        }

        .content form {
            display: flex;
            flex-direction: column;
        }

        .content .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .content label {
            margin-right: 10px;
            font-weight: bold;
            width: 100px; /* Ajuste a largura conforme necessário */
        }

        .content input[type="text"],
        .content select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            flex-grow: 1;
        }

        .content .submit-btn {
            text-align: center;
        }

        .content button {
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            background-color: #f0f0f0;
            cursor: pointer;
        }

        .content button:hover {
            background-color: #e0e0e0;
        }





.w3-padding-5 {

	padding: 5px;

}







 body.light-mode {
            background-color: #f9f9f9;
            color: #000000;
        }
        body.dark-mode {
            background-color: #121212;
            color: #ffffff;
        }

body.dark-mode .container {
            background-color: #1e1e1e;
            border-color: #444444;
        }

.toggle-button {
            display: block;
            margin: 0px 20px 0px 275px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 20px;
            background-color: #007bff;
            color: #ffffff;
            transition: background-color 0.3s, color 0.3s;
        }
.toggle-button:hover {
            background-color: #0056b3;
        }
body.dark-mode .toggle-button {
            background-color: #0056b3;
            color: #ffffff;
        }
body.dark-mode .toggle-button:hover {
            background-color: #007bff;
        }

</style>
</head>
<body class="light-mode">



<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">

<!-- Header -->
<header class="w3-panel w3-center w3-opacity" style="padding:0px 16px">
  <h1 class="w3-xlarge">Manager Clients</h1>
  <h1>Manage with Excellence</h1>
  
  <div class="w3-padding-5">
    <div class="w3-bar w3-border">
      <a class="w3-bar-item w3-button" href="clients">Home</a>
      <a class="w3-bar-item w3-button w3-light-grey" href="clients?action=clients">Clients</a>
      <a class="w3-bar-item w3-button" href="clients?action=admincreate">Admin</a>
    </div>
    <button class="toggle-button" onclick="toggleMode()">Dark/Light</button>
  </div>
</header>

<!-- Photo Grid -->
<div class="container">
	<div class="breadcrumb">
		<a href="#">Admin</a> > Manage!
	</div>
	<div class="title-menor">
            <a href="clients?action=admin-ud">Update and Delete</a>
            <a href="clients?action=admincreate" id="linka">Create</a>
	</div>
	<div class="content">
<form method="post" >

			<input type="hidden" name="clientId" value="<c:out value="${client.clientId}"/>">

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="clientname"  placeholder="Put your name" value="<c:out value="${client.clientName}"/>">
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" placeholder="Put your email" value="<c:out value="${client.clientEmail}"/>">
            </div>
            
            <div class="form-group">
                <label for="cpf">CPF</label>
                <input type="text" id="cpf" name="cpf" placeholder="Put your CPF" value="<c:out value="${client.clientCpf}"/>">
            </div>
            
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" placeholder="Put your phone" value="<c:out value="${client.clientPhone}"/>">
            </div>
            
            <div class="form-group">
                <label for="credibility">Credibility</label>
                <select id="credibility" name="credibility">
                    <option value="high" <c:if test="${client.clientCredibility == 'high'}"> selected </c:if>>High</option>
                    <option value="medium" <c:if test="${client.clientCredibility == 'medium'}"> selected </c:if>>Medium</option>
                    <option value="low" <c:if test="${client.clientCredibility == 'low'}"> selected </c:if>>Low</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="status">Status</label>
                <select id="status" name="status">
                    <option value="active" <c:if test="${client.clientStatus == 'active'}"> selected </c:if>>Active</option>
                    <option value="inactive" <c:if test="${client.clientStatus == 'inactive'}"> selected </c:if>>Inactive</option>
                </select>
            </div>
            
            <div class="submit-btn">
            
            
            	<% if(request.getAttribute("client") == null){ %>
			  	<button type="submit" >Create</button>
			  	<%} else { %>
			  	 <button type="submit">Edit</button>
			  	<% } %>
            
                
            </div>
        </form>	</div>
</div>
  
<!-- End Page Content -->
</div>

<!-- Footer 
<footer class="w3-container w3-padding-64 w3-light-grey w3-center w3-large"> 
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
  <p>Powered by Juan Pablo</p>
</footer>
-->

<script>
        function toggleMode() {
            var body = document.body;
            body.classList.toggle('light-mode');
            body.classList.toggle('dark-mode');
        }
</script>

</body>
</html>
