/**
 * 
 */



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
	console.log("do you want to delete this contacts " + optionSelectedN )
}

function edit(i){
	
	
	
}


function eliminar(i){
	
	document.querySelector(".delC").innerHTML=`<p>Are you sure you want to delete these ${optionSelectedN}</p>
					<p class="text-warning"><small>This action cannot be undone.</small></p>`
	
}

$(".deleteAll").click(function(){
	alert("all")
	eliminar(0)
	
	
})


