<cfcomponent displayname="AuditionQuestionTypeService" hint="Handles operations for AuditionQuestionType table" output="false" > 
<cffunction name="insertaudqtypes" access="public" returntype="numeric">
    <cfargument name="qtypeid" type="numeric" required="true">
    <cfargument name="qtype" type="string" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="recordname" type="string" required="false">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audqtypes (qtypeid, qtype, isDeleted, recordname) VALUES (?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.qtypeid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.qtype#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#not structKeyExists(arguments, 'recordname')#">
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into audqtypes: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- No syntax errors found. Code is correct as provided.
--->

<cffunction name="updateaudqtypes" access="public" returntype="boolean">
    <cfargument name="qtypeid" type="numeric" required="true">
    <cfargument name="qtype" type="string" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="recordname" type="string" required="false">

    <cfset var result = false>
    <cfset var sql = "UPDATE audqtypes SET qtype = ?, isDeleted = ?, recordname = ? WHERE qtypeid = ?">
    
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.qtype#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#not structKeyExists(arguments, 'recordname')#">
            <cfqueryparam value="#arguments.qtypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset result = true>
        <cfcatch>
            <cflog file="application" type="error" text="Error updating audqtypes: #cfcatch.message#. Details: #cfcatch.detail#. SQL: #sql#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction> 
<!--- Changes made:
- No changes were necessary as the code is syntactically correct.
--->
</cfcomponent>
