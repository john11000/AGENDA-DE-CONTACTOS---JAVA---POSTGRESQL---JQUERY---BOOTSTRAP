/**
 * 
 */

function updateTable(data){
		
data.map((n, index )=>{



	table.innerHTML +=`
	<tr>
						<td >
							<div class="custom-checkbox" onclick="select(${index})">
								<input type="checkbox" index="checkbox${index}" name="options[]"  value="${index}">
								<label for="checkbox${index}"></label>
							</div>
							
						</td >
						<td>${n.nombre}</td>
						<td>${n.email}</td>
						<td>89 Chiaroscuro Rd, Portland, USA</td>
						<td>${n.telefono}</td>
						<td>
							<a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" onclick="edit(${index})" title="Edit">&#xE254;</i></a>
							<a href="#deleteEmployeeModal" class="delete " data-toggle="modal"><i class="material-icons" data-toggle="tooltip" onclick="eliminar(${index})" title="Delete">&#xE872;</i></a>
						</td>
					</tr>
	

	
	`
	




})
}




