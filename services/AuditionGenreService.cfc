<cfcomponent displayname="AuditionGenreService" hint="Handles operations for AuditionGenre table" output="false" > 
<cffunction name="insertaudgenres" access="public" returntype="numeric">
    <cfargument name="audgenre" type="string" required="true">
    <cfargument name="audCatid" type="numeric" required="true">
    <cfargument name="recordname" type="string" required="false" default="">
    
    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO audgenres (audgenre, audCatid, isDeleted, recordname) 
            VALUES (
                <cfqueryparam value="#arguments.audgenre#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#not len(arguments.recordname)#">
            )
        </cfquery>
        
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into audgenres: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL: INSERT INTO audgenres (audgenre, audCatid, isDeleted, recordname) VALUES (?, ?, ?, ?)">
        </cfcatch>
    </cftry>
    
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct and should execute properly.
--->

<cffunction name="updateaudgenres" access="public" returntype="boolean">
    <cfargument name="audgenreid" type="numeric" required="true">
    <cfargument name="audgenre" type="string" required="true">
    <cfargument name="audCatid" type="numeric" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="recordname" type="string" required="false">

    <cfset var result = false>
    <cfset var sql = "UPDATE audgenres SET audgenre = ?, audCatid = ?, isDeleted = ?, recordname = ? WHERE audgenreid = ?">
    
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.audgenre#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
            <cfqueryparam value="#arguments.audgenreid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset result = true>
        <cfcatch>
            <cflog file="application" text="Error updating audgenres: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None, the function code is syntactically correct.
--->
</cfcomponent>
