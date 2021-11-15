<%@ page language="java" contentType="text/javascript; charset=utf-8"
    pageEncoding="utf-8"%>
let datos = [];
    const table = document.querySelector(".resultados");
 const url = '/pruebas/api/GetContats'
var d = new Object();
d.us =  <%=session.getAttribute("id")%>



function getData (){


  fetch(url, {
  method: 'POST',
  body: JSON.stringify(d), 
  headers:{
    'Content-Type': 'application/json'
  }
}).then(res => res.json())
  .then(data => {
  
  updateTable(data)
  datos.info = data
  
  
  })
  .then(() => console.log(datos))

.catch(error => console.error('Error:', error))



}
getData()

console.log(datos)