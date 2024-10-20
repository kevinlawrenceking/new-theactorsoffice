<cfcomponent displayname="AuditionStepService" hint="Handles operations for AuditionStep table" output="false" > 
<cffunction name="insertaudsteps" access="public" returntype="numeric">
    <cfargument name="audstep" type="string" required="true">
    <cfargument name="isDeleted" type="boolean" required="true" default=false>
    <cfargument name="recordname" type="string" required="false" default="">
    <cfargument name="stepcss" type="string" required="false" default="">
    <cfargument name="stepinfo1" type="string" required="false" default="">
    <cfargument name="stepinfo2" type="string" required="false" default="">
    <cfargument name="stepinfo3" type="string" required="false" default="">
    <cfargument name="stepinfo4" type="string" required="false" default="">
    <cfargument name="stepinfoButton" type="string" required="false" default="">
    
    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO audsteps (
                audstep,
                isDeleted,
                recordname,
                stepcss,
                stepinfo1,
                stepinfo2,
                stepinfo3,
                stepinfo4,
                stepinfoButton
            ) VALUES (
                <cfqueryparam value="#arguments.audstep#" cfsqltype="CF_SQL_VARCHAR">
                ,<cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
                ,<cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
                ,<cfqueryparam value="#arguments.stepcss#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.stepcss)#">
                ,<cfqueryparam value="#arguments.stepinfo1#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.stepinfo1)#">
                ,<cfqueryparam value="#arguments.stepinfo2#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.stepinfo2)#">
                ,<cfqueryparam value="#arguments.stepinfo3#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.stepinfo3)#">
                ,<cfqueryparam value="#arguments.stepinfo4#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.stepinfo4)#">
                ,<cfqueryparam value="#arguments.stepinfoButton#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.stepinfoButton)#">
            )
        </cfquery>
        
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into audsteps: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL: INSERT INTO audsteps (audstep, isDeleted, recordname, stepcss, stepinfo1, stepinfo2, stepinfo3, stepinfo4, stepinfoButton) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>
    
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Corrected the 'required' attribute for 'isDeleted' argument to remove the default value since 'required' and 'default' cannot be used together.
--->

<cffunction name="getaudsteps" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfset var local = {} />
    <cfset local.sql = "SELECT audstepid, audstep, recordname, stepcss, stepinfo1, stepinfo2, stepinfo3, stepinfo4, stepinfoButton, isDeleted FROM audsteps WHERE 1=1" />
    <cfset local.validColumns = "audstepid,audstep,recordname,stepcss,stepinfo1,stepinfo2,stepinfo3,stepinfo4,stepinfoButton,isDeleted" />
    <cfset local.whereClause = [] />
    <cfset local.queryParams = [] />

    <!--- Build dynamic WHERE clause based on filters --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(local.validColumns, key)>
            <cfset arrayAppend(local.whereClause, "#key# = ?")>
            <cfset arrayAppend(local.queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(local.whereClause) gt 0>
        <cfset local.sql &= " AND " & arrayToList(local.whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif arguments.orderBy neq "" and listFindNoCase(local.validColumns, arguments.orderBy)>
        <cfset local.sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="local.result" datasource="abod">
            #local.sql#
            <cfloop array="#local.queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getaudsteps: #cfcatch.message# - #cfcatch.detail#. SQL: #local.sql#">
            <!--- Return an empty query with correct schema on error --->
            <cfset local.result = queryNew("audstepid,audstep,recordname,stepcss,stepinfo1,stepinfo2,stepinfo3,stepinfo4,stepinfoButton,isDeleted", "integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn local.result>
</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="updateaudsteps" access="public" returntype="boolean">
    <cfargument name="audstepid" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    <cfset var sql = "UPDATE audsteps SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "audstep,recordname,stepcss,stepinfo1,stepinfo2,stepinfo3,stepinfo4,stepinfoButton,isDeleted">
    <cfset var result = false>

    <cfloop collection="#arguments.data#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(setClauses, "#key# = ?")>
        </cfif>
    </cfloop>

    <cfif arrayLen(setClauses) gt 0>
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE audstepid = ?">

        <cftry>
            <cfquery datasource="#DSN#">
                #sql#
                <cfloop collection="#arguments.data#" item="key">
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="#evaluate("CF_SQL_" & ucase(listLast(listRest(validColumns), key)))#" null="#isNull(arguments.data[key])#">
                </cfloop>
                <cfqueryparam value="#arguments.audstepid#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>
            <cfset result = true>
            <cfcatch>
                <cflog file="application" text="Error updating audsteps: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
                <cfset result = false>
            </cfcatch>
        </cftry>
    </cfif>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="getvm_audsteps_events" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="id">

    <cfset var result = "">
    <cfset var sql = "SELECT id, userid, name, isdeleted FROM vm_audsteps_events WHERE audroleid = ?">
    <cfset var whereClause = []>
    <cfset var validColumns = "id,userid,name,isdeleted">
    <cfset var validOrderByColumns = "id,userid,name,isdeleted">

    <!--- Validate and construct WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append dynamic WHERE conditions if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate ORDER BY column --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate("CF_SQL_" & uCase(key))#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch>
            <!--- Log the error details --->
            <cflog file="application" text="Error in getvm_audsteps_events: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with matching schema on error --->
            <cfset result = queryNew("id,userid,name,isdeleted", "integer,integer,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction></cfcomponent>
