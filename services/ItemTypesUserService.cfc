<cfcomponent displayname="ItemTypesUserService" hint="Handles operations for ItemTypesUser table" output="false" > 
<cffunction name="insertitemtypes_user" access="public" returntype="numeric">
    <cfargument name="typeID" type="numeric" required="true">
    <cfargument name="valueType" type="string" required="true">
    <cfargument name="typeIcon" type="string" required="false" default="">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="recordname" type="string" required="false" default="">
    <cfargument name="IsDeleted" type="boolean" required="true">
    <cfargument name="IsCustom" type="boolean" required="true">

    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            INSERT INTO itemtypes_user_tbl (
                typeID, valueType, typeIcon, userid, recordname, IsDeleted, IsCustom
            ) VALUES (
                <cfqueryparam value="#arguments.typeID#" cfsqltype="CF_SQL_SMALLINT">,
                <cfqueryparam value="#arguments.valueType#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.typeIcon#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.typeIcon)#">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">,
                <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.IsCustom#" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        
        <cfset insertResult = result.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error in insertitemtypes_user: #cfcatch.message# Details: #cfcatch.detail#">
            <cflog file="application" text="SQL Query: INSERT INTO itemtypes_user_tbl (typeID, valueType, typeIcon, userid, recordname, IsDeleted, IsCustom) VALUES (?,?,?,?,?,?,?)">
            <!--- Return 0 or an appropriate error code in case of failure --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Removed default attribute from required arguments IsDeleted and IsCustom.
--->

<cffunction name="getitemtypes_user" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="false">
    <cfargument name="valueType" type="string" required="false">
    <cfargument name="isDeleted" type="boolean" required="false">
    <cfargument name="isCustom" type="boolean" required="false">
    <cfargument name="orderBy" type="string" required="false" default="typeID">

    <cfset var queryResult = "">
    <cfset var sql = "SELECT typeID, valueType, typeIcon, userid, recordname, IsDeleted, IsCustom FROM itemtypes_user_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validOrderByColumns = "typeID,valueType,typeIcon,userid,recordname,IsDeleted,IsCustom">

    <!--- Build dynamic WHERE clause --->
    <cfif structKeyExists(arguments, "userid")>
        <cfset arrayAppend(whereClause, "userid = ?")>
    </cfif>
    
    <cfif structKeyExists(arguments, "valueType")>
        <cfset arrayAppend(whereClause, "valueType = ?")>
    </cfif>

    <cfif structKeyExists(arguments, "isDeleted")>
        <cfset arrayAppend(whereClause, "IsDeleted = ?")>
    </cfif>

    <cfif structKeyExists(arguments, "isCustom")>
        <cfset arrayAppend(whereClause, "IsCustom = ?")>
    </cfif>

    <!--- Add dynamic WHERE conditions to SQL --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate ORDER BY column --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfif structKeyExists(arguments, "userid")>
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif structKeyExists(arguments, "valueType")>
                <cfqueryparam value="#arguments.valueType#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif structKeyExists(arguments, "isDeleted")>
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            </cfif>
            <cfif structKeyExists(arguments, "isCustom")>
                <cfqueryparam value="#arguments.isCustom#" cfsqltype="CF_SQL_BIT">
            </cfif>
        </cfquery>

        <!--- Handle exceptions and log errors --->
        <cfcatch type="any">
            <cflog file="application" text="Error in getitemtypes_user: #cfcatch.message# - #sql# - #serializeJSON(cfcatch)#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset queryResult = queryNew("typeID,valueType,typeIcon,userid,recordname,IsDeleted,IsCustom", 
                "smallint,varchar,varchar,int,varchar,bit,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn queryResult>
</cffunction> 

<!--- Changes made:
- Corrected the initialization of `queryResult` from an empty string to an empty query object.
--->
</cfcomponent>
