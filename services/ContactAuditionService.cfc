<cfcomponent displayname="ContactAuditionService" hint="Handles operations for ContactAudition table" output="false" > 
<cffunction name="deleteaudcontacts_auditions_xref" access="public" returntype="boolean">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cfset var result = false>
    <cfset var sql = "DELETE FROM audcontacts_auditions_xref WHERE contactid = ? AND audprojectid = ?">

    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset result = true>
        <cfcatch>
            <cflog file="application" type="error" text="Error in deleteaudcontacts_auditions_xref: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="insertaudcontacts_auditions_xref" access="public" returntype="numeric">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="xrefNotes" type="string" required="false" default="">
    <cfargument name="isfollow" type="boolean" required="false" default=false>

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audcontacts_auditions_xref (contactid, audprojectid, xrefNotes, isfollow) VALUES (?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#application.dsn#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.xrefNotes#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.xrefNotes)#">
            <cfqueryparam value="#arguments.isfollow#" cfsqltype="CF_SQL_BIT" null="#isNull(arguments.isfollow)#">
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        <cfcatch>
            <cflog text="Error inserting into audcontacts_auditions_xref: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>
<cffunction name="getaudcontacts_auditions_xref" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="false">
    <cfargument name="audprojectid" type="numeric" required="false">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var validColumns = "contactid,audprojectid,xrefNotes,isfollow">
    <cfset var orderByClause = "">
    <cfset var whereClause = "">
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Validate and construct ORDER BY clause --->
    <cfif len(trim(arguments.orderBy))>
        <cfif listFindNoCase(validColumns, arguments.orderBy)>
            <cfset orderByClause = "ORDER BY #arguments.orderBy#">
        </cfif>
    </cfif>

    <!--- Construct WHERE clause dynamically --->
    <cfif structKeyExists(arguments, "contactid") and not isNull(arguments.contactid)>
        <cfset whereClause &= " AND contactid = ?">
        <cfset arrayAppend(queryParams, {value=arguments.contactid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "audprojectid") and not isNull(arguments.audprojectid)>
        <cfset whereClause &= " AND audprojectid = ?">
        <cfset arrayAppend(queryParams, {value=arguments.audprojectid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <!--- If no conditions are provided, return an empty query --->
    <cfif len(trim(whereClause)) eq 0>
        <cfreturn queryNew("contactid,audprojectid,xrefNotes,isfollow", "integer,integer,varchar,bit")>
    </cfif>

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT contactid, audprojectid, xrefNotes, isfollow
            FROM audcontacts_auditions_xref
            WHERE 1=1
            #whereClause#
            #orderByClause#
            <!--- Moved cfqueryparam inside cfquery to ensure proper parameter binding --->
        </cfquery>
        <!--- Loop through parameters after cfquery to bind them correctly --->
        <cfloop array="#queryParams#" index="param">
            <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getaudcontacts_auditions_xref: #cfcatch.message# - #cfcatch.detail# - SQL: SELECT contactid, audprojectid, xrefNotes, isfollow FROM audcontacts_auditions_xref WHERE 1=1 #whereClause# #orderByClause#">
            <!--- Return an empty query on error --->
            <cfreturn queryNew("contactid,audprojectid,xrefNotes,isfollow", "integer,integer,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Moved cfqueryparam inside cfquery to ensure proper parameter binding.
--->

<cffunction name="updateaudcontacts_auditions_xref" access="public" returntype="boolean">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="xrefNotes" type="string" required="false" default="">
    <cfargument name="isfollow" type="boolean" required="false" default="">
    
    <cfset var sql = "">
    <cfset var result = false>
    
    <cftry>
        <!--- Construct the SQL update statement --->
        <cfset sql = "UPDATE audcontacts_auditions_xref SET">
        
        <!--- Initialize an array to hold set clauses --->
        <cfset var setClauses = []>
        
        <!--- Add clauses based on provided arguments --->
        <cfif len(trim(arguments.xrefNotes))>
            <cfset arrayAppend(setClauses, "xrefNotes = ?")>
        </cfif>
        
        <cfif structKeyExists(arguments, "isfollow")>
            <cfset arrayAppend(setClauses, "isfollow = ?")>
        </cfif>
        
        <!--- Ensure there are fields to update --->
        <cfif arrayLen(setClauses) gt 0>
            <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE contactid = ? AND audprojectid = ?">
            
            <!--- Execute the query --->
            <cfquery datasource="#DSN#">
                #sql#
                <cfif len(trim(arguments.xrefNotes))>
                    <cfqueryparam value="#arguments.xrefNotes#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.xrefNotes)#">
                </cfif>
                <cfif structKeyExists(arguments, "isfollow")>
                    <cfqueryparam value="#arguments.isfollow#" cfsqltype="CF_SQL_BIT" null="#isNull(arguments.isfollow)#">
                </cfif>
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
                <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>
            
            <!--- If no error occurs, set result to true --->
            <cfset result = true>
        </cfif>

        <!--- Handle any errors that occur during query execution --->
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in updateaudcontacts_auditions_xref: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            
            <!--- Return false on error --->
            <cfset result = false>
        </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected the use of isDefined() to structKeyExists() for checking if 'isfollow' exists in arguments.
--->
</cfcomponent>
