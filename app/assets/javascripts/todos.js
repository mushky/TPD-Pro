// $(function(){
//   $("form").submit(function() {
//     event.preventDefault();

//     var action = $(this).attr('action');
//     var method = $(this).attr('method');
    
//     var name = $(this).find('#todo_name').val();
//     var due_date = $(this).find('#todo_due_date').val();
//     var complete = $(this).find('#todo_complete').val();

//     var data = $(this).serializeArray();
    
//     $.ajax({
//       method: method,
//       url: action,
//   		data: { name: name, due_date: due_date, complete: complete }
      
//       // Send back Javascript not html
//   		dataType: 'script'

//     }); 
 	
//   });  
// });