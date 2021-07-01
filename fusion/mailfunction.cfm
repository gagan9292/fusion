<cfinclude template="header.cfm"> 

<cfquery name="getuser" datasource="coldfusion">
    select * from kodionemp Where id = #Session.id# 
</cfquery> 
<cfdump var = "#getuser#">


<cfmail 
    query="getuser"
	from="gagandeepsinghqa@gmail.com"
    to="#getuser.email#"
	subject="Welcome to Bedrock"
    type="HTML">
	
    
	Dear #getuser.fname#

	We, here at Bedrock, would like to thank you for joining.

	Best wishes
	Barney
</cfmail>

<cfdump var = "#cfmail#">

<cfoutput>
    <p>Thank you #getuser.email# for registering.
    We have just sent you an email.</p>
</cfoutput>