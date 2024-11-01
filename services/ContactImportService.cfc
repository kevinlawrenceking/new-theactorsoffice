<cfcomponent displayname="ContactImportService" hint="Handles operations for ContactImport table" output="false"> 

    <cffunction name="INScontactsimport" access="public" returntype="void">
        <cfargument name="importData" type="struct" required="true">
        <cfargument name="newUploadId" type="numeric" required="true">

        <cftry>
            <!--- Begin building the SQL query --->
            <cfset var sql = "INSERT INTO contactsimport (uploadid">
            <cfset var values = "<cfqueryparam value='#arguments.newUploadId#' cfsqltype='CF_SQL_INTEGER'>">

            <!--- Optional fields only added if they exist in importData --->
            <cfif structKeyExists(arguments.importData, "FirstName")>
                <cfset sql &= ", fname">
                <cfset values &= ", <cfqueryparam value='#arguments.importData.FirstName#' cfsqltype='CF_SQL_VARCHAR' maxlength='100'>">
            </cfif>

            <cfif structKeyExists(arguments.importData, "LastName")>
                <cfset sql &= ", lname">
                <cfset values &= ", <cfqueryparam value='#arguments.importData.LastName#' cfsqltype='CF_SQL_VARCHAR' maxlength='100'>">
            </cfif>

            <!--- Add other fields as necessary in the same way --->
            <!--- Finalize the SQL query --->
            <cfset sql &= ") VALUES (" & values & ")">

            <!--- Execute the query --->
            <cfquery name="insertQuery" datasource="abod">
                #sql#
            </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error in INScontactsimport: #cfcatch.message#">
            <cfthrow>
        </cfcatch>
    </cftry>

</cffunction>

</cfcomponent>
