<cfcomponent displayname="ContactImportService" hint="Handles operations for ContactImport table" output="false"> 

    <cffunction name="getContactImports" access="public" returntype="query">
        <cfargument name="userid" type="numeric" required="true">

        <cfquery name="imports" datasource="abod">
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
                u.uploadid,
                u.timestamp,
                u.userid,
                u.uploadstatus,
                i.status
        </cfquery>
        <cfreturn imports>
    </cffunction>

    <cffunction name="DETcontactsimport" access="public" returntype="query">
        <cfargument name="uploadid" type="numeric" required="true">
        
        <cfset var result = "">
        
        <cftry>
            <cfquery name="result" datasource="abod">
                SELECT contactid 
                FROM contactsimport 
                WHERE uploadid = <cfqueryparam value="#arguments.uploadid#" cfsqltype="CF_SQL_INTEGER"> 
                  AND status = <cfqueryparam value="Added" cfsqltype="CF_SQL_VARCHAR">
            </cfquery>
            
            <cfcatch type="any">
                <cflog file="application" text="Error in getContactsByUploadId: #cfcatch.message# Query: SELECT contactid FROM contactsimport WHERE uploadid = ? AND status = 'Added' Parameters: #arguments.uploadid#">
                <cfthrow>
            </cfcatch>
        </cftry>
        
        <cfreturn result>
    </cffunction>

    <cffunction name="INScontactsimport" access="public" returntype="void">
        <cfargument name="importData" type="struct" required="true">
        <cfargument name="newUploadId" type="numeric" required="true">

        <cfset var sql = "">
        <cfset var params = []>

        <cftry>
            <cfset sql = "INSERT INTO contactsimport (
                uploadid, fname, lname, tag1, tag2, tag3, business_email, personal_email, work_phone, mobile_phone, home_phone,
                company, address, address_second, city, state, zip, country">

            <cfif structKeyExists(arguments.importData, "contactMeetingDate") and arguments.importData.contactMeetingDate neq "">
                <cfset sql &= ", contactMeetingDate">
            </cfif>

            <cfif structKeyExists(arguments.importData, "contactMeetingLocation") and arguments.importData.contactMeetingLocation neq "">
                <cfset sql &= ", contactMeetingLoc">
            </cfif>

            <cfif structKeyExists(arguments.importData, "birthday") and arguments.importData.birthday neq "">
                <cfset sql &= ", birthday">
            </cfif>

            <cfset sql &= ", website, status, notes) VALUES (
                ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
                ?, ?, ?, ?, ?, ?, ?">

            <!-- Populate the params array with each field -->
            <cfarrayappend(params, {value=arguments.newUploadId, cfsqltype="CF_SQL_INTEGER"})>
            <cfarrayappend(params, {value=trim(arguments.importData.FirstName), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.LastName), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.Tag1), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.Tag2), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.Tag3), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.BusinessEmail), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.PersonalEmail), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.WorkPhone), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.MobilePhone), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.HomePhone), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.Company), cfsqltype="CF_SQL_VARCHAR", maxlength=200})>
            <cfarrayappend(params, {value=trim(arguments.importData.Address), cfsqltype="CF_SQL_VARCHAR", maxlength=200})>
            <cfarrayappend(params, {value=trim(arguments.importData.Address2), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.City), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.State), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.Zip), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>
            <cfarrayappend(params, {value=trim(arguments.importData.Country), cfsqltype="CF_SQL_VARCHAR", maxlength=100})>

            <cfif structKeyExists(arguments.importData, "contactMeetingDate") and arguments.importData.contactMeetingDate neq "">
                <cfset sql &= ", ?">
                <cfarrayappend(params, {value=dateformat(arguments.importData.contactMeetingDate,'yyyy-mm-dd'), cfsqltype="CF_SQL_DATE"})>
            </cfif>

            <cfif structKeyExists(arguments.importData, "contactMeetingLocation") and arguments.importData.contactMeetingLocation neq "">
                <cfset sql &= ", ?">
                <cfarrayappend(params, {value=trim(arguments.importData.contactMeetingLocation), cfsqltype="CF_SQL_VARCHAR", maxlength=200})>
            </cfif>

            <cfif structKeyExists(arguments.importData, "birthday") and arguments.importData.birthday neq "">
                <cfset sql &= ", ?">
                <cfarrayappend(params, {value=dateformat(arguments.importData.birthday,'yyyy-mm-dd'), cfsqltype="CF_SQL_DATE"})>
            </cfif>

            <!--- Add remaining static fields --->
            <cfset sql &= ", ?, 'Pending', ?)">

            <!--- Static parameters --->
            <cfarrayappend(params, {value=trim(arguments.importData.website), cfsqltype="CF_SQL_VARCHAR", maxlength=200})>
            <cfarrayappend(params, {value=trim(arguments.importData.Notes), cfsqltype="CF_SQL_LONGVARCHAR"})>

            <!--- Execute query --->
            <cfquery name="insertQuery" datasource="abod">
                #sql#
                <cfqueryparam value="#params#" cfsqltype="CF_SQL_ARRAY">
            </cfquery> 

        </cftry>
        <cfcatch type="any">
            <cflog file="application" text="Error in INScontactsimport: #cfcatch.message#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>

</cfcomponent>
