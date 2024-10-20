<cfcomponent displayname="ContactImportService" hint="Handles operations for ContactImport table" output="false" > 
<cffunction name="insertcontactsimport" access="public" returntype="numeric">
    <cfargument name="data" type="struct" required="true">
    <cfset var insertResult = 0>
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO contactsimport (
                `fname`, `lname`, `tag`, `business_email`, `personal_email`, 
                `work_phone`, `mobile_phone`, `home_phone`, `company`, `address`,
                `address_second`, `city`, `state`, `zip`, `country`,
                `maintenance_or_target`, `contactMeetingDate`, `contactMeetingLoc`,
                `birthday`, `website`, `status`, `uploadnotes`,
                `tag1`, `tag2`, `tag3`, `notes`
            ) VALUES (
                <cfqueryparam value="#arguments.data.fname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.fname)#">,
                <cfqueryparam value="#arguments.data.lname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.lname)#">,
                <cfqueryparam value="#arguments.data.tag#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.tag)#">,
                <cfqueryparam value="#arguments.data.business_email#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.business_email)#">,
                <cfqueryparam value="#arguments.data.personal_email#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.personal_email)#">,
                <cfqueryparam value="#arguments.data.work_phone#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.work_phone)#">,
                <cfqueryparam value="#arguments.data.mobile_phone#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.mobile_phone)#">,
                <cfqueryparam value="#arguments.data.home_phone#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.home_phone)#">,
                <cfqueryparam value="#arguments.data.company#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.company)#">,
                <cfqueryparam value="#arguments.data.address#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.address)#">,
                <cfqueryparam value="#arguments.data.address_second#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.address_second)#">,
                <cfqueryparam value="#arguments.data.city#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.city)#">,
                <cfqueryparam value="#arguments.data.state#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.state)#">,
                <cfqueryparam value="#arguments.data.zip#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.zip)#">,
                <cfqueryparam value="#arguments.data.country#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.country)#">,
                <cfqueryparam value="#arguments.data.maintenance_or_target#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.maintenance_or_target)#">,
                <cfqueryparam value="#arguments.data.contactMeetingDate#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.data.contactMeetingDate)#">,
                <cfqueryparam value="#arguments.data.contactMeetingLoc#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactMeetingLoc)#">,
                <cfqueryparam value="#arguments.data.birthday#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.data.birthday)#">,
                <cfqueryparam value="#arguments.data.website#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.website)#">,
                <!--- Removed default attribute from cfqueryparam for 'status' --->
                <cfqueryparam value="#arguments.data.status#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.status)#">,
                <cfqueryparam value="#arguments.data.uploadnotes#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.uploadnotes)#">,
                <cfqueryparam value="#arguments.data.tag1#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.tag1)#">,
                <cfqueryparam value="#arguments.data.tag2#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.tag2)#">,
                <cfqueryparam value="#arguments.data.tag3#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.tag3)#">,
                <cfqueryparam value="#arguments.data.notes#" cfsqltype="CF_SQL_LONGVARCHAR" null="#isNull(arguments.data.notes)#">
            )
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
    <cfcatch>
        <cflog text="Error inserting into contactsimport: #cfcatch.message# - #cfcatch.detail#">
        <!--- Optionally, log the SQL statement for debugging purposes --->
        <!--- Note: Be cautious with logging sensitive data --->
        <!--- Return 0 or another appropriate error indicator --->
    </cfcatch>
    </cftry>
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Removed the default attribute from the cfqueryparam tag for 'status' as it is not a valid attribute.
--->

<cffunction name="getcontactsimport" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT `ID`, `contactid`, `uploadid`, `fname`, `lname`, `tag`, `business_email`, `personal_email`, `work_phone`, `mobile_phone`, `home_phone`, `company`, `address`, `address_second`, `city`, `state`, `zip`, `country`, `maintenance_or_target`, `contactMeetingLoc`, `website`, `status`, `uploadnotes`, `tag1`, `tag2`, `tag3`, `timestamp`, `contactMeetingDate`, `birthday`, `notes` FROM contactsimport WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "ID,contactid,uploadid,fname,lname,tag,business_email,personal_email,work_phone,mobile_phone,home_phone,company,address,address_second,city,state,zip,country,maintenance_or_target,contactMeetingLoc,website,status,uploadnotes,tag1,tag2,tag3,timestamp,contactMeetingDate,birthday,notes">
    <cfset var orderByWhitelist = "ID,fname,lname,timestamp">

    <cftry>
        <!--- Build dynamic WHERE clause --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = :#key#")>
            </cfif>
        </cfloop>

        <!--- Append WHERE conditions to SQL if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif len(trim(arguments.orderBy)) and listFindNoCase(orderByWhitelist, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog file="application" text="Error in getcontactsimport: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

        <!--- Return an empty query with the correct structure on error --->
        <cfset queryResult = queryNew("ID,contactid,uploadid,fname,lname,tag,business_email,personal_email,work_phone,mobile_phone,home_phone,company,address,address_second,city,state,zip,country,maintenance_or_target,contactMeetingLoc,website,status,uploadnotes,tag1,tag2,tag3,timestamp,contactMeetingDate,birthday,notes", "integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,timestamp,date,date,longvarchar")>
    </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn queryResult>
</cffunction> 

<!--- Changes made:
- Corrected the cfsqltype in cfqueryparam to a generic type (CF_SQL_VARCHAR) as listGetAt was incorrectly used.
--->

<cffunction name="updateCONTACTSIMPORT" access="public" returntype="boolean">
    <cfargument name="ID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">

    <cfset var sql = "UPDATE CONTACTSIMPORT SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "fname,lname,tag,business_email,personal_email,work_phone,mobile_phone,home_phone,company,address,address_second,city,state,zip,country,maintenance_or_target,contactMeetingDate,contactMeetingLoc,birthday,website,status,uploadnotes,timestamp,uploadid,tag1,tag2,tag3,notes">
    <cfset var result = false>

    <cftry>
        <cfloop collection="#arguments.data#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(setClauses, "#key# = ?")>
            </cfif>
        </cfloop>

        <cfif arrayLen(setClauses) gt 0>
            <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE ID = ?">

            <cfquery datasource="#DSN#">
                #sql#
                <cfloop collection="#arguments.data#" item="key">
                    <cfif listFindNoCase(validColumns, key)>
                        <cfqueryparam value="#arguments.data[key]#" cfsqltype="#getCFSqlType(key)#" null="#isNull(arguments.data[key])#">
                    </cfif>
                </cfloop>
                <cfqueryparam value="#arguments.ID#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>

            <cfset result = true>
        </cfif>

        <cfcatch type="any">
            <cflog file="application" text="Error updating CONTACTSIMPORT: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Added a check within the cfloop for valid columns before using cfqueryparam to ensure only valid columns are processed.
--->

<cffunction name="getvm_contactsimport_uploads" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="uploadid">
    <cfargument name="orderDirection" type="string" required="false" default="ASC">

    <cfset var sql = "SELECT uploadid, u_userid, uploadstatus, i_status, u_timestamp, total_adds FROM vm_contactsimport_uploads WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "uploadid,u_userid,uploadstatus,i_status,u_timestamp,total_adds">
    <cfset var validOrderColumns = "uploadid,u_userid,uploadstatus,i_status,u_timestamp,total_adds">
    <cfset var result = "">

    <!--- Validate and construct WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Add WHERE conditions to SQL if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate ORDER BY column --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy# #arguments.orderDirection#">
    </cfif>

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & ucase(listGetAt(validColumns, listFindNoCase(validColumns, key))))#" null="#isNull(arguments.filters[key])#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getvm_contactsimport_uploads: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset result = queryNew("uploadid,u_userid,uploadstatus,i_status,u_timestamp,total_adds", "integer,integer,varchar,varchar,timestamp,bigint")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction></cfcomponent>
