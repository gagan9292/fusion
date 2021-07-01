<cfinclude template="header.cfm"> 
<html>
    <body>
        
    <cfquery name="deleteuser" datasource="coldfusion">
    DELETE FROM kodionemp WHERE id = '#id#'
    </cfquery>
    
    <cfoutput>You have deleted Record For #id#.
    </cfoutput>
    <cflocation url ="home.cfm">
    
    
    </body>
    </html>