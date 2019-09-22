// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


function add_item(el,url,id){
     
	 //let ul = document.getElementById("board_items");
	 
  	 el.addEventListener("keyup", function(event) {
   	  event.preventDefault();
	  
	  const data = {description: el.value}
	  var token = document.getElementsByName("csrf-token")[0].content;
	  
   	 	if (event.keyCode === 13) {
			
			  fetch(url,{
                  method: 'POST', // *GET, POST, PUT, DELETE, etc.
				  headers: {
				    'X-CSRF-Token': token,
					'Content-Type': 'application/json'
				  },
				  body: JSON.stringify(data)
                })
			  .then(function(response) {
			    return response.json();
			  })
			  .then(function(myJson) {
				  lists(myJson);
				  el.value = "";
			      //console.log(JSON.stringify(myJson));
			  });
   	 	}
	});
	
	 function lists(json){
		
		if (json.status == "created"){
			
			var ul = document.getElementById("board_items-"+id);
			const li_before_delete = ul.querySelectorAll("li");
			
			li_before_delete.forEach((li)=>{
			   	li.remove();
			});
			
			for (var i = 0; i < json.board_items.length; i++) {
			    var name = json.board_items[i];
			    var li = document.createElement('li');
			    li.appendChild(document.createTextNode(name.description));
			    ul.appendChild(li);
			}
		}
		

	}


}

window.add_item = add_item;