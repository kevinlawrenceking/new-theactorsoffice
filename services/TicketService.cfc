<cfcomponent displayname="TicketService" hint="Handles operations for Ticket table" output="false" > 
<cffunction name="inserttickets" access="public" returntype="numeric">
    <cfargument name="ticketData" type="struct" required="true">
    <cfset var insertResult = 0>
    <cftry>
        <cfquery name="insertQuery" datasource="#application.dsn#" result="queryResult">
            INSERT INTO tickets_tbl (
                pgID, ticketName, ticketDetails, ticketResponse, userid,
                ticketCreatedDate, ticketCompletedDate, ticketStatus, ticketActive,
                ticketType, recordname, IsDeleted, initial_email, complete_email,
                ticketstring, verid, patchNote, environ, ticketPriority,
                estHours, testingScript, customTestPageName, customTestPageLink,
                errorid
            ) VALUES (
                <cfqueryparam value="#arguments.ticketData.pgID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.ticketData.pgID)#">,
                <cfqueryparam value="#arguments.ticketData.ticketName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.ticketData.ticketName)#">,
                <cfqueryparam value="#arguments.ticketData.ticketDetails#" cfsqltype="CF_SQL_LONGVARCHAR" null="#isNull(arguments.ticketData.ticketDetails)#">,
                <cfqueryparam value="#arguments.ticketData.ticketResponse#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.ticketData.ticketResponse)#">,
                <cfqueryparam value="#arguments.ticketData.userid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.ticketData.userid)#">,
                <cfqueryparam value="#arguments.ticketData.ticketCreatedDate#" cfsqltype="CF_SQL_TIMESTAMP" null="#isNull(arguments.ticketData.ticketCreatedDate)#">,
                <cfqueryparam value="#arguments.ticketData.ticketCompletedDate#" cfsqltype="CF_SQL_TIMESTAMP" null="#isNull(arguments.ticketData.ticketCompletedDate)#">,
                <cfqueryparam value="#arguments.ticketData.ticketStatus#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.ticketData.ticketStatus)#">,
                <cfqueryparam value="#arguments.ticketData.ticketActive#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.ticketData.ticketActive)#">,
                <cfqueryparam value="#arguments.ticketData.ticketType#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.ticketData.ticketType)#">,
                <cfqueryparam value="#arguments.ticketData.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.ticketData.recordname)#">,
                <cfqueryparam value="#arguments.ticketData.IsDeleted#" cfsqltype="CF_SQL_BIT" null="#isNull(arguments.ticketData.IsDeleted)#">,
                <cfqueryparam value="#arguments.ticketData.initial_email#" cfsqltype="CF_SQL_BIT" null="#isNull(arguments.ticketData.initial_email)#">,
                <cfqueryparam value="#arguments.ticketData.complete_email#" cfsqltype="CF_SQL_BIT" null="#isNull(arguments.ticketData.complete_email)#">,
                <cfqueryparam value="#arguments.ticketData.ticketstring#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.ticketData.ticketstring)#">,
                <cfqueryparam value="#arguments.ticketData.verid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.ticketData.verid)#">,
                <cfqueryparam value="#arguments.ticketData.patchNote#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.ticketData.patchNote)#">,
                <cfqueryparam value="#arguments.ticketData.environ#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.ticketData.environ)#">,
                <cfqueryparam value="#arguments.ticketData.ticketPriority#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.ticketData.ticketPriority)#">,
                <cfqueryparam value="#arguments.ticketData.estHours#" cfsqltype="CF_SQL_DECIMAL" null="#isNull(arguments.ticketData.estHours)#">,
                <cfqueryparam value="#arguments.ticketData.testingScript#" cfsqltype="CF_SQL_LONGVARCHAR" null="#isNull(arguments.ticketData.testingScript)#">,
                <cfqueryparam value="#arguments.ticketData.customTestPageName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.ticketData.customTestPageName)#">,
                <cfqueryparam value="#arguments.ticketData.customTestPageLink#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.ticketData.customTestPageLink)#">,
                <cfqueryparam value="#arguments.ticketData.errorid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.errorid)#">
            )
        </cfquery>
        <!--- Return the generated key (ticketID) --->
        <cfset insertResult = queryResult.generatedKey>
    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application"
               text="Error in inserttickets: #cfcatch.message# - #cfcatch.detail#"
               type="error">
        <!--- Return 0 to indicate failure --->
        <cfset insertResult = 0>
    </cfcatch>
    </cftry>
    <cfreturn insertResult>
</cffunction>
<cffunction name="gettickets" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="ticketID">
    <cfargument name="orderDirection" type="string" required="false" default="ASC">

    <cfset var sql = "SELECT ticketID, pgID, userid, verid, errorid, ticketName, ticketResponse, ticketStatus, ticketType, recordname, ticketstring, patchNote, ticketPriority, customTestPageName, customTestPageLink, IsDeleted, initial_email, complete_email, ticketCompletedDate, ticketCreatedDate, ticketActive, environ, ticketDetails, testingScript, estHours FROM tickets_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "ticketID,pgID,userid,verid,errorid,ticketName,ticketResponse,ticketStatus,ticketType,recordname,ticketstring,patchNote,ticketPriority,customTestPageName,customTestPageLink,IsDeleted,initial_email,complete_email,ticketCompletedDate,ticketCreatedDate,ticketActive,environ,ticketDetails,testingScript,estHours">
    <cfset var validOrderColumns = "ticketID,ticketCreatedDate,ticketCompletedDate">

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams,
                structNew(
                    "value": arguments.filters[key],
                    "cfsqltype": evaluate("CF_SQL_" & uCase(listGetAt(validColumns & ",", listFindNoCase(validColumns & ",", key))))
                )
            )>
        </cfif>
    </cfloop>

    <!--- Add WHERE conditions to SQL --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause," AND ")>
    </cfif>

    <!--- Validate and add ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy# #arguments.orderDirection#">
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error in gettickets: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with correct schema --->
            <cfset result = queryNew("ticketID,int;pgID,int;userid,int;verid,int;errorid,int;ticketName,varchar;ticketResponse,varchar;ticketStatus,varchar;ticketType,varchar;recordname,varchar;ticketstring,varchar;patchNote,varchar;ticketPriority,varchar;customTestPageName,varchar;customTestPageLink,varchar;IsDeleted,int;initial_email,int;complete_email,int;ticketCompletedDate,date;ticketCreatedDate,date;ticketActive,char;environ,char;ticketDetails,longvarchar;testingScript,longvarchar;estHours,numeric")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction>
<cffunction name="updatetickets" access="public" returntype="boolean">
    <cfargument name="ticketID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    <cfset var result = false>
    <cfset var sql = "UPDATE tickets_tbl SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "pgID,ticketName,ticketDetails,ticketResponse,userid,ticketCompletedDate,ticketStatus,ticketActive,ticketType,recordname,IsDeleted,initial_email,complete_email,ticketstring,verid,patchNote,environ,ticketPriority,estHours,testingScript,customTestPageName,customTestPageLink,errorid">
    
    <cftry>
        <!--- Loop through the data struct to build the SET clause dynamically --->
        <cfloop collection="#arguments.data#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(setClauses, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- If there are no valid columns to update, return false --->
        <cfif arrayLen(setClauses) eq 0>
            <cfreturn false>
        </cfif>

        <!--- Construct the SQL query --->
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE ticketID = ?">

        <!--- Execute the query --->
        <cfquery datasource="#DSN#">
            #sql#
            <!--- Bind parameters using cfqueryparam for security --->
            <cfloop collection="#arguments.data#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="#evaluate("CF_SQL_" & ucase(key))#" null="#isNull(arguments.data[key])#">
                </cfif>
            </cfloop>
            <!--- Bind the ticketID parameter --->
            <cfqueryparam value="#arguments.ticketID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If no errors occurred, set result to true --->
        <cfset result = true>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error updating tickets: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return false on error --->
            <cfset result = false>
        </cfcatch>
    </cftry>

    <!--- Return the result of the update operation --->
    <cfreturn result>
</cffunction>
<cffunction name="getvm_ticket_statuses" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="ticketstatus">

    <cfset var sql = "SELECT `ticketstatus` FROM vm_ticket_statuses WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryResult = "">
    <cfset var validOrderByColumns = "ticketstatus">

    <!--- Build the WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif key eq "ticketstatus">
            <cfset arrayAppend(whereClause, "`ticketstatus` = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY `#arguments.orderBy#`">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif key eq "ticketstatus">
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#not len(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getvm_ticket_statuses: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">

            <!--- Return an empty query with the correct schema --->
            <cfset queryResult = queryNew("ticketstatus", "varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction>
<cffunction name="getvm_taoversions_hoursleft" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="id">
    <cfset var result = "">
    <cfset var sql = "SELECT major, minor, patch, id, alphabeta, name, hoursleft FROM vm_taoversions_hoursleft WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "major,minor,patch,id,alphabeta,name,hoursleft">
    <cfset var validOrderColumns = "major,minor,patch,id,alphabeta,name,hoursleft">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions to SQL --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql = sql & " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql = sql & " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate("CF_SQL_" & uCase(getColumnType(key)))#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" type="error" text="Error in getvm_taoversions_hoursleft: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with the correct structure on error --->
            <cfset result = queryNew("major,minor,patch,id,alphabeta,name,hoursleft", "integer,integer,integer,integer,varchar,varchar,decimal")>
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>
<cffunction name="getvm_tickets_users_pages" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="false">
    <cfargument name="sessionUserId" type="numeric" required="false">
    <cfargument name="sitetypeid" type="numeric" required="false">
    
    <cfset var local = {} />
    <cfset local.sql = "
        SELECT 
            recID, pk, pgid, verid, col1, head1, head2, head3, head4, head5, 
            head6, head7, head8, ticketResponse, pgname, ticketStatus, 
            ticketType, ticketPriority, ticketName, patchnote, pgdir,
            complete_email, initial_email, ticketCompletedDate,
            ticketCreatedDate, ticketdetails, esthours
        FROM 
            vm_tickets_users_pages
        WHERE 
            1=1
    " />
    <cfset local.whereClause = [] />

    <!--- Build dynamic WHERE clause --->
    <cfif structKeyExists(arguments, "userid")>
        <cfset arrayAppend(local.whereClause, "s.userid = ?")>
    </cfif>
    
    <cfif structKeyExists(arguments, "sessionUserId")>
        <cfset arrayAppend(local.whereClause, "s.userid = ?")>
    </cfif>
    
    <cfif structKeyExists(arguments, "sitetypeid")>
        <cfset arrayAppend(local.whereClause, "s.sitetypeid = ?")>
    </cfif>

    <!--- Additional static conditions --->
    <cfset arrayAppend(local.whereClause, "s.isdeleted = 1")>
    <cfset arrayAppend(local.whereClause, "s.isCustom = 0")>

    <!--- Append dynamic WHERE clauses to SQL --->
    <cfif arrayLen(local.whereClause) gt 0>
        <cfset local.sql &= " AND " & arrayToList(local.whereClause, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfset local.sql &= " ORDER BY recID">

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="local.result" datasource="yourDataSource">
            #local.sql#
            <cfif structKeyExists(arguments, "userid")>
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER" null="#not len(arguments.userid)#">
            </cfif>
            <cfif structKeyExists(arguments, "sessionUserId")>
                <cfqueryparam value="#arguments.sessionUserId#" cfsqltype="CF_SQL_INTEGER" null="#not len(arguments.sessionUserId)#">
            </cfif>
            <cfif structKeyExists(arguments, "sitetypeid")>
                <cfqueryparam value="#arguments.sitetypeid#" cfsqltype="CF_SQL_INTEGER" null="#not len(arguments.sitetypeid)#">
            </cfif>
        </cfquery>

        <cfreturn local.result>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getvm_tickets_users_pages: #cfcatch.message# - #cfcatch.detail# - SQL: #local.sql#">

            <!--- Return an empty query with the correct schema --->
            <cfreturn queryNew("recID,pk,pgid,verid,col1,head1,head2,head3,
                                head4,head5,head6,head7,head8,ticketResponse,
                                pgname,ticketStatus,ticketType,ticketPriority,
                                ticketName,patchnote,pgdir,
                                complete_email:int,
                                initial_email:int,
                                ticketCompletedDate:date,
                                ticketCreatedDate:timestamp,
                                ticketdetails:longvarchar,
                                esthours:decimal",
                               "integer,Integer,Integer,Integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,Integer,Integer,date,timestamp,longvarchar,double") />
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
