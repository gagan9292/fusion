<cfinclude template="header.cfm"> 

<html>
        <br/>
              
       
        <cfif isDefined("url.errmsg")>
            <font color="##FF0000"><cfoutput>#url.errmsg#</cfoutput></font>
          </cfif>
        <body>
        <form action="adminaction.cfm" method="post">
            <div class = "container">
                <h2><b>Admin Login</b></h2>
            <div class = "form-group">
                
            <label for = "username"><b>Username</label>
            <input type ="text" placeholder="Enter username" class="form-control" name = "username"><br>

            <label for = "email">Password</label>
            <input type = "password" placeholder = "Enter password" class="form-control" name = "password"><br><br>

           
            <button type="submit" class="btn btn-primary">Login</button>
            
            <label>
            <input type = "checkbox" checked = "checked" name = "remember"> Remember Me
            </label><br>
    </div>

        <div class = "container"  style ="background-color:#fffff">
           
            <span class = "password">Forgot <a href="#"> Password?</a></span>
        </div>
    </form>
</body>
</html>