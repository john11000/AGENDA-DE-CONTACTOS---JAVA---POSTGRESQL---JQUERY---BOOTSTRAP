<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
         <%@ page import="java.util.ResourceBundle"%>

<%
 


 
Cookie cookie = null;
Cookie[] cookies = null;
String name = null;
String TecnoUsada = ".";
cookies = request.getCookies();
ResourceBundle resource;
 


 if (cookies != null) {
  for (int i = 0; i < cookies.length; i++) {
  		 cookie = cookies[i];
  		 name = cookie.getName();
  	
	   if("idioma".equals(name)){
		   try{
			    resource =  ResourceBundle.getBundle(cookie.getValue()); 
			    TecnoUsada = resource.getString("TecnoUsada");
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
    
           <div class="py-5 bg-image-full" style="background:black;">
            <!-- Put anything you want here! The spacer below with inline CSS is just for demo purposes!-->

            <h3 class="section-title text-white text-center"><%= TecnoUsada %></h3>
			<div>
  				 <img loading="lazy" src="./assets/html.png" width="19%" alt="logo de html en formato png">
   				 <img loading="lazy" src="./assets/css.png" width="19%" alt="logo de css en formato png">
   				 <img loading="lazy" src="./assets/Jquery.png" width="19%" alt="logo de jquery en formato png">
   				 <img loading="lazy" src="./assets/postgres.png" width="19%" alt="logo de postges en formato png">
   				 <img loading="lazy" src="./assets/java.png" width="20%" alt="logo de java en formato png">
	
			</div> 
        </div>