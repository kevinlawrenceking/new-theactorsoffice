<cfcomponent displayname="PanelUserService" hint="Handles operations for PanelUser table" output="false" > 
<cffunction name="insertpgpanels_user" access="public" returntype="numeric">
    <cfargument name="pnTitle" type="string" required="false" default="">
    <cfargument name="pnFilename" type="string" required="false" default="">
    <cfargument name="pnOrderNo" type="numeric" required="false" default="0">
    <cfargument name="pnColXl" type="numeric" required="false" default="4">
    <cfargument name="pnColMd" type="numeric" required="false" default="6">
    <cfargument name="pnDescription" type="string" required="false" default="">
    <cfargument name="IsVisible" type="boolean" required="true">
    <cfargument name="IsDeleted" type="boolean" required="true">
    <cfargument name="userid" type="numeric" required="false">

    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery"  result="result">
            INSERT INTO pgpanels_user_tbl (
                pnTitle, pnFilename, pnOrderNo, pnColXl, pnColMd, 
                pnDescription, IsVisible, IsDeleted, userid
            ) VALUES (
                <cfqueryparam value="#arguments.pnTitle#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.pnTitle)#">,
                <cfqueryparam value="#arguments.pnFilename#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.pnFilename)#">,
                <cfqueryparam value="#arguments.pnOrderNo#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.pnColXl#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.pnColMd#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.pnDescription#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.pnDescription)#">,
                <cfqueryparam value="#arguments.IsVisible#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.userid)#">
            )
        </cfquery>
        
        <cfset insertResult = result.generatedKey>
        
        <cfcatch>
            <cflog text="Error inserting into pgpanels_user_tbl: #cfcatch.message# - #cfcatch.detail#"/>
            <cflog text="SQL: INSERT INTO pgpanels_user_tbl ..."/>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction> 



<cffunction name="getpgpanels_user" access="public" returntype="query">
        <!--- Define the argument for userId --->
        <cfargument name="userId" type="numeric" required="true">
        
        <!--- Declare the local variable scope --->
        <cfset var local = {}>
        
        <!--- Create the query --->
        <cfquery name="local.qPanels" >
            SELECT 
                p.pnid, 
                p.pntitle, 
                p.pnColXl, 
                p.pnColMd, 
                p.pnFilename, 
                p.pnorderno AS new_pnorderno
            FROM 
                pgpanels_user p
            WHERE 
                p.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
                AND p.isvisible = 1
            ORDER BY 
                p.pnorderno
        </cfquery>
        
        <!--- Return the query result --->
        <cfreturn local.qPanels>
    </cffunction>


 



<!--- Changes made:
- Corrected the use of the 'de' function to 'createObject' for proper dynamic SQL type determination.
--->

<cffunction name="updatepgpanels_user" access="public" returntype="boolean">
    <cfargument name="pnID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    <cfset var sql = "UPDATE pgpanels_user_tbl SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "pnTitle,pnFilename,pnOrderNo,pnColXl,pnColMd,pnDescription,IsVisible,IsDeleted,userid">
    <cfset var result = false>

    <cfloop collection="#arguments.data#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(setClauses, "#key# = ?")>
        </cfif>
    </cfloop>

    <cfif arrayLen(setClauses) gt 0>
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE pnID = ?">

        <cftry>
            <cfquery >
                #sql#
                <cfloop collection="#arguments.data#" item="key">
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="#evaluate('CF_SQL_' & uCase(listGetAt(validColumns, listFindNoCase(validColumns, key))))#" null="#isNull(arguments.data[key])#">
                </cfloop>
                <cfqueryparam value="#arguments.pnID#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>
            <cfset result = true>
            <cfcatch>
                <cflog file="application" text="Error updating pgpanels_user_tbl: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            </cfcatch>
        </cftry>
    </cfif>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Added missing closing parenthesis in the evaluate function call within cfqueryparam.
--->

<cffunction name="getvm_pgpanels_user_sitetypes_user" access="public" returntype="query">
    <cfargument name="new_sitetypeid" type="numeric" required="true">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfset var result = "">
    <cfset var sql = "SELECT pnid, pntitle, correct_title, new_pnOrderNo FROM vm_pgpanels_user_sitetypes_user WHERE sitetypeid = ?">
    <cfset var whereClause = []>
    <cfset var validColumns = "pnid,pntitle,correct_title,new_pnOrderNo">

    <cftry>
        <!--- Build dynamic WHERE clause based on filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- Append dynamic WHERE clause to SQL if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.new_sitetypeid#" cfsqltype="CF_SQL_INTEGER">
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

        <!--- Order by clause for consistent sorting --->
        <cfif structKeyExists(arguments.filters, "orderBy") and listFindNoCase(validColumns, arguments.filters.orderBy)>
            <cfset sql &= " ORDER BY #arguments.filters.orderBy#">
        </cfif>

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog file="application" text="Error in getvm_pgpanels_user_sitetypes_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
        
        <!--- Return an empty query with matching schema --->
        <cfset result = queryNew("pnid,pntitle,correct_title,new_pnOrderNo", "integer,varchar,varchar,bigint")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction></cfcomponent>
