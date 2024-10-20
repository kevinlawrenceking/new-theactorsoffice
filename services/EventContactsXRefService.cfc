<cfcomponent displayname="EventContactsXRefService" hint="Handles operations for EventContactsXRef table" output="false" > 
<cffunction name="deleteeventcontactsxref" access="public" returntype="boolean">
    <cfargument name="eventContactID" type="numeric" required="true">
    <cfset var result = false>
    <cftry>
        <cfquery datasource="#DSN#">
            DELETE FROM eventcontactsxref_tbl
            WHERE eventContactID = <cfqueryparam value="#arguments.eventContactID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset result = true>
        <cfcatch type="any">
            <cflog file="application" text="Error in deleteeventcontactsxref: #cfcatch.message# Details: #cfcatch.detail#">
            <cflog file="application" text="SQL Query: DELETE FROM eventcontactsxref_tbl WHERE eventContactID = #arguments.eventContactID#">
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction> 
<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="inserteventcontactsxref" access="public" returntype="numeric">
    <cfargument name="eventID" type="numeric" required="true">
    <cfargument name="contactID" type="numeric" required="true">
    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO eventcontactsxref_tbl (eventID, contactID, IsDeleted) VALUES (?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.eventID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error in inserteventcontactsxref: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL: #sql#">
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction> 
<!--- Changes made:
- No changes were necessary as the function code is syntactically correct.
--->

<cffunction name="geteventcontactsxref" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="eventContactID">

    <cfset var sql = "SELECT eventContactID, eventID, contactID, IsDeleted FROM eventcontactsxref_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "eventContactID,eventID,contactID,IsDeleted">
    <cfset var validOrderByColumns = "eventContactID,eventID,contactID,IsDeleted">
    <cfset var result = "">

    <!--- Validate and build the WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de("CF_SQL_" & listGetAt(validColumns, listFindNoCase(validColumns, key), ","))})>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

        <!--- Handle errors and log them --->
        <cfcatch type="any">
            <cflog file="application" text="Error in geteventcontactsxref: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with the correct structure on error --->
            <cfset result = queryNew("eventContactID,eventID,contactID,IsDeleted", "integer,integer,integer,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- No syntax errors were found in the provided code.
--->

<cffunction name="updateeventcontactsxref" access="public" returntype="boolean">
    <cfargument name="eventContactID" type="numeric" required="true">
    <cfargument name="eventID" type="numeric" required="false" default="">
    <cfargument name="contactID" type="numeric" required="false" default="">
    <cfargument name="IsDeleted" type="boolean" required="false" default="">
    
    <cfset var result = false>
    <cfset var sql = "UPDATE eventcontactsxref_tbl SET">
    <cfset var setClauses = []>
    
    <!--- Build SET clauses dynamically based on provided arguments --->
    <cfif structKeyExists(arguments, "eventID") and len(trim(arguments.eventID))>
        <cfset arrayAppend(setClauses, "eventID = ?")>
    </cfif>
    
    <cfif structKeyExists(arguments, "contactID") and len(trim(arguments.contactID))>
        <cfset arrayAppend(setClauses, "contactID = ?")>
    </cfif>
    
    <cfif structKeyExists(arguments, "IsDeleted") and isBoolean(arguments.IsDeleted)>
        <cfset arrayAppend(setClauses, "IsDeleted = ?")>
    </cfif>

    <!--- If no fields to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Construct the final SQL query --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE eventContactID = ?">

    <!--- Try to execute the query --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfif structKeyExists(arguments, "eventID") and len(trim(arguments.eventID))>
                <cfqueryparam value="#arguments.eventID#" cfsqltype="CF_SQL_INTEGER">
            </cfif>

            <cfif structKeyExists(arguments, "contactID") and len(trim(arguments.contactID))>
                <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            </cfif>

            <cfif structKeyExists(arguments, "IsDeleted") and isBoolean(arguments.IsDeleted)>
                <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">
            </cfif>

            <!--- eventContactID is always required --->
            <cfqueryparam value="#arguments.eventContactID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If no error occurs, return true --->
        <cfset result = true>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in updateeventcontactsxref: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Added missing closing tag for cftry.
--->

<cffunction name="getvm_eventcontactsxref_tbl_contactdetails" access="public" returntype="query">
    <cfargument name="eventid" type="numeric" required="false">
    <cfargument name="contactid" type="numeric" required="false">
    <cfargument name="contactfullname" type="string" required="false">
    <cfargument name="contactstatus" type="string" required="false">
    <cfargument name="orderBy" type="string" required="false" default="eventid">

    <cfset var queryResult = "">
    <cfset var sql = "SELECT eventid, contactid, contactfullname, contactstatus FROM vm_eventcontactsxref_tbl_contactdetails WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validOrderByColumns = "eventid,contactid,contactfullname,contactstatus">

    <!--- Building the WHERE clause dynamically --->
    <cfif structKeyExists(arguments, "eventid") and not isNull(arguments.eventid)>
        <cfset arrayAppend(whereClause, "eventid = ?")>
    </cfif>
    
    <cfif structKeyExists(arguments, "contactid") and not isNull(arguments.contactid)>
        <cfset arrayAppend(whereClause, "contactid = ?")>
    </cfif>

    <cfif structKeyExists(arguments, "contactfullname") and not isNull(arguments.contactfullname)>
        <cfset arrayAppend(whereClause, "contactfullname = ?")>
    </cfif>

    <cfif structKeyExists(arguments, "contactstatus") and not isNull(arguments.contactstatus)>
        <cfset arrayAppend(whereClause, "contactstatus = ?")>
    </cfif>

    <!--- Append conditions to SQL if there are any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND #arrayToList(whereClause, ' AND ')#">
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY `#arguments.orderBy#`">
    </cfif>

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <!--- Bind parameters using cfqueryparam --->
            <cfif structKeyExists(arguments, "eventid") and not isNull(arguments.eventid)>
                <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>

            <cfif structKeyExists(arguments, "contactid") and not isNull(arguments.contactid)>
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>

            <cfif structKeyExists(arguments, "contactfullname") and not isNull(arguments.contactfullname)>
                <cfqueryparam value="#arguments.contactfullname#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>

            <cfif structKeyExists(arguments, "contactstatus") and not isNull(arguments.contactstatus)>
                <cfqueryparam value="#arguments.contactstatus#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getvm_eventcontactsxref_tbl_contactdetails: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            
            <!--- Return an empty query with matching schema on error --->
            <cfset queryResult = queryNew("eventid, contactid, contactfullname, contactstatus", "integer, integer, varchar, varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn queryResult>
</cffunction></cfcomponent>
