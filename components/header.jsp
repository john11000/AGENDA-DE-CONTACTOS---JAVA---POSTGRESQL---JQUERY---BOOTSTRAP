<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.ResourceBundle"%>

<%
 


 
Cookie cookie = null;
Cookie[] cookies = null;
String name = null;
String titulo = ".";
String btnVer =".";
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
			    btnVer = resource.getString("btnVer");
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
    

       <header class="py-5 bg-image-full" style="background-image: url('./assets/fondo.bmp');height:500px;" onclick="window.location.href=`app`">
            <div class="text-center my-5">
                
            </div>
        </header>