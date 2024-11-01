<cfcomponent displayname="ContactImportService" hint="Handles operations for ContactImport table" output="false"> 


    <cffunction name="getImportsByUserID" access="public" returntype="query" output="false" hint="Retrieve import data for a specific user.">
        <!--- Define function arguments --->
        <cfargument name="userid" type="numeric" required="true" hint="The ID of the user to fetch import data for.">
        
        <!--- Query to fetch import data --->
        <cfquery name="imports" datasource="yourDataSource">
            SELECT 
                u.uploadid,
                u.`timestamp`,
                u.userid,
                u.uploadstatus,
                i.status,
                COUNT(i.ID) AS total_adds
            FROM 
                contactsimport i 
            INNER JOIN 
                uploads u ON u.uploadid = i.uploadid
            INNER JOIN 
                contactdetails d ON d.contactid = i.contactid
            WHERE 
                u.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
                AND u.isdeleted = 0
            GROUP BY 
                u.uploadid,
                u.timestamp,
                u.userid,
                u.uploadstatus,
                i.status
        </cfquery>
        
        <!--- Return the query result --->
        <cfreturn imports>
    </cffunction>




<cffunction name="SELcontactsimport_24668" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                u.uploadid, 
                u.`timestamp`, 
                u.userid, 
                u.uploadstatus, 
                i.status, 
                COUNT(i.ID) AS total_adds
            FROM 
                contactsimport i
            INNER JOIN 
                uploads u ON u.uploadid = i.uploadid
            INNER JOIN 
                contactdetails d ON d.contactid = i.contactid
            WHERE 
                u.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND u.isdeleted = 0
            GROUP BY 
                u.uploadid, u.timestamp, u.userid, u.uploadstatus, i.status
        </cfquery>
        
        <cfreturn result>
        
    <cfcatch type="any">
        <cflog file="application" text="Error in getUploadData: #cfcatch.message#">
        <cfreturn queryNew("")>
    </cfcatch>
    </cftry>
</cffunction>


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
