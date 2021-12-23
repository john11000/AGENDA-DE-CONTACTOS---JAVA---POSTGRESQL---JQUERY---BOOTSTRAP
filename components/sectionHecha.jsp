<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="java.util.ResourceBundle"%>

<%
 


 
Cookie cookie = null;
Cookie[] cookies = null;
String name = null;
String hecha = ".";
cookies = request.getCookies();
ResourceBundle resource;
 


 if (cookies != null) {
  for (int i = 0; i < cookies.length; i++) {
  		 cookie = cookies[i];
  		 name = cookie.getName();
  	
	   if("idioma".equals(name)){
		   try{
			    resource =  ResourceBundle.getBundle(cookie.getValue()); 
			    hecha = resource.getString("hecha");
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

         <section class="py-5">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h2><%= hecha %></h2>
                        <strong>Jhon anderson puentes hernandez </strong>
                        <hr>
                      
                <hr>
                         
                        <p class="mb-0 my-5 personalizada" style="font">Estudiantes de la carrera Ingenieria de Software de la Universidad Surcolombiana de la ciudad de Neiva, en su materia de programacion web.</p>
                    </div>
                </div>
            </div>
        </section>
