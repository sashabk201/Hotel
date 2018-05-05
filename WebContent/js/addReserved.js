$(document).ready(function(){
   
	
	$("#reserved").click(function(){
		
    	var par = "reserved";
    	var n = $("#dateb").val();
    	var d = $("#datee").val();
        alert(n+' '+d);
        
        window.location.replace("http://127.0.0.1:8080/Hotel/addReservedRoom?dateb="+n+"&datee="+d);
        
/*        $.ajax
        ({
            type: "GET",
            data:{
            	par: par,
            	dateb: n,
            	datee : d,
            },
            url: 'addReservedRoom',
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
        });*/
    });

	
$("#reservedRoom").click(function(){
		
    	var par = "reservedRoom";
    	var n = $("#dateb").val();
    	var d = $("#datee").val();
    	var idr = $("#idr").val();
    	var idtp = $("#idtp").val();
        alert(n+' '+d);
        
        $.ajax
        ({
            type: "POST",
            data:{
            	par: par,
            	dateb: n,
            	datee : d,
            	idr : idr,
            	idtp : idtp,
            },
            url: 'addReservedRoom',
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