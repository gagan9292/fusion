
<cfinclude template="header.cfm"> 
<html>

    <body>
       
    <cfset errormessage = "">
     
    <cfif not isdefined("Form.signup")>
    <cfset Form.signup = "No">
    </cfif>

    <cfif isDefined("Form.fname") and Form.fname eq "">
        <cfset errormessage = "Firstname is required">

    <cfelseif isdefined("Form.username") and Form.username eq "">
        <cfset errormessage = "Username is required">

    <cfelseif isDefined("Form.password") and Form.password eq ""> 
    <cfelseif isDefined("Form.con_pass") and Form.con_pass eq "">
    <cfelseif Form.password neq Form.con_pass>
        <cfset errormessage = "Password doesn't match">
       
    </cfif>
    <cfoutput>#errormessage#</cfoutput>
    
    <cfif errormessage NEQ ""  >
        <cflocation url = "signup.cfm?error=#errormessage#"> 

    <cfelseif errormessage eq "">
    
        <cfquery name="checkusername" datasource="coldfusion">
            select * from kodionemp where username = '#username#'
        </cfquery>
              
        <cfif checkusername.RecordCount eq 0>
            <cfquery name="adduser" datasource="coldfusion">
                INSERT INTO kodionemp (fname, lname, username, phone, dob, password)
                VALUES ('#Form.fname#','#Form.lname#', '#Form.username#', '#Form.phone#', '#Form.dob#', '#Form.password#')
            </cfquery>
            <cflocation url = "index.cfm">
        <cfelse>
            <cfset user_err = "Username already exist">
            <cflocation url = "signup.cfm?error=#user_err#">
            <cfdump var = "#user_err#">
        </cfif>
    </cfif>
    
    </body>
    </html>
    