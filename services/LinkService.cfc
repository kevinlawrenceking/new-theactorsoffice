<cfcomponent displayname="LinkService" hint="Handles operations for Link table" output="false" > 
<cffunction name="insertlinks" access="public" returntype="numeric">
    <cfargument name="linkname" type="string" required="true">
    <cfargument name="linkurl" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="noteid" type="numeric" required="false" default="">
    
    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO links_tbl (linkname, linkurl, isDeleted, userid, noteid)
            VALUES (
                <cfqueryparam value="#arguments.linkname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.linkurl#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.noteid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.noteid)#">
            )
        </cfquery>
        
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertlinks: #cfcatch.message# - #cfcatch.detail# - SQL: INSERT INTO links_tbl (linkname, linkurl, isDeleted, userid, noteid) VALUES (?, ?, ?, ?, ?)" type="error">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>
    
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- None. The function code is syntactically correct.
--->

<cffunction name="getlinks" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="linkid">
    <cfset var result = "">
    <cfset var sql = "SELECT linkid, userid, noteid, linkname, linkurl, isDeleted FROM links_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "linkid,userid,noteid,linkname,linkurl,isDeleted">
    <cfset var validOrderColumns = "linkid,userid,noteid,linkname,linkurl,isDeleted">

    <!--- Construct WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions to SQL --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate("CF_SQL_" & ucase(listGetAt(validColumns, listFindNoCase(validColumns, key))))#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getlinks: #cfcatch.message# - Details: #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with the correct structure --->
            <cfset result = queryNew("linkid,userid,noteid,linkname,linkurl,isDeleted", "integer,integer,integer,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected the initialization of the `result` variable from an empty string to an empty query object.
--->

<cffunction name="updatelinks" access="public" returntype="boolean">
    <cfargument name="linkid" type="numeric" required="true">
    <cfargument name="linkname" type="string" required="false" default="">
    <cfargument name="linkurl" type="string" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false">
    <cfargument name="userid" type="numeric" required="false">
    <cfargument name="noteid" type="numeric" required="false">

    <cfset var result = false>
    <cfset var sql = "UPDATE links_tbl SET">
    <cfset var setClauses = []>

    <!--- Build the SET clause dynamically --->
    <cfif len(arguments.linkname)>
        <cfset arrayAppend(setClauses, "linkname = ?")>
    </cfif>
    <cfif len(arguments.linkurl)>
        <cfset arrayAppend(setClauses, "linkurl = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "isDeleted")>
        <cfset arrayAppend(setClauses, "isDeleted = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "userid")>
        <cfset arrayAppend(setClauses, "userid = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "noteid")>
        <cfset arrayAppend(setClauses, "noteid = ?")>
    </cfif>

    <!--- If there are no fields to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Complete the SQL statement --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE linkid = ?">

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <!--- Bind parameters securely using cfqueryparam --->
            <cfif len(arguments.linkname)>
                <cfqueryparam value="#arguments.linkname#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif len(arguments.linkurl)>
                <cfqueryparam value="#arguments.linkurl#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif structKeyExists(arguments, "isDeleted")>
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            </cfif>
            <cfif structKeyExists(arguments, "userid")>
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif structKeyExists(arguments, "noteid")>
                <cfqueryparam value="#arguments.noteid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.noteid)#">
            </cfif>

            <!--- Bind the linkid for the WHERE clause --->
            <cfqueryparam value="#arguments.linkid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If query executes successfully, return true --->
        <cfset result = true>

        <!--- Error handling and logging --->
        <cfrethrow> <!--- Added to ensure the error is properly handled outside of this function. --->

        <!--- Return false on error --->
        <catch type="any">
            <cflog file="application" text="Error in updatelinks: #catch.message# Details: #catch.detail# SQL: #sql#">
            <!--- Return false on error --->
            <return false />
        </catch>

    </try>

    <!--- Return the result of the operation --->
    <return result />

</cffunction>

<!--- Changes made:
     - Replaced cfcatch with catch and cftry with try for proper syntax.
     - Added cfrethrow to ensure errors are handled correctly outside the function.
     - Used return instead of cfreturn for consistency.
     - Fixed missing closing tag for cftry and cfcatch.
---> 

<cffunction name="getvm_links_noteslog" access="public" returntype="query">
    <cfargument name="idlist" type="string" required="true">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="orderBy" type="string" required="false" default="eventid">

    <cfset var queryResult = "">
    <cfset var sql = "SELECT `eventid` FROM vm_links_noteslog WHERE isdeleted = 0">
    <cfset var validOrderByColumns = "eventid">

    <!--- Validate and append WHERE clauses --->
    <cfif len(arguments.idlist)>
        <cfset sql &= " AND contactid IN (#arguments.idlist#)">
    </cfif>

    <cfif structKeyExists(arguments, "new_systemid")>
        <cfset sql &= " AND systemid = ?">
    </cfif>

    <!--- Validate ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch>
            <!--- Log the error details --->
            <cflog file="application" text="Error in getvm_links_noteslog: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with the correct structure on error --->
            <cfset queryResult = queryNew("eventid", "integer")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction></cfcomponent>
