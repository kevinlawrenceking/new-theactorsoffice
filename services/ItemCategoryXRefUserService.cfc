<cfcomponent displayname="ItemCategoryXRefUserService" hint="Handles operations for ItemCategoryXRefUser table" output="false" > 
<cffunction name="insertitemcatxref_user" access="public" returntype="numeric">
    <cfargument name="itemCatID" type="numeric" required="true">
    <cfargument name="typeid" type="numeric" required="true">
    <cfargument name="catid" type="numeric" required="true">
    <cfargument name="IsDeleted" type="boolean" required="true">
    <cfargument name="userid" type="numeric" required="false" default="">
    <cfargument name="IsCustom" type="boolean" required="false" default=false>

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO itemcatxref_user_tbl (itemCatID, typeid, catid, IsDeleted, userid, IsCustom) VALUES (?, ?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            #sql#
            <cfqueryparam value="#arguments.itemCatID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.typeid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.catid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.userid)#">
            <cfqueryparam value="#arguments.IsCustom#" cfsqltype="CF_SQL_BIT">
        </cfquery>
        <cfset insertResult = result.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into itemcatxref_user_tbl: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return 0 or handle as needed for your application --->
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction> 

<!--- Changes made:
- Removed the default attribute from the 'IsDeleted' argument as it conflicts with 'required=true'.
--->

<cffunction name="getitemcatxref_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var result = "">
    <cfset var sql = "SELECT itemCatID, typeid, catid, userid, IsDeleted, IsCustom FROM itemcatxref_user_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "itemCatID,typeid,catid,userid,IsDeleted,IsCustom">
    <cfset var validOrderByColumns = "itemCatID,typeid,catid,userid">

    <cftry>
        <!--- Build WHERE clause dynamically based on filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- Append WHERE clause to SQL if any conditions exist --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif len(arguments.orderBy) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#getSQLType(key)#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

        <!--- Handle errors and log them --->
        <cfcatch type="any">
            <cflog file="application" text="Error in getitemcatxref_user: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with the correct structure on error --->
            <cfset result = queryNew("itemCatID,typeid,catid,userid,IsDeleted,IsCustom", "integer,integer,integer,integer,bit,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Added missing `<cfcatch>` closing tag to properly close the `try-catch` block.
--->
</cfcomponent>
