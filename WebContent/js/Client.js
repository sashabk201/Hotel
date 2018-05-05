$(document).ready(function(){
   
	
	$("#add").click(function(){
		
    	var par = "add";
    	var n = $("#name").val();
    	var ps = $("#pasport").val();
    	var a = $("#adress").val();
    	var p = $("#status").val();
        alert(n+ps+a+p);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	name: n,
            	status: p,
            	pasport: ps,
            	adress: a,
            },
            url: 'Client',
            success:function(serverData)
            {
            	if(serverData.indexOf("true") > -1){
                	alert("Данные сохранены");
                	location.reload();
            	}
            	else
            	{
            		alert("Ошибка!");
            	}
            },
        });
    });
    
	
$("#save").click(function(){
		
    	var par = "save";
    	var n = $("#name").val();
    	var ps = $("#pasport").val();
    	var a = $("#adress").val();
    	var p = $("#status").val();
    	var id = $('#id').val();
        alert(n+ps+a+p);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	name: n,
            	status: p,
            	pasport: ps,
            	adress: a,
            	id: id,
            },
            url: 'Client',
            success:function(serverData)
            {
            	if(serverData.indexOf("true") > -1){
                	alert("Данные сохранены");
                	location.reload();
            	}
            	else
            	{
            		alert("Ошибка!");
            	}
            },
        });
    });
	
	
});