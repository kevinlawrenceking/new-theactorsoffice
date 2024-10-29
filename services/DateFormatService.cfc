<cfcomponent displayname="DateFormatService" hint="Handles operations for DateFormat table" output="false"> 
<cffunction name="getDateFormats" access="public" returntype="query">
    <cfargument name="id" type="numeric" required="false" default="">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT id, formatexample, formatnotes
            FROM dateformats
            WHERE 1=1
            <cfif len(arguments.id)>
                AND id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDateFormats: #cfcatch.message#">
            <cfset result = queryNew("id, formatexample, formatnotes")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
