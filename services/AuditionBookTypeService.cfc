<cfcomponent displayname="AuditionBookTypeService" hint="Handles operations for AuditionBookType table" output="false"> 
<cffunction name="SELaudbooktypes" access="public" returntype="query">
    <cfargument name="audbooktypeid" type="numeric" required="false">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT audbooktypeid AS id, audbooktype AS name
            FROM audbooktypes
            WHERE isdeleted = 0
            AND audbooktypeid <> 0
            <cfif structKeyExists(arguments, "audbooktypeid")>
                AND audbooktypeid = <cfqueryparam value="#arguments.audbooktypeid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudBookTypes: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while retrieving audio book types." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
