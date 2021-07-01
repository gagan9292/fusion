<cfinclude template="header.cfm"> 

<html>
    <br/>  

    <body>
        
        <form action="signupaction.cfm" method="post" style="border:1px solid #ccc">
        <div class = "container">
<cfif isDefined("url.error")>
    <font color="##FF0000"><cfoutput>#url.error#</cfoutput></font>
</cfif>
            <h2><b>Sign up for User</b></h2>
            <div class = "form-group">   
  
    <label for="fname"><b>First Name<br></label>
    <input type="text" placeholder="Enter First Name" class="form-control" name = "fname"><br>
    
    <label for="lname"><b>Last Name</b></label>
    <input type="text" placeholder="Enter Last Name" class="form-control" name = "lname"><br>

    <label for="username"><b>Username<br></label>
    <input type="text" placeholder="Enter username" class="form-control" id = "username" name = "username"><br>
    <span id="uname_response"></span>
        
    <label for="phone"><b>Phone Number</b></label>
    <input type="text" placeholder = "Enter Phone Number" class="form-control" name = "phone"><br>

    <label for="dob"><b>DOB</b></label>
    <input type="date" placeholder="Enter DOB" class="form-control" name = "dob"><br>

    <label for="password"><b>Password</b></label>
    <input type= "password" placeholder="Enter Password" class="form-control" name = "password" id="user_pwd"><br>
    <span id="strength_message"></span>

    <label for="con_pass"><b>Confirm Password</b></label>
    <input type= "password" placeholder="Enter Confirm Password" class="form-control" name = "con_pass" id="con_pass"><br>
    <span id="constrength_message"></span>
      
    <script>
        $(document).ready(function(){
    
            $("#username").keyup(function(){
         
              var username = $(this).val().trim();
         
              if(username != ''){
         
                 $.ajax({
                    url: 'ajaxfile.cfm',
                    type: 'post',
                    data: {username:username},
                    success: function(response){
         
                       // Show response
                       
                       $("#uname_response").html(response);
         
                    }
                 });
              }else{
                 $("#uname_response").html("");
              }
         
           });
         
         });
    </script>

<script>
    $(document).ready(function()
    {
    $("#user_pwd").keyup(function()
    {
        $('#strength_message').html(checkStrength($('#user_pwd').val()))
    }) 
   	
    function checkStrength(password)
    {
        var strength = 0
        if (password.length < 6) { 
            $('#strength_message').removeClass()
            $('#strength_message').addClass('short')
            return 'Too short' 
        }
        
        if (password.length > 7) strength += 1
        if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))  strength += 1
        if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/))  strength += 1 
        if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/))  strength += 1
        if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
        if (strength < 2 )
        {
            $('#strength_message').removeClass()
            $('#strength_message').addClass('weak')
            return 'Weak'			
        }
        else if (strength == 2 )
        {
            $('#strength_message').removeClass()
            $('#strength_message').addClass('good')
            return 'Good'		
        }
        else
        {
            $('#strength_message').removeClass()
            $('#strength_message').addClass('strong')
            return 'Strong'
        }
    }
    });
</script>


    <script>
        $('#user_pwd, #con_pass').on('keyup', function () {
        if ($('#user_pwd').val() == $('#con_pass').val() ) {
            $('#constrength_message').html('Matching').css('color', 'green');
        } else 
            $('#constrength_message').html('Not Matching').css('color', 'red');
        });
    </script>




<!--- <style>
span#strength_message #constrength_message {
    display: block;
}
   .short{
	color:#FF0000;
}

 .weak{
	color:#E66C2C;
}

 .good{
	color:#2D98F3;
}

 .strong{
	color:#006400;
}
</style> --->

    <button type="submit" class="btn btn-primary">Sign up</button>
    <a href="index.cfm" class="btn btn-danger" role="button">Cancel</a>
    
    </div>

    </form>


</body>
   
    </html>