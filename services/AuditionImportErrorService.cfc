<cfcomponent displayname="AuditionImportErrorService" hint="Handles operations for AuditionImportError table" output="false"> 
<cffunction name="getErrorMessageById" access="public" returntype="query">
    <cfargument name="id" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT error_msg 
            FROM auditionsimport_error 
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getErrorMessageById: #cfcatch.message# Query: SELECT error_msg FROM auditionsimport_error WHERE id = #arguments.id#">
            <cfset result = queryNew("error_msg", "varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertAuditionsImportError" access="public" returntype="void">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="errorMsg" type="string" default="Duplicate project">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO auditionsimport_error (id, error_msg)
            VALUES (
                <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.errorMsg#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into auditionsimport_error: #cfcatch.message# Query: INSERT INTO auditionsimport_error (id, error_msg) VALUES (#arguments.id#, '#arguments.errorMsg#')">
            <cfthrow message="An error occurred while inserting the record." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertAuditionsImportError" access="public" returntype="void">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="errorMsg" type="string" default="Missing project name">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO auditionsimport_error (id, error_msg)
            VALUES (
                <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.errorMsg#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into auditionsimport_error: #cfcatch.message#; Query: INSERT INTO auditionsimport_error (id, error_msg) VALUES (#arguments.id#, '#arguments.errorMsg#')" type="error">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertAuditionsImportError" access="public" returntype="void">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="errorMsg" type="string" default="Missing Role name">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO auditionsimport_error (id, error_msg) 
            VALUES (
                <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">, 
                <cfqueryparam value="#arguments.errorMsg#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" type="error" text="Error in insertAuditionsImportError: #cfcatch.message#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertAuditionsImportError" access="public" returntype="void">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="errorMsg" type="string" default="Invalid Category">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO auditionsimport_error (id, error_msg)
            VALUES (
                <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.errorMsg#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAuditionsImportError: #cfcatch.message# Query: INSERT INTO auditionsimport_error (id, error_msg) VALUES (#arguments.id#, #arguments.errorMsg#)">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertAuditionImportError" access="public" returntype="void">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="errorMsg" type="string" default="Invalid Source">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO auditionsimport_error (id, error_msg)
            VALUES (
                <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.errorMsg#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAuditionImportError: #cfcatch.message#">
            <cflog file="application" text="Query Error Details: #cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
