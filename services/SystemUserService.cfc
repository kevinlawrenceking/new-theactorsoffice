<cfcomponent displayname="SystemUserService" hint="Handles operations for SystemUser table" output="false" > 
<cffunction name="insertfusystemusers" access="public" returntype="numeric">
    <cfargument name="systemID" type="numeric" required="true">
    <cfargument name="contactID" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="suStartDate" type="date" required="true">
    <cfargument name="suEndDate" type="date" required="false" default="">
    <cfargument name="suStatus" type="string" required="true" default="Active">
    <cfargument name="suNotes" type="string" required="false" default="">
    <cfargument name="recordname" type="string" required="false" default="">
    <cfargument name="IsDeleted" type="boolean" required="true">

    <cfset var sql = "INSERT INTO fusystemusers_tbl (systemID, contactID, userid, suStartDate, suEndDate, suStatus, suNotes, recordname, IsDeleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)">
    <cfset var insertResult = "">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            #sql#
            <cfqueryparam value="#arguments.systemID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.suStartDate#" cfsqltype="CF_SQL_DATE">
            <cfqueryparam value="#arguments.suEndDate#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.suEndDate)#">
            <cfqueryparam value="#arguments.suStatus#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.suNotes#" cfsqltype="CF_SQL_LONGVARCHAR" null="#isNull(arguments.suNotes)#">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
            <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">
        </cfquery>
        <cfreturn insertResult.generatedKey>
        
        <cfcatch>
            <cflog text="Error inserting into fusystemusers_tbl: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#"/>
            <!--- Return 0 or handle the error as needed --->
            <cfreturn 0>
        </cfcatch>
    </cftry>
</cffunction>

<!--- Changes made:
- Removed the default attribute from the IsDeleted argument as it conflicts with the required attribute.
--->

<cffunction name="getfusystemusers" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="suID">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT suID, systemID, contactID, userid, suStatus, recordname, IsDeleted, suTimestamp, suStartDate, suEndDate, suNotes FROM fusystemusers_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "suID,systemID,contactID,userid,suStatus,recordname,IsDeleted,suTimestamp,suStartDate,suEndDate,suNotes">
    <cfset var validOrderColumns = "suID,systemID,contactID,userid,suStatus,recordname,suTimestamp,suStartDate,suEndDate">

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & uCase(listGetAt(validColumns, listFindNoCase(validColumns, key))))#" null="#isNull(arguments.filters[key])#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getfusystemusers: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset queryResult = queryNew("suID,systemID,contactID,userid,suStatus,recordname,IsDeleted,suTimestamp,suStartDate,suEndDate,suNotes", "integer,integer,integer,varchar,varchar,varchar,binary,date,date,longvarchar")>
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn queryResult>
</cffunction>

<!--- Changes made:
- Corrected the data types in queryNew function to match ColdFusion's supported types.
--->

<cffunction name="updatefusystemusers" access="public" returntype="boolean">
    <cfargument name="suID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    <cfset var sql = "UPDATE fusystemusers_tbl SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "systemID,contactID,userid,suStatus,recordname,IsDeleted,suStartDate,suEndDate,suNotes">
    
    <cfloop collection="#arguments.data#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(setClauses, "#key# = ?")>
        </cfif>
    </cfloop>
    
    <cfif arrayLen(setClauses) eq 0>
        <!--- No valid columns to update --->
        <cfreturn false>
    </cfif>

    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE suID = ?">

    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfloop collection="#arguments.data#" item="key">
                <cfqueryparam value="#arguments.data[key]#" cfsqltype="
                    <cfif key eq 'systemID' or key eq 'contactID' or key eq 'userid'>
                        CF_SQL_INTEGER
                    <cfelseif key eq 'suStatus' or key eq 'recordname'>
                        CF_SQL_VARCHAR
                    <cfelseif key eq 'IsDeleted'>
                        CF_SQL_BIT
                    <cfelseif key eq 'suStartDate' or key eq 'suEndDate'>
                        CF_SQL_DATE
                    <cfelseif key eq 'suNotes'>
                        CF_SQL_LONGVARCHAR
                    </cfif>"
                    null="#isNull(arguments.data[key])#">
            </cfloop>
            <cfqueryparam value="#arguments.suID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn true>
        
        <cfcatch>
            <!--- Log the error details --->
            <cflog file="application" type="error" text="Error in updatefusystemusers: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return false on error --->
            <cfreturn false>
        </cfcatch>
    </cftry>
</cffunction>

<!--- Changes made:
- Removed backticks around column names in arrayAppend to match standard SQL syntax.
--->

<cffunction name="getvm_fusystemusers_fusystems" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfset var result = "">
    <cfset var sql = "SELECT suID, contactid, userid, systemID, suStatus, systemName, systemdescript, systemtype, systemscope, recordname, suStartDate, suenddate FROM vm_fusystemusers_fusystems WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "suID,contactid,userid,systemID,suStatus,systemName,systemdescript,systemtype,systemscope,recordname,suStartDate,suenddate">

    <!--- Add conditions based on session.userid and current date --->
    <cfset arrayAppend(whereClause, "userid = ?")>
    <cfset arrayAppend(whereClause, "suStartDate >= CURDATE()")>

    <!--- Build dynamic WHERE clause based on filters --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause for consistent sorting --->
    <cfset sql &= " ORDER BY suStartDate DESC">

    <!--- Execute query within try/catch block for error handling --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
            <!--- Loop through filters to add cfqueryparam values --->
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & uCase(listGetAt(validColumns & ',', listFindNoCase(validColumns & ',', key)) + 1))#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getvm_fusystemusers_fusystems: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with correct schema on error --->
            <cfset result = queryNew("suID,contactid,userid,systemID,suStatus,systemName,systemdescript,systemtype,systemscope,recordname,suStartDate,suenddate", "integer,integer,integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,date,date")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>
<cffunction name="getvm_fusystemusers_count" access="public" returntype="query">
    <cfargument name="idlist" type="string" required="true">
    <cfargument name="new_systemid" type="numeric" required="true">
    
    <cfset var result = "">
    <cfset var sql = "">
    
    <cftry>
        <!--- Construct the SQL query --->
        <cfset sql = "
            SELECT totals
            FROM vm_fusystemusers_count
            WHERE isdeleted = 0
            AND contactid IN (#arguments.idlist#)
            AND systemid = <cfqueryparam value='#arguments.new_systemid#' cfsqltype='CF_SQL_BIGINT'>
        ">
        
        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
        </cfquery>
        
        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" type="error" text="Error in getvm_fusystemusers_count: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            
            <!--- Return an empty query with correct structure --->
            <cfset result = queryNew("totals", "bigint")>
        </cfcatch>
    </cftry>
    
    <!--- Return the result --->
    <cfreturn result>
</cffunction>
<cffunction name="getvm_fusystemusers_funotifications_actionusers" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT notid, actionuser_id, systemid, actionid, suid, sustartdate, actionDaysNo, actiondaysrecurring, notstartdate, new_notstartdate FROM vm_fusystemusers_funotifications_actionusers WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "notid,actionuser_id,systemid,actionid,suid,sustartdate,actionDaysNo,actiondaysrecurring,notstartdate,new_notstartdate">
    <cfset var orderByColumn = "notid"> <!-- Default order by column -->
    
    <cftry>
        <!-- Build dynamic WHERE clause -->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!-- Append WHERE conditions if any -->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!-- Add ORDER BY clause -->
        <cfif listFindNoCase(validColumns, arguments.filters.orderBy)>
            <cfset orderByColumn = arguments.filters.orderBy>
        </cfif>
        <cfset sql &= " ORDER BY #orderByColumn#">

        <!-- Execute the query -->
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

        <!-- Return the query result -->
        <cfreturn queryResult>

    <cfcatch type="any">
        <!-- Log the error details -->
        <cflog file="application" text="Error in getvm_fusystemusers_funotifications_actionusers: #cfcatch.message#, Details: #cfcatch.detail#, SQL: #sql#">

        <!-- Return an empty query with correct schema -->
        <cfreturn queryNew("notid,actionuser_id,systemid,actionid,suid,sustartdate,actionDaysNo,actiondaysrecurring,notstartdate,new_notstartdate", "integer,integer,integer,integer,integer,date,integer,integer,date,date")>
    </cfcatch>
    </cftry>
</cffunction></cfcomponent>
