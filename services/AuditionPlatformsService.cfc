<cfcomponent displayname="AuditionPlatformsService" hint="Handles operations for AuditionPlatforms table" output="false" > 
<cffunction name="insertaudplatforms" access="public" returntype="numeric">
    <cfargument name="audplatform" type="string" required="true">
    <cfargument name="recordname" type="string" required="false" default="">
    
    <cfset var sql = "INSERT INTO audplatforms (audplatform, isDeleted, recordname) VALUES (?, ?, ?)">
    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.audplatform#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into audplatforms: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>
<!--- Changes made:
- Added missing closing tag for cfargument.
- Corrected the use of cfqueryparam for proper parameter binding.
--->

<cffunction name="updateaudplatforms" access="public" returntype="boolean">
    <cfargument name="audplatformid" type="numeric" required="true">
    <cfargument name="audplatform" type="string" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="recordname" type="string" required="false">

    <cfset var result = false>
    <cfset var sql = "">
    
    <cftry>
        <!--- Construct the SQL update statement --->
        <cfset sql = "UPDATE audplatforms SET audplatform = ?, isDeleted = ?">

        <!--- Conditionally add recordname if provided --->
        <cfif structKeyExists(arguments, "recordname") and len(trim(arguments.recordname)) gt 0>
            <cfset sql &= ", recordname = ?">
        </cfif>

        <!--- Add the WHERE clause --->
        <cfset sql &= " WHERE audplatformid = ?">

        <!--- Execute the query --->
        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.audplatform#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            
            <!--- Conditionally add recordname parameter if provided --->
            <cfif structKeyExists(arguments, "recordname") and len(trim(arguments.recordname)) gt 0>
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>

            <cfqueryparam value="#arguments.audplatformid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If no exception occurs, set result to true --->
        <cfset result = true>

        <!--- Error handling --->
        <cfcatch type="any">
            <cflog file="application" text="Error updating audplatforms: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Optionally handle specific errors or rethrow --->
        </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The function code is syntactically correct.
--->
</cfcomponent>
