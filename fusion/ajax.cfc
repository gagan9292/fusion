

<cfcomponent>
<cffunction name="updateuser" access="remote" returnformat="JSON"> 
    <cfquery name="userupdate" datasource="coldfusion">
        SELECT * FROM kodionemp WHERE id = #id#
    </cfquery> 
    <cfreturn userupdate> 
</cffunction>  
</cfcomponent>