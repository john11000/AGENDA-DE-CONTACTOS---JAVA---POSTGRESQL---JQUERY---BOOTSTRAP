<%@ page language="java" contentType="text/javascript; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>






const delete_cookie = function(name) {
    document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
};


const idioma = document.querySelector(".switchLanguage");


idioma.addEventListener("change", ()=>{

let selected = idioma.options[idioma.selectedIndex].text[0] + idioma.options[idioma.selectedIndex].text[1] 
selected = selected.toLowerCase();
delete_cookie("idioma")
document.cookie = "idioma=" + selected+ ";max-age=3600; path=/pruebas";

window.location.href="./";




});





$("#sing").submit(function(event){
	  event.preventDefault();
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({
  "us": $(".lus").val(),
  "passwd":  $(".lps").val(),
  "primer_nombre": $(".lpn").val(),
  "segundo_nombre": $(".lsn").val(),
  "primer_apellido": $(".lpa").val(),
  "segundo_apellido": $(".lsa").val()
});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("http://localhost:8080/pruebas/api/usuarios/create", requestOptions)
  .then(response => response.json())
  .then(result => 
  {
  if(result[0].msg != 0 )
	{
		window.location.href="./login.jsp"
	}
  }
  
  )
  .catch(error => console.log('error', error));

})

