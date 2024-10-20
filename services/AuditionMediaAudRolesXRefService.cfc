<cfcomponent displayname="AuditionMediaAudRolesXRefService" hint="Handles operations for AuditionMediaAudRolesXRef table" output="false" > 
<cffunction name="insertaudmedia_audroles_xref" access="public" returntype="numeric">
    <cfargument name="mediaid" type="numeric" required="true">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="mediaAudroleDescript" type="string" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audmedia_audroles_xref (mediaid, audroleid, mediaAudroleDescript, isDeleted) VALUES (?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.mediaid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.mediaAudroleDescript#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.mediaAudroleDescript)#">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT" null="#isNull(arguments.isDeleted)#">
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error in insertaudmedia_audroles_xref: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL: #sql#">
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- None. The function code is syntactically correct.
--->

<cffunction name="updateaudmedia_audroles_xref" access="public" returntype="boolean">
    <cfargument name="mediaid" type="numeric" required="true">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="mediaAudroleDescript" type="string" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>

    <cfset var result = false>
    <cfset var sql = "">
    
    <cftry>
        <cfset sql = "UPDATE audmedia_audroles_xref SET mediaAudroleDescript = ?, isDeleted = ? WHERE mediaid = ? AND audroleid = ?">

        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.mediaAudroleDescript#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.mediaAudroleDescript)#">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT" null="#isNull(arguments.isDeleted)#">
            <cfqueryparam value="#arguments.mediaid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfset result = true>
        
        <cfcatch>
            <cflog file="application" text="Error updating audmedia_audroles_xref: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <cfset result = false>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<!--- Changes made:
- No syntax errors found in the provided code.
--->
</cfcomponent>
