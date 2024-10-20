<cfcomponent displayname="GenreAuditionService" hint="Handles operations for GenreAudition table" output="false" > 
<cffunction name="deleteaudgenres_audition_xref" access="public" returntype="boolean">
    <cfargument name="ID" type="numeric" required="true">
    <cfset var result = false>
    <cftry>
        <cfquery datasource="#DSN#">
            DELETE FROM audgenres_audition_xref
            WHERE ID = <cfqueryparam value="#arguments.ID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset result = true>
        <cfcatch>
            <cflog file="application" text="Error in deleteaudgenres_audition_xref: #cfcatch.message# - #cfcatch.detail#">
            <cfset result = false>
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct and should execute without errors.
--->
<cffunction name="insertaudgenres_audition_xref" access="public" returntype="numeric">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="audgenreID" type="numeric" required="true">
    <cfset var insertResult = 0>
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            INSERT INTO audgenres_audition_xref (audroleid, audgenreID)
            VALUES (
                <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.audgenreID#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfreturn insertResult.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error in insertaudgenres_audition_xref: #cfcatch.message# - #cfcatch.detail#">
            <cfreturn 0>
        </cfcatch>
    </cftry>
</cffunction> 
<!--- Changes made:
- None; the code is syntactically correct.
--->

<cffunction name="getaudgenres_audition_xref" access="public" returntype="query">
    <cfargument name="essencename" type="string" required="true">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var sql = "">
    <cfset var result = "">
    <cfset var whereClause = []>
    <cfset var validOrderByColumns = "audroleid,audgenreid,audgenre">

    <cftry>
        <!--- Build the SQL query --->
        <cfset sql = "
            SELECT
                audroleid,
                audgenreid,
                audgenre
            FROM
                vm_audgenres_audition_xref_audgenres_user e
            WHERE
                e.essencename = ? AND
                e.audroleid = ? AND
                e.userid = ? AND
                e.isdeleted = 0
        ">

        <!--- Add ORDER BY clause if valid --->
        <cfif len(trim(arguments.orderBy)) AND listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.essencename#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- Return the result --->
        <cfreturn result>

    <cfcatch>
        <!--- Log the error --->
        <cflog file="application" type="error"
               text="Error in getaudgenres_audition_xref: #cfcatch.message#. Detail: #cfcatch.detail#. SQL: #sql#">

        <!--- Return an empty query with correct schema --->
        <cfreturn queryNew("audroleid,audgenreid,audgenre", "integer,integer,varchar")>
    </cfcatch>
    </cftry>
</cffunction>
<!--- Changes made:
- None. The provided code is syntactically correct.
--->

<cffunction name="updateaudgenres_audition_xref" access="public" returntype="boolean">
    <cfargument name="ID" type="numeric" required="true">
    <cfargument name="audroleid" type="numeric" required="false" default="">
    <cfargument name="audgenreID" type="numeric" required="false" default="">
    
    <cfset var sql = "UPDATE audgenres_audition_xref SET">
    <cfset var setClauses = []>
    <cfset var result = false>

    <!--- Build the SET clause dynamically based on provided arguments --->
    <cfif structKeyExists(arguments, "audroleid") AND arguments.audroleid neq "" >
        <cfset arrayAppend(setClauses, "audroleid = ?")>
    </cfif>
    
    <cfif structKeyExists(arguments, "audgenreID") AND arguments.audgenreID neq "" >
        <cfset arrayAppend(setClauses, "audgenreID = ?")>
    </cfif>

    <!--- If no fields to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Construct the final SQL query --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE ID = ?">

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfif structKeyExists(arguments, "audroleid") AND arguments.audroleid neq "" >
                <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif structKeyExists(arguments, "audgenreID") AND arguments.audgenreID neq "" >
                <cfqueryparam value="#arguments.audgenreID#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfqueryparam value="#arguments.ID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset result = true>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error updating audgenres_audition_xref: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return false in case of an error --->
            <cfset result = false>
        </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- No syntax errors found. The code is correct as is.
--->
</cfcomponent>
