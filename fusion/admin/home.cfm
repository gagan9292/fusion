
<cfinclude template="header.cfm"> 
<cfif isDefined ("session.id") and session.id neq "">
    <cfif isDefined("session.role") and session.role neq "">
        <cfif session.role eq "admin">

            <cfdump var = "#session.id#">

    

<html>
  <body>
<a href="..adduser.cfm" class="btn btn-info" role="button">Add User</a>

<a href="adminlogout.cfm" class="btn btn-info" role="button">Logout</a>

<cfquery name="getusersinfo" datasource="coldfusion">
    select * from kodionemp 
</cfquery>    
    
    <H2>Employee Records</H2>
    
<TABLE CELLPADDING="3" CELLSPACING="0">
    <TR BGCOLOR="#888888">
        <TH>ID</TH>
        <TH>Name</TH>
        <TH>Username</TH>
        <TH>Phone</TH>
        <TH>dob</TH>
        <TH>Action</TH>
        
    </TR>
            
    <CFOUTPUT QUERY="getusersinfo" >
    <TR BGCOLOR="##C0C0C0">
        <TD>#id#</TD>
        <TD>#fname# #lname#</TD> 
        <TD>#username#</TD>
        <TD>#phone#</TD>
        <TD>#dob#</TD>
        <TD><a href="..update.cfm?From=edit&id=#id#">Edit</a> | <a href="..delete.cfm?From=delete&id=#id#" onclick="return confirm('Are you sure want to delete?')">Delete</a></TD>
    </CFOUTPUT>
    </TR>  
</TABLE>

</body>
</html>
<cfelse>
    <cfset loginerr = "The Email or password is incorrect">
    <cflocation url = "index.cfm?error=#loginerr#" >
</cfif>
</cfif>

<cfelse>
    <cfset adminloginerr = "User is not Admin">
    <cflocation url = "index.cfm?error=#adminloginerr#" >
</cfif>

    
  