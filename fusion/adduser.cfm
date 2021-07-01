<cfinclude template="header.cfm"> 

<html>
    <a href="home.cfm" class="btn btn-info" role="button">View Record</a>
    
        <br/>
        <br/>
         
        
        <body>
        <cfif isDefined("url.errormessage")>
          <font color="##FF0000"><cfoutput>#url.errormessage#</cfoutput></font>
        </cfif>

            <div class="container">
                <h3>Add User</h3>
            <div class = "form-group">
                <form action="adduseraction.cfm" method="post">
            <label for = "fname"><b>First Name<br></label>
            <input type ="text" placeholder="Enter First Name" class="form-control" name = "fname"><br>

            <label for = "lname"><b>Last Name<br></label>
            <input type ="text" placeholder="Enter Last Name" class="form-control" name = "lname"><br>

            <label for = "username"><b>Username<br></label>
            <input type ="text" placeholder="Enter username" class="form-control" name = "username"><br>

            <label for = "phone"><b>Phone Number<br></label>
            <input type ="number" placeholder="Enter Phone number" class="form-control" name = "phone"><br>

            <label for = "dob"><b>DOB</label>
            <input type ="date" placeholder="Enter DOB" class="form-control" name = "dob"><br>

            <label for = "Document"><b>Document</label>
            <input type ="file" class="form-control" name = "document"><br>

            <label for="password"><b>Password</b></label>
            <input type= "password" placeholder="Enter Password" class="form-control" name = "password" id="user_pwd"><br>
            <span id="strength_message"></span>

            <label for="con_pass"><b>Confirm Password</b></label>
            <input type= "password" placeholder="Enter Confirm Password" class="form-control" name = "con_pass" id="con_pass"><br>
            <span id="constrength_message"></span>

            <script>
                $(document).ready(function()
                {
                    $("#user_pwd").keyup(function()
                    {
                        $('#strength_message').html(checkStrength($('#user_pwd').val()))
                    })
                    
                    $("#con_pass").keyup(function()
                    {
                        $('#constrength_message').html(checkStrength($('#con_pass').val()))
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
            
            <div class = "clearfix" >
            <button type="submit" class="btn btn-primary">Add User</button>

    </div>
</div>

        
            
      
    </form>
</body>
</html>