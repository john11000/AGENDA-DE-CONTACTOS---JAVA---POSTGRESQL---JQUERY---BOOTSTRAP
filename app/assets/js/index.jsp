<%@ page language="java" contentType="text/javascript; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
let datos;
    const table = document.querySelector(".contact_table");
 const url = '/pruebas/api/GetContats'
var d = new Object();
d.us = '1';



  fetch(url, {
  method: 'POST',
  body: JSON.stringify(d), 
  headers:{
    'Content-Type': 'application/json'
  }
}).then(res => res.text())

.catch(error => console.error('Error:', error))
.then(response => {

response = JSON.parse(response)
datos = response
updateTable(response)







});
