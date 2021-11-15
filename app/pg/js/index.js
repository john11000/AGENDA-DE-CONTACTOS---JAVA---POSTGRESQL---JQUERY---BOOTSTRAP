/**
 * 
 */

function updateTable(data){
		table.innerHTML = ""
		$(".hint-text").html(`<p>El numero de contactos es : <Strong>${data.length}</strong> </p>`)
		
data.map((n, index )=>{

$(".uname").html(` Bievenido ${n.username}`)

	table.innerHTML +=`
	<tr>
						
						<td>
							<span class="custom-checkbox" >
								<input onchange="edit(${index})" type="checkbox"  id="checkbox${index}" name="options[]" value="${index}">
								<label for="checkbox${index}"></label>
							</span>
							<td>${index + 1}</td>
							<td>${n.nombre}</td>
						<td>${n.email}</td>
						
						<td>${n.telefono}</td>
						<td>
							<a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" onclick="edit(${index})" title="Edit">&#xE254;</i></a>
							<a href="#deleteEmployeeModal" class="delete " data-toggle="modal"><i class="material-icons" data-toggle="tooltip" onclick="eliminar(${index})" title="Delete">&#xE872;</i></a>
						</td>
	</tr>
				
	`
	




})
$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
}




