
<cfquery name="checkusername" datasource="coldfusion">
    select *  from kodionemp where username = '#username#'
</cfquery>



<cfif checkusername.RecordCount eq 0>
 
            <cfoutput>Username available</cfoutput> 
           <cfabort>
        <cfelse>
  
    <cfoutput>Username already exist</cfoutput>   
    
</cfif>

