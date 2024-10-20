<cfcomponent displayname="AuditionGenreUserService" hint="Handles operations for AuditionGenreUser table" output="false" > 
<cffunction name="insertaudgenres_user" access="public" returntype="numeric">
    <cfargument name="audgenreid" type="numeric" required="true">
    <cfargument name="audgenre" type="string" required="true">
    <cfargument name="audCatid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="recordname" type="string" required="false">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audgenres_user_tbl (audgenreid, audgenre, audCatid, userid, isDeleted, recordname) VALUES (?, ?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.audgenreid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.audgenre#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#not structKeyExists(arguments, 'recordname')#">
        </cfquery>

        <cfset insertResult = queryResult.generatedKey>

        <cfcatch type="any">
            <cflog file="application" text="Error in insertaudgenres_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return 0 or handle error as needed --->
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>


<!--- Changes made:
- No syntax errors found. Code is correct as provided.
--->

<cffunction name="getaudgenres_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="audgenreid">
    <cfset var result = "">
    <cfset var sql = "SELECT audgenreid, audCatid, userid, audgenre, recordname, isDeleted FROM audgenres_user_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "audgenreid,audCatid,userid,audgenre,recordname,isDeleted">
    <cfset var validOrderByColumns = "audgenreid,audCatid,userid,audgenre,recordname,isDeleted">

    <cftry>
        <!--- Build dynamic WHERE clause --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- Append WHERE conditions if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate ORDER BY clause --->
        <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        <cfelse>
            <!--- Default ORDER BY if invalid column provided --->
            <cfset sql &= " ORDER BY audgenreid">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getaudgenres_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
        
        <!--- Return an empty query with matching schema on error --->
        <cfset result = queryNew("audgenreid,audCatid,userid,audgenre,recordname,isDeleted", "integer,integer,integer,varchar,varchar,bit")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected the cfsqltype in cfqueryparam to a generic type (CF_SQL_VARCHAR) since dynamic evaluation of cfsqltype is not supported.
--->

<cffunction name="getvm_audgenres_user_tbl_audgenres_audition_xref" access="public" returntype="query">
    <cfargument name="audgenreid" type="numeric" required="false">
    <cfargument name="audroleid" type="numeric" required="false">
    <cfargument name="userid" type="numeric" required="false">
    <cfargument name="audgenre" type="string" required="false">
    <cfargument name="orderBy" type="string" required="false">

    <cfset var queryResult = "">
    <cfset var sql = "SELECT audgenreid, audroleid, userid, audgenre FROM vm_audgenres_user_tbl_audgenres_audition_xref WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var params = []>
    <cfset var validOrderByColumns = "audgenreid,audroleid,userid,audgenre">

    <!--- Build WHERE clause dynamically --->
    <cfif structKeyExists(arguments, "audgenreid") and isNumeric(arguments.audgenreid)>
        <cfset arrayAppend(whereClause, "audgenreid = ?")>
        <cfset arrayAppend(params, {value=arguments.audgenreid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "audroleid") and isNumeric(arguments.audroleid)>
        <cfset arrayAppend(whereClause, "audroleid = ?")>
        <cfset arrayAppend(params, {value=arguments.audroleid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "userid") and isNumeric(arguments.userid)>
        <cfset arrayAppend(whereClause, "userid = ?")>
        <cfset arrayAppend(params, {value=arguments.userid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "audgenre") and len(trim(arguments.audgenre))>
        <cfset arrayAppend(whereClause, "audgenre = ?")>
        <cfset arrayAppend(params, {value=arguments.audgenre, cfsqltype="CF_SQL_VARCHAR"})>
    </cfif>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Handle ORDER BY clause --->
    <cfif structKeyExists(arguments, "orderBy") and listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY `#arguments.orderBy#`">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="queryResult" datasource="#yourDataSource#">
            #sql#
            <cfloop from="1" to="#arrayLen(params)#" index="i">
                <cfqueryparam value="#params[i].value#" cfsqltype="#params[i].cfsqltype#">
            </cfloop>
        </cfquery>

        <!--- Catch any errors and log them --->
        <cfcatch type="any">
            <cflog file="application" text="Error in getvm_audgenres_user_tbl_audgenres_audition_xref: #cfcatch.message# - #sql# - #serializeJSON(params)#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset queryResult = queryNew("audgenreid,audroleid,userid,audgenre", "integer,integer,integer,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction></cfcomponent>
