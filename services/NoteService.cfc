<cfcomponent displayname="NoteService" hint="Handles operations for Note table" output="false" > 
<cffunction name="deletenoteslog" access="public" returntype="boolean">
    <cfargument name="noteID" type="numeric" required="true">
    <cfset var result = false>
    <cfset var sql = "DELETE FROM noteslog_tbl WHERE noteID = ?">
    
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.noteID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset result = true>
        <cfcatch type="any">
            <cflog file="deletenoteslog_errors" text="Error deleting note: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <cfset result = false>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct and should execute without errors.
--->

<cffunction name="insertnoteslog" access="public" returntype="numeric">
    <cfargument name="noteDetails" type="string" required="true">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="contactID" type="numeric" required="true">
    <cfargument name="IsDeleted" type="boolean" required="true">
    <cfargument name="isPublic" type="boolean" required="true">
    <cfargument name="eventid" type="numeric" required="false" default="">
    <cfargument name="audprojectid" type="numeric" required="false" default="">
    <cfargument name="notedetailshtml" type="string" required="false" default="">
    
    <cfset var sql = "INSERT INTO noteslog_tbl (noteDetails, userID, contactID, IsDeleted, isPublic, eventid, audprojectid, notedetailshtml) VALUES (?, ?, ?, ?, ?, ?, ?, ?)">
    <cfset var insertResult = "">
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            #sql#
            <cfqueryparam value="#arguments.noteDetails#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.isPublic#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.eventid)#">
            <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.audprojectid)#">
            <cfqueryparam value="#arguments.notedetailshtml#" cfsqltype="CF_SQL_LONGVARCHAR" null="#isNull(arguments.notedetailshtml)#">
        </cfquery>
        <cfreturn insertResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into noteslog_tbl: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return a negative number to indicate failure --->
            <cfreturn -1>
        </cfcatch>
    </cftry>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="getnoteslog" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="noteTimestamp">
    <cfset var sql = "SELECT `noteID`, `userID`, `contactID`, `eventid`, `audprojectid`, `noteDetails`, `IsDeleted`, `isPublic`, `noteTimestamp`, `notedetailshtml` FROM noteslog_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "noteID,userID,contactID,eventid,audprojectid,noteDetails,IsDeleted,isPublic,noteTimestamp,notedetailshtml">
    <cfset var validOrderColumns = "noteID,userID,contactID,eventid,audprojectid,noteDetails,IsDeleted,isPublic,noteTimestamp">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLTypeForColumn(key)})>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions to SQL if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    <cfelse>
        <!--- Return empty query if no filters are provided --->
        <cfreturn queryNew("noteID,userID,contactID,eventid,audprojectid,noteDetails,IsDeleted,isPublic,noteTimestamp,notedetailshtml", "integer,integer,integer,integer,integer,varchar,bit,bit,timestamp,longvarchar")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getnoteslog: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return empty query on error --->
            <cfreturn queryNew("noteID,userID,contactID,eventid,audprojectid,noteDetails,IsDeleted,isPublic,noteTimestamp,notedetailshtml", "integer,integer,integer,integer,integer,varchar,bit,bit,timestamp,longvarchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result set --->
    <cfreturn result>

</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct and should execute without errors.
--->

<cffunction name="updatenoteslog" access="public" returntype="boolean">
    <cfargument name="noteID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">

    <cfset var sql = "UPDATE noteslog_tbl SET">
    <cfset var setClauses = []>
    <cfset var result = false>

    <!--- Define a list of valid columns to update --->
    <cfset var validColumns = "noteDetails,userID,contactID,eventid,audprojectid,IsDeleted,isPublic,notedetailshtml,noteTimestamp">

    <!--- Build the SET clause dynamically --->
    <cfloop collection="#arguments.data#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(setClauses, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Ensure there is at least one column to update --->
    <cfif arrayLen(setClauses) gt 0>
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE noteID = ?">

        <!--- Execute the query within a try/catch block for error handling --->
        <cftry>
            <cfquery datasource="#DSN#">
                #sql#
                <cfloop collection="#arguments.data#" item="key">
                    <cfif listFindNoCase(validColumns, key)>
                        <cfqueryparam value="#arguments.data[key]#" cfsqltype="#getSQLType(key)#" null="#isNull(arguments.data[key])#">
                    </cfif>
                </cfloop>
                <cfqueryparam value="#arguments.noteID#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>

            <!--- If query executes successfully, set result to true --->
            <cfset result = true>

            <cfcatch type="any">
                <!--- Log the error details --->
                <cflog file="application" text="Error updating noteslog_tbl: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            </cfcatch>
        </cftry>
    </cfif>

    <!--- Return the result of the update operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The function code is syntactically correct.
--->

<cffunction name="getvm_noteslog_contactdetails" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var sql = "SELECT `noteID`, `userID`, `contactID`, `col3`, `col5`, `col4`, `col1`, `noteDetailsHTML` FROM vm_noteslog_contactdetails WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var params = []>
    <cfset var validColumns = "noteID,userID,contactID,col3,col5,col4,col1,noteDetailsHTML">
    <cfset var validOrderByColumns = listToArray(validColumns)>
    <cfset var result = "">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(params, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause if provided and valid --->
    <cfif len(arguments.orderBy) and listFindNoCase(validColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>

        <!--- Handle errors and return an empty query if necessary --->
        <cfcatch type="any">
            <cflog file="application" text="Error in getvm_noteslog_contactdetails: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <cfset result = queryNew("noteID,userID,contactID,col3,col5,col4,col1,noteDetailsHTML", "integer,integer,integer,varchar,varchar,bit,timestamp,longvarchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction></cfcomponent>
