<cfinclude template="header.cfm"> 

<html>
    <head>
    <title>Update Form</title>
    </head>
    
    <body>
    
    <cfparam name="URL.id" default="1" type="Numeric">
    <cfquery name="userupdate" datasource="coldfusion">
    SELECT * FROM kodionemp WHERE id = #URL.id#
    
    </cfquery>
    
    <cfoutput query="userupdate"> 
    <table>
    <form action="updateauth.cfm" method="Post">
    <input type="Hidden" name="id" value="#id#"><br>

   
    <tr>
        <td>First Name:</td>
        <td><input type="text" name="fname" value="#fname#"></td>
    </tr>
    
    <tr>
        <td>Last Name:</td>
        <td><input type="text" name="lname" value="#lname#"></td>
    </tr>

    <tr>
        <td>Username:</td>
        <td><input type="text" name="username" value="#username#"></td>
    </tr>

    <tr>
        <td>Email:</td>
        <td><input type="text" name="email" value="#email#"></td>
    </tr>

    <tr>
        <td>Phone:</td>
        <td><input type="text" name="phone" value="#phone#"></td>
    </tr>

    <tr>
        <td>dob:</td>
        <td><input type="text" name="dob" value="#dob#"></td>
    </tr>
        
    <td>&nbsp;</td>
    <td><input type="Submit" class="btn btn-info" value="Update">
    <a href="home.cfm" class="btn btn-danger" role="button">Cancel</a> </td>
    
    </tr>
    </form>
    </table>
    </cfoutput>
    
    </body>
    </html>