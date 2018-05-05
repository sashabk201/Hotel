$(document).ready(function(){
   
	
	$("#save").click(function(){
		
    	var par = "save";
    	var n = $("#dateend").val();
        var id = $("#id").val();
        //alert(id+' '+n);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	id: id,
            	dateend: n,
            },
            url: 'ReservedRoom',
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
	
	
	
	$("#passed").click(function(){
		
    	var par = "passed";
        var id = $("#id").val();
       // alert(id);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	id: id,
            },
            url: 'ReservedRoom',
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
    
	
	$("#addclient").click(function(){
		
    	var par = "addclient";
        var id = $("#id").val();
        var c = $("#client").val();
       // alert(id);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	id: id,
            	client: c,
            },
            url: 'ReservedRoom',
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
	
	
	$("#delclient").click(function(){
		
    	var par = "delclient";
        var id = $("#id").val();
        var c = $("#clientdel").val();
        //alert(id+' '+c);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	id: id,
            	clientdel: c,
            },
            url: 'ReservedRoom',
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
    
	
	$("#addservese").click(function(){
		
    	var par = "addservese";
        var id = $("#id").val();
        var c = $("#servese").val();
        //alert(id+' '+c);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	id: id,
            	servese: c,
            },
            url: 'ReservedRoom',
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