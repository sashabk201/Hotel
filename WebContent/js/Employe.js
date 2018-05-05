$(document).ready(function(){
   
	
	$("#addEmploye").click(function(){
		
    	var par = "addEmploye";
    	var n = $("#name").val();
    	var ps = $("#pasport").val();
    	var a = $("#adress").val();
    	var p = $("#phone").val();
        alert(n+ps+a+p);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	name: n,
            	phone: p,
            	pasport: ps,
            	adress: a,
            },
            url: 'Employe',
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
    
	
	$("#saveEmploye").click(function(){
		
    	var par = "saveEmploye";
    	var n = $("#name").val();
    	var ps = $("#pasport").val();
    	var a = $("#adress").val();
    	var p = $("#phone").val();
    	var id = $('#id').val();
        alert(id);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	name: n,
            	phone: p,
            	pasport: ps,
            	adress: a,
            	id: id,
            },
            url: 'Employe',
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
	
    
	
$("#delEmploye").click(function(){
		
    	var par = "delEmploye";
    	var id = $("#emploe").val();
        alert(id);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	id: id,
            },
            url: 'Employe',
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