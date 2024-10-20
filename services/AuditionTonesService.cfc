<cfcomponent displayname="AuditionTonesService" hint="Handles operations for AuditionTones table" output="false" > 
<cffunction name="insertaudtones" access="public" returntype="numeric">
    <cfargument name="toneid" type="numeric" required="true">
    <cfargument name="tone" type="string" required="true">
    <cfargument name="audCatid" type="numeric" required="false" default="2">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>
    <cfargument name="recordname" type="string" required="false">

    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#application.dsn#" result="insertResult">
            INSERT INTO audtones (toneid, tone, audCatid, isDeleted, recordname)
            VALUES (
                <cfqueryparam value="#arguments.toneid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.tone#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#not structKeyExists(arguments, 'recordname')#">
            )
        </cfquery>
        <cfreturn insertResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into audtones: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL: INSERT INTO audtones (toneid, tone, audCatid, isDeleted, recordname) VALUES (?, ?, ?, ?, ?)">
            <cfreturn 0>
        </cfcatch>
    </cftry>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="updateaudtones" access="public" returntype="boolean">
    <cfargument name="toneid" type="numeric" required="true">
    <cfargument name="tone" type="string" required="true">
    <cfargument name="audCatid" type="numeric" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="recordname" type="string" required="false">

    <cfset var result = false>
    <cfset var sql = "UPDATE audtones SET tone = ?, audCatid = ?, isDeleted = ?, recordname = ? WHERE toneid = ?">
    
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.tone#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
            <cfqueryparam value="#arguments.toneid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset result = true>
        <cfcatch>
            <cflog file="application" text="Error in updateaudtones: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#"/>
            <cfset result = false>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None, the code was already correct.
--->
</cfcomponent>
