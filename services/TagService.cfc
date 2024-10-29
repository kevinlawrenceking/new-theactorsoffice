<cfcomponent displayname="TagService" hint="Handles operations for Tag table" output="false"> 
<cffunction name="getTags" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT * FROM tags">
    <cfset var whereClause = "">
    <cfset var paramList = []>

    <cfif structCount(arguments.conditions) gt 0>
        <cfset whereClause = " WHERE ">
        <cfloop collection="#arguments.conditions#" item="key">
            <cfset arrayAppend(paramList, "#key# = ?")>
        </cfloop>
        <cfset whereClause &= arrayToList(paramList, " AND ")>
    </cfif>

    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql##whereClause#
            <cfloop collection="#arguments.conditions#" item="key">
                <cfqueryparam value="#arguments.conditions[key]#" cfsqltype="#determineSQLType(key)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error executing getTags: #cfcatch.message# Query: #sql##whereClause# Parameters: #serializeJSON(arguments.conditions)#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction></cfcomponent>
