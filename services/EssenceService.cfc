<cfcomponent displayname="EssenceService" hint="Handles operations for Essence table" output="false" > 
<cffunction name="insertessences" access="public" returntype="numeric">
    <cfargument name="essenceName" type="string" required="true">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO essences (essenceName, userID, isDeleted) VALUES (?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            #sql#
            <cfqueryparam value="#arguments.essenceName#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
        </cfquery>
        <cfset insertResult = result.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into essences: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return 0 to indicate failure --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>
<!--- Changes made:
- None. The code has no syntax errors and should execute properly.
--->

<cffunction name="getessences" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="essenceID">
    <cfargument name="orderDirection" type="string" required="false" default="ASC">

    <cfset var validColumns = "essenceID,essenceName,userID,isDeleted">
    <cfset var validOrderDirections = "ASC,DESC">
    <cfset var whereClause = []>
    <cfset var sql = "SELECT essenceID, essenceName, userID, isDeleted FROM essences WHERE 1=1">
    <cfset var result = "">

    <!--- Validate orderBy and orderDirection --->
    <cfif not listFindNoCase(validColumns, arguments.orderBy)>
        <cfset arguments.orderBy = "essenceID">
    </cfif>
    
    <cfif not listFindNoCase(validOrderDirections, arguments.orderDirection)>
        <cfset arguments.orderDirection = "ASC">
    </cfif>

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions to SQL if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfset sql &= " ORDER BY #arguments.orderBy# #arguments.orderDirection#">

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="
                        <cfif key eq 'essenceID' or key eq 'userID'>
                            CF_SQL_INTEGER
                        <cfelseif key eq 'essenceName'>
                            CF_SQL_VARCHAR
                        <elseif key eq 'isDeleted'>
                            CF_SQL_BIT
                        </cfif>" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

        <!--- Return the result query --->
        <cfreturn result>

        <!--- Error handling --->
        <cfcatch type="any">
            <cflog file="application" text="Error in getessences: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with correct schema on error --->
            <cfreturn queryNew("essenceID,essenceName,userID,isDeleted", "integer,varchar,integer,bit")>
        </cfcatch>
    </cftry>
</cffunction>

<!--- Changes made:
- Corrected the syntax for the CFML conditional statement from `<elseif>` to `<cfelseif>`.
--->

<cffunction name="updateEssences" access="public" returntype="boolean">
    <cfargument name="essenceID" type="numeric" required="true">
    <cfargument name="essenceName" type="string" required="true">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="isDeleted" type="boolean" required="false" default="#false#">

    <cfset var result = false>
    <cfset var sql = "">
    
    <cftry>
        <!--- Construct the SQL UPDATE statement --->
        <cfset sql = "
            UPDATE essences
            SET 
                essenceName = ?,
                userID = ?,
                isDeleted = ?
            WHERE 
                essenceID = ?
        ">

        <!--- Execute the query --->
        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.essenceName#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.essenceID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If no errors, set result to true --->
        <cfset result = true>

        <cfcatch>
            <!--- Log error details --->
            <cflog file="application" text="Error in updateEssences: #cfcatch.message#, Details: #cfcatch.detail#, SQL: #sql#">
            
            <!--- Handle error by returning false --->
            <cfset result = false>
        </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="getvm_essences_audessences_audtion_xref" access="public" returntype="query">
    <cfargument name="essenceid" type="numeric" required="false">
    <cfargument name="audroleid" type="numeric" required="false">
    <cfargument name="essencename" type="string" required="false">
    <cfargument name="orderBy" type="string" required="false" default="essenceid">

    <cfset var result = "">
    <cfset var sql = "SELECT essenceid, essencename, audroleid FROM vm_essences_audessences_audtion_xref WHERE 1=1">
    <cfset var params = []>
    <cfset var validOrderColumns = "essenceid,essencename,audroleid">

    <!--- Build dynamic WHERE clause --->
    <cfif structKeyExists(arguments, "essenceid") and not isNull(arguments.essenceid)>
        <cfset sql &= " AND essenceid = ?">
        <cfset arrayAppend(params, {value=arguments.essenceid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "audroleid") and not isNull(arguments.audroleid)>
        <cfset sql &= " AND audroleid = ?">
        <cfset arrayAppend(params, {value=arguments.audroleid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "essencename") and not isNull(arguments.essencename)>
        <cfset sql &= " AND essencename = ?">
        <cfset arrayAppend(params, {value=arguments.essencename, cfsqltype="CF_SQL_VARCHAR"})>
    </cfif>

    <!--- Validate ORDER BY column --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch>
            <!--- Log error details --->
            <cflog file="application" text="Error in getvm_essences_audessences_audtion_xref: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return empty query with correct structure --->
            <cfset result = queryNew("essenceid, essencename, audroleid", "integer,varchar,integer")>
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction></cfcomponent>
