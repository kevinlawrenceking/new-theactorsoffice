<cfcomponent displayname="GenderPronounService" hint="Handles operations for GenderPronoun table" output="false" > 
<cffunction name="getgenderpronouns" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="genderPronoun">
    <cfset var validColumns = "genderPronoun,genderPronounPlural,isDeleted">
    <cfset var validOrderColumns = "genderPronoun,genderPronounPlural">
    <cfset var whereClause = []>
    <cfset var sql = "SELECT genderPronoun, genderPronounPlural, isDeleted FROM genderpronouns_tbl WHERE isDeleted = 0">
    <cfset var result = "">

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

        <!--- Validate ORDER BY column --->
        <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

        <!--- Return the result --->
        <cfreturn result>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getgenderpronouns: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">

        <!--- Return an empty query with correct schema --->
        <cfreturn queryNew("genderPronoun,genderPronounPlural,isDeleted", "varchar,varchar,bit")>
    </cfcatch>
    </cftry>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->
</cfcomponent>
