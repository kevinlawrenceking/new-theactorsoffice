<cfcomponent displayname="ContactImportService" hint="Handles operations for ContactImport table" output="false"> 

    <cffunction name="getImportsByUserID" access="public" returntype="query" output="false" hint="Retrieve import data for a specific user.">
        <cfargument name="userid" type="numeric" required="true" hint="The ID of the user to fetch import data for.">
        
        <cfquery result="result"  name="imports">
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
                u.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="cf_sql_integer">
                AND u.isdeleted = 0
            GROUP BY 
                u.uploadid,
                u.timestamp,
                u.userid,
                u.uploadstatus,
                i.status
        </cfquery>
        
        <cfreturn imports>
    </cffunction>

    <cffunction name="SELcontactsimport_24668" access="public" returntype="query">
        <cfargument name="userid" type="numeric" required="true">
    
        <cfset var result = "">
    
        <cfquery name="result">
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
                u.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND u.isdeleted = 0
            GROUP BY 
                u.uploadid, u.timestamp, u.userid, u.uploadstatus, i.status
        </cfquery>
        
        <cfreturn result>
    </cffunction>

    <cffunction name="INScontactsimport" access="public" returntype="void">
        <cfargument name="importData" type="struct" required="true">
        <cfargument name="newUploadId" type="numeric" required="true">

        <cfset var sql = "INSERT INTO contactsimport (uploadid">
        <cfset var values = "<cfquery result="result" param value='#arguments.newUploadId#' cfsqltype='CF_SQL_INTEGER'>">

        <cfif structKeyExists(arguments.importData, "FirstName")>
            <cfset sql &= ", fname">
            <cfset values &= ", <cfquery result="result" param value='#arguments.importData.FirstName#' cfsqltype='CF_SQL_VARCHAR' maxlength='100'>">
        </cfif>

        <cfif structKeyExists(arguments.importData, "LastName")>
            <cfset sql &= ", lname">
            <cfset values &= ", <cfquery result="result" param value='#arguments.importData.LastName#' cfsqltype='CF_SQL_VARCHAR' maxlength='100'>">
        </cfif>

        <cfset sql &= ") VALUES (" & values & ")">

        <cfquery result="result"  name="insertQuery">
            #sql#
        </cfquery>
    </cffunction>

</cfcomponent>