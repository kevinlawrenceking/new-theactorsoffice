<cfcomponent displayname="SiteTypeUserService" hint="Handles operations for SiteTypeUser table" output="false" > 
<cffunction name="insertsitetypes_user" access="public" returntype="numeric">
    <cfargument name="siteTypeid" type="numeric" required="true">
    <cfargument name="siteTypeName" type="string" required="true">
    <cfargument name="siteTypeDescription" type="string" required="false" default="">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="IsDeleted" type="boolean" required="true">
    <cfargument name="pnTitle" type="string" required="false" default="">
    <cfargument name="pnid" type="numeric" required="false" default=0>

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO sitetypes_user_tbl (siteTypeid, siteTypeName, siteTypeDescription, userid, IsDeleted, pnTitle, pnid) VALUES (?, ?, ?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            #sql#
            <cfqueryparam value="#arguments.siteTypeid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.siteTypeName#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.siteTypeDescription#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.siteTypeDescription)#">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.pnTitle#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.pnTitle)#">
            <cfqueryparam value="#arguments.pnid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.pnid)#">
        </cfquery>
        <cfset insertResult = result.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into sitetypes_user_tbl: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return 0 or any other appropriate error indicator --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Removed the default attribute from the 'IsDeleted' argument as it is not needed when 'required' is true.
--->

<cffunction name="getsitetypes_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfset var sql = "SELECT siteTypeid, siteTypeName, siteTypeDescription, userid, IsDeleted, pnTitle, pnid FROM sitetypes_user_tbl WHERE IsDeleted = 0">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "siteTypeid,siteTypeName,siteTypeDescription,userid,IsDeleted,pnTitle,pnid">
    <cfset var validOrderColumns = "siteTypeid,siteTypeName,userid,pnid">
    <cfset var result = "">

    <cftry>
        <!--- Build dynamic WHERE clause based on filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de("CF_SQL_" & listGetAt(validColumns, listFindNoCase(validColumns, key)) )})>
            </cfif>
        </cfloop>

        <!--- Append WHERE conditions to SQL --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Add ORDER BY clause if specified and valid --->
        <cfif len(arguments.orderBy) and listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getsitetypes_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
        
        <!--- Return an empty query with the correct structure --->
        <cfset result = queryNew("siteTypeid,siteTypeName,siteTypeDescription,userid,IsDeleted,pnTitle,pnid", "integer,varchar,varchar,integer,bit,varchar,integer")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- No syntax errors were found in the provided code.
--->

<cffunction name="updatesitetypes_user" access="public" returntype="boolean">
    <cfargument name="siteTypeid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">

    <cfset var sql = "UPDATE sitetypes_user_tbl SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "siteTypeName,siteTypeDescription,pnTitle,pnid,IsDeleted">
    <cfset var result = false>

    <cftry>
        <!--- Construct SET clauses dynamically based on provided data --->
        <cfloop collection="#arguments.data#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(setClauses, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- If no valid columns are provided, return false --->
        <cfif arrayLen(setClauses) EQ 0>
            <cfreturn false>
        </cfif>

        <!--- Complete the SQL statement --->
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE siteTypeid = ? AND userid = ?">

        <!--- Execute the query --->
        <cfquery datasource="#DSN#">
            #sql#
            <cfloop collection="#arguments.data#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="#getSQLType(key)#" null="#isNull(arguments.data[key])#">
                </cfif>
            </cfloop>
            <cfqueryparam value="#arguments.siteTypeid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If no error occurred, set result to true --->
        <cfset result = true>

    <cfcatch type="any">
        <!--- Log the error details --->
        <cflog file="application" text="Error in updatesitetypes_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
        
        <!--- Return false in case of an error --->
        <cfset result = false>
    </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected missing closing tag for cfcatch.
--->

<cffunction name="getvm_sitetypes_user_pgpanels_user" access="public" returntype="query">
    <cfargument name="new_sitetypeid" type="numeric" required="true">
    <cfargument name="orderBy" type="string" required="false" default="pnid">
    
    <cfset var validOrderColumns = "pnid,sitetypeid,sitetypename,sitetypedescription,pntitle,isvisible">
    <cfset var sql = "SELECT pnid, sitetypeid, sitetypename, sitetypedescription, pntitle, isvisible FROM vm_sitetypes_user_pgpanels_user WHERE 1=1">
    <cfset var result = "">
    
    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <cftry>
        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            AND sitetypeid = <cfqueryparam value="#arguments.new_sitetypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch>
            <!--- Log error details --->
            <cflog file="application" text="Error in getvm_sitetypes_user_pgpanels_user: #cfcatch.message#; Detail: #cfcatch.detail#; SQL: #sql#">
            
            <!--- Return an empty query with the correct schema on error --->
            <cfset result = queryNew("pnid,sitetypeid,sitetypename,sitetypedescription,pntitle,isvisible", "integer,integer,varchar,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction></cfcomponent>
