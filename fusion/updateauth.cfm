
<cfinclude template="header.cfm"> 

<cfif isDefined("Form.doc") > 
  <cffile action = "upload"
  fileField = "doc"
  destination = "C:\ColdFusion11\cfusion\wwwroot\upload\" 
  nameConflict = "MakeUnique"> 

  <cfquery name="updatedoc" datasource="coldfusion">
      UPDATE kodionemp SET doc = '#cffile.SERVERFILE#', docpath = '#cffile.SERVERDIRECTORY#' WHERE id = '#id#'
  </cfquery>
</cfif>


<html>
  <head>
  <title>Input form</title>
  </head>
  
  <body>
      <cfset errormessage = "">
  
  <cfif not isdefined("Form.Contract")>
  <cfset Form.Contract = "No">
  </cfif>
  
  <cfif isDefined("Form.fname") and Form.fname eq "">
      <cfset errormessage = "Name is required">
      <cfoutput>#errormessage#<br></cfoutput>
  </cfif>
 
  
  <cfif isDefined("Form.lname") and Form.lname eq "">
      <cfset errormessage = "Name is required">
      <cfoutput>#errormessage#<br></cfoutput>
  </cfif>
  
  <cfif isDefined("Form.username") and Form.username eq "">
      <cfset errormessage = "username is required">
      <cfoutput>#errormessage#<br></cfoutput>
  </cfif>
  
  <cfif isDefined("Form.phone") and Form.phone eq "">
      <cfset errormessage = "phone is required">
      <cfoutput>#errormessage#<br></cfoutput>
  </cfif>

  <cfif isDefined("Form.dob") and Form.dob eq "">
      <cfset errormessage = "dob is required">
      <cfoutput>#errormessage#<br></cfoutput>
  </cfif>

  <cfif errormessage EQ "" and Form.Contract NEQ "" >

      <cfquery name="checkusername" datasource="coldfusion">
          select * from kodionemp where username = '#username#'
      </cfquery>

      <cfif checkusername.RecordCount GT 0 and id NEQ checkusername.id>
          <cfset user_err = "Username already exist">
          <cfoutput>#user_err#</cfoutput>
          
      <cfelse>
          <cfquery name="updateemployee" datasource="coldfusion">
              UPDATE kodionemp SET fname = '#Form.fname#' , lname = '#Form.lname#', username = '#Form.username#', email = '#Form.email#' , phone = '#Form.phone#' , dob = '#Form.dob#' WHERE id = '#id#'
          </cfquery>
          
          SUCESS     
          
          <h1>Employee Updated</h1>
          <cfoutput>Updated Record For #Form.fname# #Form.lname#. </cfoutput>
      </cfif>
  
  </cfif> 
  
  <!--- <a href="index.cfm">Click to view updated record</a> --->
  <cflocation url = "home.cfm">
  </body>
  </html> 


  