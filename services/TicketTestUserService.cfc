<cfcomponent displayname="TicketTestUserService" hint="Handles operations for TicketTestUser table" output="false" > 
<cffunction name="inserttickettestusers" access="public" returntype="numeric">
    <cfargument name="ticketid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="teststatus" type="string" required="true">
    <cfargument name="rejectNotes" type="string" required="true">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO tickettestusers (ticketid, userid, teststatus, rejectNotes) VALUES (?, ?, ?, ?)">
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.ticketid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.teststatus#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.rejectNotes#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in inserttickettestusers: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Optionally return a specific error code or handle the error as needed --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>
<cffunction name="gettickettestusers" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="ID">
    
    <cfset var validColumns = "ID,ticketid,userid,teststatus,rejectNotes,timestamp">
    <cfset var validOrderColumns = "ID,ticketid,userid,teststatus,rejectNotes,timestamp">
    <cfset var whereClause = []>
    <cfset var sqlParams = []>
    <cfset var resultQuery = "">

    <!--- Validate orderBy parameter --->
    <cfif not listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset arguments.orderBy = "ID">
    </cfif>

    <!--- Build SQL query dynamically --->
    <cfset var sql = "SELECT ID, ticketid, userid, teststatus, rejectNotes, timestamp FROM tickettestusers WHERE 1=1">

    <!--- Add filters to WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(sqlParams, {value=arguments.filters[key], cfsqltype=de("CF_SQL_" & uCase(key))})>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfset sql &= " ORDER BY #arguments.orderBy#">

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="resultQuery" datasource="abod">
            #sql#
            <cfloop array="#sqlParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error in gettickettestusers: #cfcatch.message#, Detail: #cfcatch.detail#, SQL: #sql#">
            <!--- Return an empty query with correct schema --->
            <cfset resultQuery = queryNew("ID,ticketid,userid,teststatus,rejectNotes,timestamp", "integer,integer,integer,varchar,varchar,timestamp")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn resultQuery>
</cffunction>
<cffunction name="updatetickettestusers" access="public" returntype="boolean">
    <cfargument name="ID" type="numeric" required="true">
    <cfargument name="ticketid" type="numeric" required="false" default="">
    <cfargument name="userid" type="numeric" required="false" default="">
    <cfargument name="teststatus" type="string" required="false" default="">
    <cfargument name="rejectNotes" type="string" required="false" default="">
    
    <cfset var sql = "UPDATE tickettestusers SET">
    <cfset var setClauses = []>
    <cfset var success = false>

    <!--- Build SET clauses dynamically based on provided arguments --->
    <cfif len(arguments.ticketid)>
        <cfset arrayAppend(setClauses, "ticketid = ?")>
    </cfif>
    <cfif len(arguments.userid)>
        <cfset arrayAppend(setClauses, "userid = ?")>
    </cfif>
    <cfif len(arguments.teststatus)>
        <cfset arrayAppend(setClauses, "teststatus = ?")>
    </cfif>
    <cfif len(arguments.rejectNotes)>
        <cfset arrayAppend(setClauses, "rejectNotes = ?")>
    </cfif>

    <!--- If there are no fields to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Construct the SQL statement --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE ID = ?">

    <!--- Try to execute the query and handle any errors --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <!--- Bind parameters securely using cfqueryparam --->
            <cfif len(arguments.ticketid)>
                <cfqueryparam value="#arguments.ticketid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif len(arguments.userid)>
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif len(arguments.teststatus)>
                <cfqueryparam value="#arguments.teststatus#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif len(arguments.rejectNotes)>
                <cfqueryparam value="#arguments.rejectNotes#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <!--- ID is always required --->
            <cfqueryparam value="#arguments.ID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If query executes successfully, set success to true --->
        <cfset success = true>

        <!--- Catch and log any errors that occur during query execution --->
        <cfcatch type="any">
            <cflog file="application" text="Error updating tickettestusers: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        </cfcatch>
    </cftry>

    <!--- Return whether the update was successful --->
    <cfreturn success>
</cffunction>
<cffunction name="getvm_tickettestusers_taousers" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="id">
    <cfset var validColumns = "id,ticketid,userid,recordname,teststatus,rejectnotes">
    <cfset var validOrderColumns = "id,ticketid,userid,recordname,teststatus,rejectnotes">
    <cfset var sql = "SELECT id, ticketid, userid, recordname, teststatus, rejectnotes FROM vm_tickettestusers_taousers WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryResult = "">

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append conditions to SQL query --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="yourDataSource">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & ucase(listGetAt(validColumns, listFindNoCase(validColumns, key))))#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getvm_tickettestusers_taousers: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset queryResult = queryNew("id,ticketid,userid,recordname,teststatus,rejectnotes", "integer,integer,integer,varchar,varchar,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction></cfcomponent>
