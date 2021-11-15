<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.ResourceBundle"%>

<%
 


 
Cookie cookie = null;
Cookie[] cookies = null;
String name = null;
String titulo = ".";
String aHome = ".";
String aLogin = ".";
String aRegister = ".";
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
			    aHome = resource.getString("aHome");
			    aLogin = resource.getString("aLogin");
			    aRegister = resource.getString("aRegister");
			
		   }catch(Exception e){
			   
			   Cookie language = new Cookie("idioma","es");
			   language.setMaxAge(60 * 60);
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
    

  <nav class="navbar navbar-expand-lg navbar-dark bg-black">
            <div class="container">
                <a class="navbar-brand" href="#!"><%= titulo %></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="app/"><%= aHome %></a></li>
                        <li class="nav-item"><a class="nav-link" href="app/login.jsp"><%= aLogin %></a></li>
                        <li class="nav-item"><a class="nav-link" href="app/singUP.jsp"><%= aRegister %></a></li>
                    </ul>
                </div>
            </div>
        </nav>