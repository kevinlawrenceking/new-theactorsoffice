<cfcomponent displayname="ContactImportService" hint="Handles operations for ContactImport table" >

<cffunction name="DETcontactsimport" access="public" returntype="query" output="false">

    <cfargument name="uploadid" type="numeric" required="true">


    <cfquery name="result" >
        SELECT contactid
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
          AND status = <cfqueryparam cfsqltype="cf_sql_varchar" value="Added">
    </cfquery>
 --->
    <cfreturn result>
</cffunction>


<cffunction name="SELcontactsimport_24405" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" >
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
    <cfquery name="result" >
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

<cffunction name="SELcontactsimport_24409" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" >
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
        and status = 'Added'
        and business_email <> '' and business_email is not null
    </cfquery>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>

<cffunction name="SELcontactsimport_f" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" >
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
        and status = 'Added'
        and personal_email <> '' and personal_email is not null
    </cfquery>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>

<cffunction name="SELcontactsimport_g" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" >
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
        and status = 'Added'
        and work_phone <> '' and work_phone is not null
    </cfquery>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>

<cffunction name="SELcontactsimport_h" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" >
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
        and status = 'Added'
        and mobile_phone <> '' and mobile_phone is not null
    </cfquery>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>

<cffunction name="SELcontactsimport_i" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" >
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
        and status = 'Added'
        and home_phone <> '' and home_phone is not null
    </cfquery>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>

<cffunction name="SELcontactsimport_j" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" >
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
        and status = 'Added'
        and Company <> '' and Company is not null
    </cfquery>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>

<cffunction name="SELcontactsimport_u" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" >
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
        and status = 'Added'
        and website <> '' and website is not null
    </cfquery>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>

<cffunction name="SELcontactsimport_address" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" >
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
        and status = 'Added'
    </cfquery>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>

<cffunction name="SELcontactsimport_maints" access="public" returntype="query" output="false">
    <!--- Arguments --->
    <cfargument name="uploadid" type="numeric" required="true">

    <!--- Local variable to hold the query result --->
    <cfset var result = "">

    <!--- Query to fetch data with additional filters --->
    <cfquery name="result" >
        SELECT 
            ID, fname, lname, tag, business_email, personal_email, 
            work_phone, mobile_phone, home_phone, company, address, 
            address_second, city, state, zip, country, maintenance_or_target, 
            contactMeetingDate, contactMeetingLoc, birthday, website, status, 
            contactid, uploadnotes, timestamp, uploadid, tag1, tag2, tag3, notes
        FROM contactsimport
        WHERE uploadid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.uploadid#">
        and maintenance_or_target = 'Maintenance'
        and status = 'Added'
        and contactid is not null
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
    <cfquery name="result" >
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

    <cfdump var="#arguments.importdata#"><cfabort>
        <!--- Loop through the import data query starting from row 2 --->
        <cfloop query="#arguments.importdata#" startrow="2">
            <!--- Validate row data: Ensure FirstName is present --->
            <cfif len(trim(importdata.FirstName))>
                <!--- Optional fields dynamically added based on their presence --->
                <cfset var optionalFields = "" />
                <cfset var optionalValues = "" />

                <!--- Handle optional fields dynamically --->
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

                <cfset var sqlStatement = "">
<cfset sqlStatement = "
    INSERT INTO contactsimport (
        uploadid, fname, lname, tag1, tag2, tag3,
        business_email, personal_email, work_phone, 
        mobile_phone, home_phone, company, address, 
        address_second, city, state, zip, country,
        website, status, notes
        #optionalFields#
    )
    VALUES (
        #arguments.newuploadid#,
        '#trim(importdata.FirstName)#',
        '#trim(importdata.LastName)#',
        '#trim(importdata.Tag1)#',
        '#trim(importdata.Tag2)#',
        '#trim(importdata.Tag3)#',
        '#trim(importdata.BusinessEmail)#',
        '#trim(importdata.PersonalEmail)#',
        '#trim(importdata.WorkPhone)#',
        '#trim(importdata.MobilePhone)#',
        '#trim(importdata.HomePhone)#',
        '#trim(importdata.Company)#',
        '#trim(importdata.Address)#',
        '#trim(importdata.Address2)#',
        '#trim(importdata.City)#',
        '#trim(importdata.State)#',
        '#trim(importdata.Zip)#',
        '#trim(importdata.Country)#',
        '#trim(importdata.website)#',
        'Pending',
        '#trim(importdata.Notes)#'
        #optionalValues#
    )
">

<!--- Debug: Output the SQL query before execution --->
<cfoutput>
    <h3>Debugging SQL Statement</h3>
    <pre>#sqlStatement#</pre>
</cfoutput>

<!--- Abort after debugging if needed --->
<cfabort>


                <!--- Insert row into the database --->
                <cfquery name="insertContact" >
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
    <!--- Log the error details --->
    <cflog file="application" text="Error in INScontactsimport: #cfcatch.detail#">
    <cflog file="application" text="Stack Trace: #cfcatch.stackTrace#">

    <!--- Output detailed error information for debugging --->
    <cfoutput>
        <h3>Error Occurred in INScontactsimport</h3>
        <p><strong>Error Message:</strong> #cfcatch.message#</p>
        <p>optional: #optionalFields#<BR>#optionalvalues#</p>
        <p><strong>Detail:</strong> #cfcatch.detail#</p>
        <p><strong>Stack Trace:</strong></p>
        <pre>#cfcatch.stackTrace#</pre>
    </cfoutput>
    <cfabort>
</cfcatch>
</cftry>
</cffunction>



</cfcomponent>