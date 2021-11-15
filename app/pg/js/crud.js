let elemento;
let optionsSelected = []
let optionSelectedN = 0;


function select(n){
	
	
	if(optionsSelected.includes(n)){
			optionSelectedN--
			optionsSelected.splice(optionsSelected.indexOf(n),1)
		
	}else{
		
		
			optionSelectedN++
			optionsSelected.push(n)
	}

	
	//alert(optionSelected)
	console.log("do you want to delete this contacts " + optionsSelected )
}




function edit(i){
	elemento = i
	
	$(".editUser").html(`

				<div class="modal-body">					
					<div class="form-group">
						<label>Nombre</label>
						<input type="text" class="form-control en" placeholder="${datos.info[i].nombre}" required>
					</div>
					<div class="form-group">
						<label>Email</label>
						<input type="email" placeholder="${datos.info[i].email}" class="form-control em" required>
					</div>
					
					<div class="form-group">
						<label>Phone</label>
						<input type="number"  placeholder="${datos.info[i].telefono}" class="form-control et" required>
					</div>					
				</div>
			


`)
	
	
	
}


function eliminar(i){
	
	elemento = i
	if(i=="n"){
			$(".delC").html(`<p>Ningun contacto selecionado</p>
				`
	)
	}else{
			$(".delC").html(`<p>El usuario #${i +1} ${datos.info[i].nombre} sera eliminado</p>
					<p class="text-warning"><small>This action cannot be undone.</small></p>`
	)
	}
	

}

$(".deleteAll").click(function(){
	if(optionsSelected.length !=0){
		
	}else{
			eliminar("n")
	}

})






$("#create").submit(function(event){
	  event.preventDefault();
var myHeaders = new Headers();
myHeaders.append("nombre", "");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({
    "us": d.us,
    "nombre": $(".cn").val(),
    "email" : $(".cm").val(),
    "telefono" : $(".cp").val(),
    "direccion" : $(".ca").val(),
 
});

console.log(raw)
var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("/pruebas/api/GetContats/create", requestOptions)
  .then(response => response.json())
  .then(result => {
	
	console.log(result)
	if(result[0].msg != 0 )
	{
		$(".cancelc").click()
		getData()
	}
	
	})
  .catch(error => console.log('error', error));
	console.log(datos.info[elemento])

	
})



$(".btn-dele").click(function(){
var myHeaders = new Headers();
myHeaders.append("nombre", "");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({
  "us" : d.us,
  "id_contacto": datos.info[elemento].id_con
});

var requestOptions = {
  method: 'DELETE',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("http://localhost:8080/pruebas/api/GetContats/delete", requestOptions)
  .then(response => response.json())
  .then(result => {
	
	console.log(result)
	if(result[0].msg != 0 )
	{
		getData()
	}
	
	})
  .catch(error => console.log('error', error));
	console.log(datos.info[elemento])

	
})
$( "#bUpdate1" ).submit(function( event ) {
  bUpdate()
$(".cancel").click()
  event.preventDefault();
});




function bUpdate(){

//console.log($(".en").val())
//console.log($(".em").val())
//console.log($(".et").val())
//alert(datos.info[elemento].id_con)
var myHeaders = new Headers();
myHeaders.append("nombre", "");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({
  "us": d.us,
  "nombre": $(".en").val(),
  "email": $(".em").val(),
  "telefono": $(".et").val(),
  "direccion":  $(".et").val(),
  "id_contacto": datos.info[elemento].id_con
});

var requestOptions = {
  method: 'PUT',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("/pruebas/api/GetContats/update", requestOptions)
  .then(response => response.json())
  .then(result => {
	
	console.log(result)
	if(result[0].msg != 0 )
	{
		getData()
	}
	
	})
  .catch(error => console.log('error', error));
	console.log(datos.info[elemento])

	
}

$(".cajon_0").click(function(){
	window.location.href="/pruebas/Salir"
})


