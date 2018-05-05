$(document).ready(function(){
   
	
	$("#save").click(function(){
		
    	var par = "save";
    	var n = $("#number").val();
    	var t = $("#typeRoom").val();
    	var f = $("#floor").val();
    	var p = $("#phone").val();
    	var pr = $("#price").val();
    	var d = $("#desc").val();
        var id = $("#id").val()
        alert(id+' '+n+' '+d);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	id: id,
            	number: n,
            	typeRoom: t,
            	floor: f,
            	phone: p,
            	price: pr,
            	desc: d,
            },
            url: 'Room',
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
    
	
	$("#addEm").click(function(){
		
    	var par = "addEm";
    	var ide = $("#ide").val();
    	var idet = $("#idet").val();
    	var date = $("#date").val();
        var id = $("#id").val()
        alert(id+' '+ide+' '+idet);
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	id: id,
            	ide: ide,
            	idet: idet,
            	date: date,
            },
            url: 'Room',
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