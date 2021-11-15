<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ResourceBundle"%>
<%


Cookie cookie = null;
Cookie[] cookies = null;
String name = null;
String titulo = ".";
String aHome = ".";
String aLogin = ".";
String aRegister = ".";
Cookie language = null;

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
			    name = resource.getString("idioma");
		   }catch(Exception e){
			   
			    language = new Cookie("idioma","ESPAÑOL");
			  
			   language.setMaxAge(60 * 60);
			   response.addCookie(language);
			   response.sendRedirect("./");
			   
		   }
		   
		   //name = cookie.getValue();
		   
		    break;
	   }
	   if(i==cookies.length-1){
	     
		    language = new Cookie("idioma","ESPAÑOL");
		   language.setMaxAge(60 * 60);
		   response.addCookie(language);
		   response.sendRedirect("./");
	   }
   }
 
 }
 
 %>
      <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp"><%= titulo %></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp"><%= aHome %></a></li>
                        <li class="nav-item"><a class="nav-link" href="login.jsp"><%= aLogin %></a></li>
                        <li class="nav-item"><a class="nav-link" href="singUP.jsp"><%= aRegister %></a></li>
                  		 <li class="nav-item"><a class="nav-link" href="../">About</a></li>
 						<li class="nav-item"> 
 						
 						<a class="nav-link " href="#">
 						<select class="switchLanguage" name="select"  >
						  <option selected><%= name %></option>
						  <option value="1">Español</option>
						  <option value="2">English</option>
						  
						</select>
						
						</a>                		 
 						
 						
 						
 						</li>
                  		 
                   </ul>
                </div>
            </div>
        </nav>