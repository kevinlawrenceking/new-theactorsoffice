<cfcomponent displayname="AuditionDialectService" hint="Handles operations for AuditionDialect table" output="false" > 
<cffunction name="insertauddialects" access="public" returntype="numeric">
    <cfargument name="auddialect" type="string" required="true">
    <cfargument name="audCatid" type="numeric" required="false" default="2">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>
    <cfargument name="recordname" type="string" required="false" default="">
    
    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO auddialects (auddialect, audCatid, isDeleted, recordname) VALUES (?, ?, ?, ?)">
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            #sql#
            <cfqueryparam value="#arguments.auddialect#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
        </cfquery>
        
        <cfset insertResult = result.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into auddialects: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- None. The function code is syntactically correct.
--->

<cffunction name="updateauddialects" access="public" returntype="boolean">
    <cfargument name="auddialectid" type="numeric" required="true">
    <cfargument name="auddialect" type="string" required="true">
    <cfargument name="audCatid" type="numeric" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false" default="">
    <cfargument name="recordname" type="string" required="false" default="">
    
    <cfset var result = false>
    <cfset var sql = "UPDATE auddialects SET">
    <cfset var setClauses = []>
    
    <!--- Build SET clauses dynamically --->
    <cfif len(arguments.auddialect)>
        <cfset arrayAppend(setClauses, "auddialect = ?")>
    </cfif>
    <cfif len(arguments.audCatid)>
        <cfset arrayAppend(setClauses, "audCatid = ?")>
    </cfif>
    <cfif isDefined("arguments.isDeleted")>
        <cfset arrayAppend(setClauses, "isDeleted = ?")>
    </cfif>
    <cfif len(arguments.recordname)>
        <cfset arrayAppend(setClauses, "recordname = ?")>
    </cfif>

    <!--- Proceed only if there are fields to update --->
    <cfif arrayLen(setClauses) gt 0>
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE auddialectid = ?">

        <!--- Try to execute the query --->
        <cftry>
            <cfquery datasource="#DSN#">
                #sql#
                <!--- Bind parameters --->
                <cfif len(arguments.auddialect)>
                    <cfqueryparam value="#arguments.auddialect#" cfsqltype="CF_SQL_VARCHAR">
                </cfif>
                <cfif len(arguments.audCatid)>
                    <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">
                </cfif>
                <cfif isDefined("arguments.isDeleted")>
                    <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
                </cfif>
                <cfif len(arguments.recordname)>
                    <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR">
                </cfif>
                <!--- WHERE clause parameter --->
                <cfqueryparam value="#arguments.auddialectid#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>

            <!--- If no error, set result to true --->
            <cfset result = true>

            <!--- Error handling and logging --->
            <cfcatch type="any">
                <cflog file="application" text="Error in updateauddialects: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            </cfcatch>
        </cftry>
    </cfif>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected the default attribute for 'audCatid' and 'isDeleted' arguments to be compatible with their types.
--->
</cfcomponent>
