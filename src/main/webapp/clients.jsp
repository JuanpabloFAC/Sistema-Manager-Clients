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
.title {
            font-size: 36px;
            text-align: center;
            margin: 20px 0;
}
.content {
            font-size: 16px;
            text-align: justify;
            line-height: 1.6;
            padding: 15px 120px;
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
        
.container-table {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .table {
    width: 80%; /* Ajuste a largura conforme necessário */
    margin: auto;
    border-collapse: collapse;
    text-align: center; /* Centraliza o texto nas células */
  }

  .table th, .table td {
    padding: 10px; /* Ajuste o padding conforme necessário */
    text-align: center; /* Centraliza o texto nas células */
    vertical-align: middle; /* Centraliza o texto verticalmente */
  }

  .table thead {
    background-color: #f05349; /* Cor de fundo para o cabeçalho */
    color: white;
  }

  .table tbody tr {
    background-color: #D6D6D6;
  }

  .table a {
    margin: 0 5px; 
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
		<a href="#">Clients</a> > See your clients!
	</div>
	<div class="title">
            Clients
	</div>
	
	<div class="container-table">
	
		<table class="table">
	  		<thead style="color: white;">
	    		<tr bgcolor="#646464">
			      <th scope="col">NAME</th>
			      <th scope="col">CPF</th>
			      <th scope="col">EMAIL</th>
			      <th scope="col">PHONE</th>
			      <th scope="col">CREDIBILITY</th>
			      <th scope="col">STATUS</th>
	    		</tr>
	  		</thead>
  			<div></div>
  			<tbody>
  
  				<c:forEach items="${clients}" var="client">
  
				    <tr bgcolor="#f9f9f9">
				    <td scope="col"> <c:out value="${client.clientName} "/> </td>
				    <td scope="col"> <c:out value="${client.clientCpf} "/> </td>
				    <td scope="col"> <c:out value="${client.clientEmail} "/> </td>
				    <td scope="col"> <c:out value="${client.clientPhone}"/> </td>
				    <td scope="col"> <c:out value="${client.clientCredibility} "/> </td>
				    <td scope="col"> <c:out value="${client.clientStatus} "/> </td>
				   	</tr>
    
    			</c:forEach>
  			</tbody>
		</table>
	</div>
</div>
  
<!-- End Page Content -->


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
