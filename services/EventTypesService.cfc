<cfcomponent displayname="EventTypesService" hint="Handles operations for EventTypes table" output="false" > 
<cffunction name="geteventtypes" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">

    <cfset var sql = "SELECT eventTypeName, eventTypeDescription, recordname, eventtypecolor, IsDeleted FROM eventtypes_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "eventTypeName,eventTypeDescription,recordname,eventtypecolor,IsDeleted">
    <cfset var validOrderByColumns = "eventTypeName,eventTypeDescription,recordname,eventtypecolor">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfif structKeyExists(arguments.filters, key) and not isNull(arguments.filters[key])>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLTypeForColumn(key)})>
            </cfif>
        </cfif>
    </cfloop>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    <cfelse>
        <!--- Return empty query if no filters are provided --->
        <cfreturn queryNew("eventTypeName,eventTypeDescription,recordname,eventtypecolor,IsDeleted", "varchar,varchar,varchar,varchar,bit")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif len(arguments.orderBy) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>

        <cfreturn result>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in geteventtypes: #cfcatch.message#, Detail: #cfcatch.detail#, SQL: #sql#">
            <!--- Return an empty query on error --->
            <cfreturn queryNew("eventTypeName,eventTypeDescription,recordname,eventtypecolor,IsDeleted", "varchar,varchar,varchar,varchar,bit")>
        </cfcatch>
    </cftry>
</cffunction> 

<!--- Changes made:
- None. The function code contains no syntax errors.
--->
</cfcomponent>
