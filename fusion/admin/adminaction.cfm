<cfinclude template="header.cfm"> 

<html>
    <head>
        <title>Logged in User</title>
    </head>
    <body>
               
        <cfset errmsg = "The Email or password is incorrect">

        <cfif not isdefined("Form.login")>
            <cfset Form.login = "No">
            </cfif>

        <cfif isDefined("Form.username") and Form.username neq "">
        <cfif isDefined("Form.password") and Form.password neq "">

            <cfquery name="admindetail" datasource="coldfusion">
                select * from kodionemp
                WHERE username = '#Form.username#' AND password = '#Form.password#'  
            </cfquery>                          
            
            <cflock timeout=20 scope="session" type="Exclusive" >                           
                <cfset Session.id = "#admindetail.id#">
                <cfset Session.role = "#admindetail.role#">
            </cflock>
            

          <cflocation url = "home.cfm" addtoken= "true">
        <cfelse>            
            <cflocation url = "index.cfm?error=#errmsg#" >
        </cfif>
    </cfif>

    </body>
</html>