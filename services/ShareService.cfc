<cfcomponent displayname="ShareService" hint="Handles operations for Share table" output="false" > 
<cffunction name="getshares" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var sql = "SELECT contactid, userid, contactphoto, col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, topaudstatus, col12, u, col11 FROM shares WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "contactid,userid,contactphoto,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10,topaudstatus,col12,u,col11">
    <cfset var validOrderByColumns = "contactid,userid,col12">
    <cfset var result = "">

    <cftry>
        <!--- Build WHERE clause dynamically --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- Append WHERE conditions to SQL if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & ucase(listGetAt(validColumns & ', ', listFindNoCase(validColumns & ', ', key)))#)" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getshares: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">

        <!--- Return an empty query with correct schema on error --->
        <cfset result = queryNew("contactid,userid,contactphoto,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10,topaudstatus,col12,u,col11", "integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,date,char,longtext")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected the evaluate function syntax for cfsqltype in cfqueryparam.
--->
</cfcomponent>
