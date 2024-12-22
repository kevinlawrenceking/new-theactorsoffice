<cfcomponent displayname="ContactImportService" hint="Handles operations for ContactImport table" >

<cffunction name="SELcontactsimport_24405" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" datasource="#application.dsn#">
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
          AND status = <cfqueryparam cfsqltype="cf_sql_varchar" value="Added">
          AND tag2 <> ''
          AND tag2 IS NOT NULL
    </cfquery>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>

<cffunction name="SELcontactsimport_24407" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" datasource="#application.dsn#">
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
          AND status = <cfqueryparam cfsqltype="cf_sql_varchar" value="Added">
          AND tag3 <> ''
          AND tag3 IS NOT NULL
    </cfquery>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>



<cffunction name="selContactsImport" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <cfquery name="result" >
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
    </cfquery>
>
    <cfreturn result>
</cffunction>

<cffunction name="SELcontactsimport_24403" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" datasource="#application.dsn#">
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
          AND status = <cfqueryparam cfsqltype="cf_sql_varchar" value="Added">
          AND tag1 <> ''
          AND tag1 IS NOT NULL
    </cfquery>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>



<cffunction output="false" name="getImportsByUserID" access="public" returntype="query"  hint="Retrieve import data for a specific user.">
        <cfargument name="userid" type="numeric" required="true" hint="The ID of the user to fetch import data for.">

<cfquery result="result" name="imports">
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

<cfreturn imports>
    </cffunction>

<cffunction output="false" name="SELcontactsimport_24668" access="public" returntype="query">
        <cfargument name="userid" type="numeric" required="true">

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
                u.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND u.isdeleted = 0
            GROUP BY 
                u.uploadid, u.timestamp, u.userid, u.uploadstatus, i.status
        </cfquery>

<cfreturn result>
    </cffunction>

<cffunction output="false" name="INScontactsimport" access="public" returntype="numeric">
    <!--- Arguments --->
    <cfargument name="importdata" type="query" required="true">
    <cfargument name="newuploadid" type="numeric" required="true">

    <!--- Local variables --->
    <cfset var rowCount = 0>

    <cftry>
        <!--- Loop through the import data query starting from row 2 --->
        <cfloop query="#arguments.importdata#" startrow="2">
            <!--- Validate row data: Ensure FirstName is present --->
            <cfif len(trim(importdata.FirstName))>
                <!--- Build the dynamic query for optional fields --->
                <cfset var optionalFields = "">
                <cfset var optionalValues = "">
                
                <cfif len(trim(importdata.contactMeetingDate))>
                    <cfset optionalFields &= ", contactMeetingDate">
                    <cfset optionalValues &= ", <cfqueryparam cfsqltype='cf_sql_date' value='#dateformat(importdata.contactMeetingDate, "yyyy-mm-dd")#'>">
                </cfif>
                
                <cfif len(trim(importdata.contactMeetingLocation))>
                    <cfset optionalFields &= ", contactMeetingLoc">
                    <cfset optionalValues &= ", <cfqueryparam cfsqltype='cf_sql_varchar' maxlength='200' value='#trim(importdata.contactMeetingLocation)#'>">
                </cfif>
                
                <cfif len(trim(importdata.birthday))>
                    <cfset optionalFields &= ", birthday">
                    <cfset optionalValues &= ", <cfqueryparam cfsqltype='cf_sql_date' value='#dateformat(importdata.birthday, "yyyy-mm-dd")#'>">
                </cfif>

                <!--- Insert row into the database --->
                <cfquery name="insertContact">
                    INSERT INTO contactsimport (
                        uploadid, fname, lname, tag1, tag2, tag3,
                        business_email, personal_email, work_phone, 
                        mobile_phone, home_phone, company, address, 
                        address_second, city, state, zip, country,
                        website, status, notes
                        #optionalFields#
                    )
                    VALUES (
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.newuploadid#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.FirstName)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.LastName)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.Tag1)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.Tag2)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.Tag3)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.BusinessEmail)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.PersonalEmail)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.WorkPhone)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.MobilePhone)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.HomePhone)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="200" value="#trim(importdata.Company)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="200" value="#trim(importdata.Address)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.Address2)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.City)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.State)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.Zip)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(importdata.Country)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="200" value="#trim(importdata.website)#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="Pending">,
                        <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(importdata.Notes)#">
                        #optionalValues#
                    )
                </cfquery>
                
                <!--- Increment the row count --->
                <cfset rowCount++>
            </cfif>
        </cfloop>
        
        <!--- Return the number of successfully inserted rows --->
        <cfreturn rowCount>
        
    <cfcatch type="any">
        <!--- Log the error and return 0 --->
        <cflog file="application" text="Error in INScontactsimport: #cfcatch.message#">
        <cfreturn 0>
    </cfcatch>
    </cftry>
</cffunction>


</cfcomponent>