<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.util.ResourceBundle"%>
<%
Cookie cookie = null;
Cookie[] cookies = null;
String name = null;
String titulo = ".";
String adress = ".";
String phone = ".";
String email = ".";
String logout = "logout";

String addC = "add contacts";
String editC = "edit contacts";
String delC = "delete contact";
String delcA = "are you sure you want to delete this contact?";
String delCAA ="This action cannot be undone.";

cookies = request.getCookies();
ResourceBundle resource;
 if (cookies != null) {
  for (int i = 0; i < cookies.length; i++) {
  		 cookie = cookies[i];
  		 name = cookie.getName();
	   if("idioma".equals(name)){
		   try{	   
			    resource =  ResourceBundle.getBundle(cookie.getValue()); 
			    titulo = resource.getString("titulo");
			    name = resource.getString("name");
			    adress = resource.getString("adress");
			    phone = resource.getString("phone");
			    email = resource.getString("email");
			    titulo = resource.getString("titulo");
			    
			    addC = resource.getString("addC");
			    editC = resource.getString("editc");
			    delC = resource.getString("delC");
			    delcA = resource.getString("delcA");
			    delCAA = resource.getString("delCAA");
			   
			  
		   }catch(Exception e){
			   
			   Cookie language = new Cookie("idioma","es");
			   language.setMaxAge(60 * 60);
			   language.setPath("/pruebas");
			   response.addCookie(language);
			   response.sendRedirect("./");   
		   }	   
		    break;
	   }
	   if(i==cookies.length-1){     
		   Cookie language = new Cookie("idioma","es");
		   language.setMaxAge(60 * 60);
		   response.addCookie(language);
		   response.sendRedirect("./");
	   }
   }
 }

 %>
<%

if(session.getAttribute("isActive")==null){
	response.sendRedirect("../login.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%= titulo %></title>
<link rel="stylesheet" href="./index.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body class="bg-dark container">


<div class="container-fluid bg-dark">
	<div class="table-responsive container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2><%= titulo %></b></h2>
						<div class="cajon">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
										  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
										  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
										</svg> 
										<strong class="uname"></strong>
						<div class="cajon_0"> <%= logout %>
							 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
								  <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
							</svg>
						</div>
					
						
						</div>
		
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New </span></a>
						<a href="#deleteEmployeeModal" class="btn btn-danger deleteAll" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
					</div>
				</div>
			</div>
			<table class="table  table-dark ">
				<thead>
					<tr>
						<th>
							<span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
						</th>
						<th>#</th>
						<th><%=name %></th>
						<th><%=email %></th>
						<th><%=phone %></th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody class="resultados">
					
				</tbody>
			</table>
			<div class="clearfix">
				<div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
				<ul class="pagination">
					<li class="page-item disabled"><a href="#">Previous</a></li>
					<li class="page-item"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item active"><a href="#" class="page-link">3</a></li>
					<li class="page-item"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">5</a></li>
					<li class="page-item"><a href="#" class="page-link">Next</a></li>
				</ul>
			</div>
		</div>
	</div>        
</div>
<!-- Edit Modal HTML -->

<div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="create">
				<div class="modal-header">						
					<h4 class="modal-title"><%= addC %></h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
				
									
					<div class="form-group">
						<label><%= name %></label>
						<input type="text" class="form-control cn" required>
					</div>
					<div class="form-group">
						<label><%= email %></label>
						<input type="email" class="form-control cm" required>
					</div>
					
					<div class="form-group">
						<label><%= phone %></label>
						<input type="number" class="form-control cp" required>
					</div>					
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default cancelc" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-success "  value="Add">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">						
					<h4 class="modal-title"><%= editC %></h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				
			<form id="bUpdate1"  >
			<div class="editUser">
			
			</div>
					<div class="modal-footer">
					<input type="button" class="btn btn-default cancel" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info btn-update"  value="Save">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form name="deletef" method="post">
				<div class="modal-header">						
					<h4 class="modal-title"><%= delC %></h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body delC">					
					<p ><%= delcA %></p>
					<p class="text-warning"><small><%= delCAA %></small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="button" class="btn btn-danger btn-dele" data-dismiss="modal" value="Delete">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script src="script.js"></script>
<script src="js/index.jsp"></script>
<script src="js/index.js"></script>
<script src="js/crud.js"></script>


</html>
