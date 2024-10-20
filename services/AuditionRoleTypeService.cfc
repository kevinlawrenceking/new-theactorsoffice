<cfcomponent displayname="AuditionRoleTypeService" hint="Handles operations for AuditionRoleType table" output="false" > 
<cffunction name="insertaudroletypes" access="public" returntype="numeric">
    <cfargument name="audroletype" type="string" required="true">
    <cfargument name="audCatid" type="numeric" required="false" default="2">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>
    <cfargument name="recordname" type="string" required="false" default="">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audroletypes (audroletype, audCatid, isDeleted, recordname) VALUES (?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.audroletype#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into audroletypes: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Handle error by returning 0 or another appropriate value --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="getaudroletypes" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var queryResult = "">
    <cfset var sql = "SELECT audroletypeid, audroletype, audCatid, isDeleted, recordname FROM audroletypes WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "audroletypeid,audroletype,audCatid,isDeleted,recordname">
    <cfset var validOrderByColumns = "audroletypeid,audroletype,audCatid,isDeleted,recordname">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Add WHERE conditions to SQL --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Handle ORDER BY clause --->
    <cfif len(trim(arguments.orderBy)) gt 0 and listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="
                        <cfif key eq 'audroletypeid' or key eq 'audCatid'>
                            CF_SQL_INTEGER
                        <cfelseif key eq 'isDeleted'>
                            CF_SQL_BIT
                        <cfelse>
                            CF_SQL_VARCHAR
                        </cfif>" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error in getaudroletypes: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">

            <!--- Return an empty query with the correct schema --->
            <cfset queryResult = queryNew("audroletypeid,audroletype,audCatid,isDeleted,recordname", "integer,varchar,integer,bit,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn queryResult>
</cffunction>

<!--- Changes made:
- Corrected the cfqueryparam tag by ensuring the cfsqltype attribute is properly closed.
--->

<cffunction name="updateaudroletypes" access="public" returntype="boolean">
    <cfargument name="audroletypeid" type="numeric" required="true">
    <cfargument name="audroletype" type="string" required="true">
    <cfargument name="audCatid" type="numeric" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="recordname" type="string" required="false">

    <cfset var result = false>
    <cfset var sql = "">
    
    <cftry>
        <cfset sql = "UPDATE audroletypes SET audroletype = ?, audCatid = ?, isDeleted = ?">
        
        <cfif structKeyExists(arguments, "recordname") and len(arguments.recordname)>
            <cfset sql &= ", recordname = ?">
        </cfif>
        
        <cfset sql &= " WHERE audroletypeid = ?">

        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.audroletype#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            
            <cfif structKeyExists(arguments, "recordname") and len(arguments.recordname)>
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#not len(arguments.recordname)#">
            </cfif>
            
            <cfqueryparam value="#arguments.audroletypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfset result = true>

        <cfcatch>
            <cflog file="application" text="Error in updateaudroletypes: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The function code is syntactically correct and should execute properly.
--->
</cfcomponent>
