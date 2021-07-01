
function edit(id){
    $("#edituser").modal("show");
    $.ajax({
        url: "http://127.0.0.1:8500/ajax.cfc?method=updateuser",
        type: "POST",
        cache: false,
        dataType: 'json',
        data: {'id': id},
        success: function(dataResult){
            console.log(dataResult);
            var resultData = dataResult.data;
            console.log(dataResult.COLUMNS);
            var bodyData = '';
            var i=1;
            $.each(dataResult.COLUMNS,function(index,row){

                if(row == 'ID' ){
                    $("#edituser #id").val(dataResult.DATA[0][index]);
                }                
                if(row == 'FNAME' ){
                    $("#edituser #fname").val(dataResult.DATA[0][index]);
                }
                if(row == 'LNAME' ){
                    $("#edituser #lname").val(dataResult.DATA[0][index]);
                }
                if(row == 'USERNAME' ){
                    $("#edituser #username").val(dataResult.DATA[0][index]);
                }
                if(row == 'PHONE' ){
                    $("#edituser #phone").val(dataResult.DATA[0][index]);
                }
                if(row == 'DOB' ){
                    $("#edituser #dob").val(dataResult.DATA[0][index]);
                }
                if(row == 'DOCUMENT' ){
                    $("#edituser #doc").val(dataResult.DATA[0][index]);
                }
               
                                           
            })
            
        }
    });
}




   


