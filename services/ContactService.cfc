<cfcomponent displayname="ContactService" hint="Handles operations for Contact table" output="false"> 

<cffunction name="getContactUpdates" access="public" returntype="query">
    <cfargument name="dsn" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="compid" type="numeric" required="true">

    <cfquery name="updates" datasource="abod">
        SELECT 
            d.contactid,
            'Name' AS head1,
            'Last Update' AS head2,
            d.contactfullname AS col1,
            MAX(u.updatetimestamp) AS col2
        FROM 
            contactdetails d
        INNER JOIN 
            updatelog u 
            ON u.recid = d.contactid
        WHERE 
            d.contactStatus = 'Active' 
            AND d.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND u.userid = d.userid
            AND u.compid = <cfqueryparam value="#arguments.compid#" cfsqltype="CF_SQL_INTEGER">
        GROUP BY 
            d.contactfullname
    </cfquery>

    <cfreturn updates>
</cffunction>



<cffunction name="SELcontactdetails" access="public" returntype="query">
    <cfargument name="addDaysNoUniqueName" type="string" required="true">
    <cfargument name="newContactId" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT d.contactid
            FROM contactdetails d
            WHERE d.[#arguments.addDaysNoUniqueName#] = <cfqueryparam value="Y" cfsqltype="CF_SQL_CHAR">
            AND d.contactid = <cfqueryparam value="#arguments.newContactId#" cfsqltype="CF_SQL_INTEGER">
            LIMIT 1
        </cfquery>
        
        <cfcatch>
            <cflog file="application" text="Error in getContactId: #cfcatch.message# Query: #cfcatch.detail#">
            <cfset result = queryNew("contactid", "integer")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactdetails_23722" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM contactdetails d 
            WHERE recordname <> '' 
              AND userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY d.contactfullname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message#">
            <cfset result = queryNew("contactfullname")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactdetails_23727" access="public" returntype="query">
    <cfargument name="userid" required="true" type="numeric">
    <cfargument name="relationship" required="true" type="numeric">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM contactdetails
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND contactid = <cfqueryparam value="#arguments.relationship#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message# Query: SELECT * FROM contactdetails WHERE userid = ? AND contactid = ? Parameters: userid=#arguments.userid#, relationship=#arguments.relationship#">
            <cfthrow message="An error occurred while retrieving contact details.">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INScontactdetails" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactFullName" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO contactdetails (userid, contactFullName) 
            VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">, 
                <cfqueryparam value="#arguments.contactFullName#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error inserting contact details: #cfcatch.message#">
            <cfthrow message="Error inserting contact details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactdetails_23769" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="cdfullname" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO contactdetails (userid, contactFullName) 
            VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.cdfullname#" cfsqltype="CF_SQL_VARCHAR">
            );
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactDetails: #cfcatch.message# Query: INSERT INTO contactdetails (userid, contactFullName) VALUES (#arguments.userid#, '#arguments.cdfullname#');">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactdetails_23775" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactfullname" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO contactdetails (userid, contactfullname) 
            VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">, 
                <cfqueryparam value="#arguments.contactfullname#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error inserting contact details: #cfcatch.message#">
            <cfthrow message="Error inserting contact details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactdetails_23806" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT contactid, contactbirthday 
            FROM contactdetails 
            WHERE contactbirthday IS NOT NULL 
            AND contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message# Query: SELECT contactid, contactbirthday FROM contactdetails WHERE contactbirthday IS NOT NULL AND contactid = #arguments.contactid#">
            <cfset result = queryNew("contactid,contactbirthday", "integer,date")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDcontactdetails" access="public" returntype="void">
    <cfargument name="final_birthday" type="date" required="true">
    <cfargument name="New_contactid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE contactdetails 
            SET contactbirthday = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.final_birthday#" />
            WHERE contactid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.New_contactid#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating contact birthday: #cfcatch.message#" />
            <cflog file="application" text="Query Error Detail: #cfcatch.detail#" />
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDcontactdetails_23816" access="public" returntype="void">
    <cfargument name="uniquename" type="string" required="true">
    <cfargument name="contactid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE contactdetails
            SET #arguments.uniquename# = <cfqueryparam value="Y" cfsqltype="CF_SQL_CHAR">
            WHERE contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating contact details: #cfcatch.message# Query: #cfcatch.query#">
            <cfthrow message="An error occurred while updating contact details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactdetails_23839" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactfullname" type="string" default="Unknown">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO contactdetails (userid, contactfullname) 
            VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.contactfullname#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting contact details: #cfcatch.message#">
            <cfthrow message="An error occurred while inserting contact details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactdetails_23843" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="select_contactid" type="numeric" default="0">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT contactid, recordname 
            FROM contactdetails 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfif arguments.select_contactid neq 0>
                AND contactid = <cfqueryparam value="#arguments.select_contactid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            ORDER BY contactid
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message# Query: SELECT contactid, recordname FROM contactdetails WHERE userid = #arguments.userid# AND contactid = #arguments.select_contactid# ORDER BY contactid">
            <cfreturn queryNew("contactid,recordname", "integer,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="UPDcontactdetails_23861" access="public" returntype="void">
    <cfargument name="idList" type="array" required="true">

    <cfset var queryResult = "">
    <cfset var sql = "">
    <cfset var idParams = "">

    <cftry>
        <!--- Build the SQL query dynamically --->
        <cfset sql = "UPDATE contactdetails_tbl SET isdeleted = 1 WHERE contactid IN (">
        
        <!--- Loop through the idList to create parameterized placeholders --->
        <cfloop from="1" to="#arrayLen(arguments.idList)#" index="i">
            <cfif i gt 1>
                <cfset sql = sql & ", ">
            </cfif>
            <cfset sql = sql & "?">
        </cfloop>
        
        <cfset sql = sql & ")">

        <!--- Execute the query with parameterized inputs --->
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop array="#arguments.idList#" index="id">
                <cfqueryparam value="#id#" cfsqltype="CF_SQL_INTEGER">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog file="application" text="Error in updateContactDetails: #cfcatch.message#; SQL: #sql#; Parameters: #serializeJSON(arguments.idList)#"/>
        <!--- Re-throw the error to handle it at a higher level if needed --->
        <cfthrow message="Error executing updateContactDetails function." detail="#cfcatch.detail#"/>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactdetails_23888" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfargument name="idList" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                contactid AS new_contactid, 
                SUBSTRING_INDEX(contactfullname, ' ', 1) AS new_FirstName, 
                SUBSTRING(contactfullname, LENGTH(SUBSTRING_INDEX(contactfullname, ' ', 1)) + 2) AS new_LastName, 
                contactmeetingdate AS new_contactmeetingdate, 
                ContactMeetingLoc AS new_ContactMeetingLoc, 
                contactbirthday AS new_contactbirthday 
            FROM 
                contactdetails d
            WHERE 
                d.contactStatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active"> 
                AND d.userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userId#"> 
                AND d.contactid IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.idList#" list="true">)
        </cfquery>
        
        <cfcatch type="any">
            <cflog text="Error in getActiveContacts: #cfcatch.message#" type="error">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactdetails_23906" access="public" returntype="query">
    <cfargument name="searchTerm" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT DISTINCT contactfullname 
            FROM contactdetails 
            WHERE contactfullname <> '' 
            AND contactfullname IS NOT NULL 
            AND contactfullname <> 'NULL' 
            AND contactfullname <> ' ' 
            AND contactfullname LIKE <cfqueryparam value="#arguments.searchTerm#%" cfsqltype="cf_sql_varchar">
            
            UNION
            
            SELECT DISTINCT recordname AS contactfullname 
            FROM imdb 
            WHERE recordname <> '' 
            AND recordname IS NOT NULL 
            AND recordname <> 'NULL' 
            AND recordname <> ' ' 
            AND recordname LIKE <cfqueryparam value="#arguments.searchTerm#%" cfsqltype="cf_sql_varchar">
            
            ORDER BY contactfullname
            LIMIT 10
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactFullnames: #cfcatch.message#" />
            <cfthrow message="An error occurred while retrieving contact fullnames." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactdetails_23913" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT recordname 
            FROM contactdetails 
            WHERE contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactRecordName: #cfcatch.message# Query: SELECT recordname FROM contactdetails WHERE contactid = ? Parameters: #arguments.contactid#">
            <cfthrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cfscript>
function getContactRecordName(new_contactid) {
    // Validate input
    if (!isNumeric(new_contactid) || new_contactid == 0) {
        return queryNew("recordname", "varchar");
    }

    // Initialize the query result variable
    var result = "";

    // Try-catch block for error handling
    try {
        // Execute the query with parameterization
        result = queryExecute(
            "SELECT recordname FROM contactdetails WHERE contactid = ? AND contactid <> 0",
            [
                {value: new_contactid, cfsqltype: "CF_SQL_INTEGER"}
            ]
        );
    } catch (any e) {
        // Log the error details
        cflog(
            file="application",
            text="Error executing query in getContactRecordName: #e.message#"
        );
        // Return an empty query set on error
        result = queryNew("recordname", "varchar");
    }

    return result;
}
</cfscript>

<cffunction name="SELcontactdetails_23939" access="public" returntype="query">
    <cfargument name="addDaysNoUniqueName" type="string" required="true">
    <cfargument name="contactId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT d.contactid 
            FROM contactdetails d 
            WHERE d.#arguments.addDaysNoUniqueName# = <cfqueryparam value="Y" cfsqltype="CF_SQL_CHAR"> 
            AND d.contactid = <cfqueryparam value="#arguments.contactId#" cfsqltype="CF_SQL_INTEGER"> 
            LIMIT 1
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getContactId: #cfcatch.message#; Query: SELECT d.contactid FROM contactdetails d WHERE d.#arguments.addDaysNoUniqueName# = 'Y' AND d.contactid = #arguments.contactId# LIMIT 1;">
            <cfthrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INScontactdetails_24000" access="public" returntype="void">
    <cfargument name="userFirstName" type="string" required="true">
    <cfargument name="userLastName" type="string" required="true">
    <cfargument name="userId" type="numeric" required="true">

    <cfset var fullName = "#arguments.userFirstName# #arguments.userLastName#">

    <cftry>
        <cfquery datasource="abod" name="insertQuery">
            INSERT INTO contactdetails (ContactFullName, userid, user_yn)
            VALUES (
                <cfqueryparam value="#fullName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Y" cfsqltype="CF_SQL_CHAR">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error inserting contact details: #cfcatch.message#">
            <cfthrow message="Error inserting contact details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactdetails_24048" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactfullname" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO contactdetails_tbl (userid, contactfullname)
            VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#TRIM(arguments.contactfullname)#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactDetails: #cfcatch.message#; SQL: INSERT INTO contactdetails_tbl (userid, contactfullname) VALUES (#arguments.userid#, '#TRIM(arguments.contactfullname)#')">
            <cfthrow message="An error occurred while inserting contact details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactdetails_24069" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM contactdetails
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY contactfullname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message# Query: SELECT * FROM contactdetails WHERE userid = ? ORDER BY contactfullname Parameters: userid=#arguments.userid#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INScontactdetails_24070" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactFullName" type="string" required="true">
    <cfargument name="contactBirthday" type="date" required="false" default="">
    <cfargument name="referContactId" type="numeric" required="false" default="">
    <cfargument name="contactMeetingDate" type="date" required="false" default="">
    <cfargument name="contactMeetingLoc" type="string" required="true">
    <cfargument name="contactPronoun" type="string" required="true">

    <cfset var sql = "">
    <cfset var params = []>

    <cftry>
        <cfset sql = "INSERT INTO contactdetails (userid, contactfullname">
        
        <cfif len(trim(arguments.contactBirthday))>
            <cfset sql &= ", contactbirthday">
            <cfset arrayAppend(params, {value=arguments.contactBirthday, cfsqltype="CF_SQL_DATE"})>
        </cfif>

        <cfif len(trim(arguments.referContactId))>
            <cfset sql &= ", refer_contact_id">
            <cfset arrayAppend(params, {value=arguments.referContactId, cfsqltype="CF_SQL_INTEGER"})>
        </cfif>

        <cfif len(trim(arguments.contactMeetingDate))>
            <cfset sql &= ", contactmeetingdate">
            <cfset arrayAppend(params, {value=arguments.contactMeetingDate, cfsqltype="CF_SQL_DATE"})>
        </cfif>

        <cfset sql &= ", contactmeetingloc, contactPronoun) VALUES (?, ?">

        <!--- Add placeholders for optional parameters --->
        <cfif len(trim(arguments.contactBirthday))>
            <cfset sql &= ", ?">
        </cfif>

        <cfif len(trim(arguments.referContactId))>
            <cfset sql &= ", ?">
        </cfif>

        <cfif len(trim(arguments.contactMeetingDate))>
            <cfset sql &= ", ?">
        </cfif>

        <!--- Closing the SQL statement --->
        <cfset sql &= ", ?, ?)">

        <!--- Add mandatory parameters --->
        <cfset arrayAppend(params, {value=arguments.userid, cfsqltype="CF_SQL_INTEGER"})>
        <cfset arrayAppend(params, {value=arguments.contactFullName, cfsqltype="CF_SQL_VARCHAR"})>
        <cfset arrayAppend(params, {value=arguments.contactMeetingLoc, cfsqltype="CF_SQL_VARCHAR"})>
        <cfset arrayAppend(params, {value=arguments.contactPronoun, cfsqltype="CF_SQL_VARCHAR"})>

        <!--- Execute the query --->
        <cfquery datasource="#yourDataSource#" name="insertQuery">
            #sql#
            <cfdump var="#params#"> <!--- For debugging purposes --->
            <!--- Bind parameters dynamically --->
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="#cfcatch.message#" type="error">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETcontactdetails" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM contactdetails 
            WHERE contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message# Query: SELECT * FROM contactdetails WHERE contactid = #arguments.contactid#">
            <cfthrow message="An error occurred while retrieving contact details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="UPDcontactdetails_24202" access="public" returntype="void">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="contactfullname" type="string" required="true">
    <cfargument name="contactPronoun" type="string" required="true">
    <cfargument name="custom" type="string" required="false" default="">
    <cfargument name="contactbirthday" type="date" required="false">
    <cfargument name="contactmeetingdate" type="date" required="false">
    <cfargument name="contactmeetingloc" type="string" required="false" default="">
    <cfargument name="deleteitem" type="boolean" required="false" default=false>
    <cfargument name="refer_contact_id" type="numeric" required="false">

    <cftry>
        <cfquery datasource="#application.datasource#">
            UPDATE contactdetails 
            SET contactfullname = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.contactfullname)#">,
                contactPronoun = 
                    <cfif arguments.contactPronoun is "custom">
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.custom)#">
                    <cfelse>
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.contactPronoun)#">
                    </cfif>,
                contactbirthday = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.contactbirthday#" null="#IsNull(arguments.contactbirthday)#">,
                contactmeetingdate = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.contactmeetingdate#" null="#IsNull(arguments.contactmeetingdate)#">,
                contactmeetingloc = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.contactmeetingloc)#">
                <cfif arguments.deleteitem>
                    ,isdeleted = 1
                </cfif>
                <cfif Len(trim(arguments.refer_contact_id))>
                    ,refer_contact_id = <cfqueryparam value="#arguments.refer_contact_id#" cfsqltype="cf_sql_integer">
                </cfif>
            WHERE contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="cf_sql_integer">
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="[Error] Failed to update contact details. Error: #cfcatch.message# Query: UPDATE contactdetails SET ... WHERE contactid = #arguments.contactid#">
        <!--- Optionally rethrow or handle the error further --->
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactdetails_24263" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT contactid, recordname
            FROM contactdetails
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND recordname <> ''
            ORDER BY recordname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message#">
            <cfset result = queryNew("contactid,recordname")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DETcontactdetails_24264" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM contactdetails 
            WHERE contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message# Query: SELECT * FROM contactdetails WHERE contactid = #arguments.contactid#">
            <cfthrow message="Database error occurred while fetching contact details.">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactdetails_24293" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="referral" type="string" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM contactdetails 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND recordname = <cfqueryparam value="#arguments.referral#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INScontactdetails_24294" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactfullname" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO contactdetails (userid, contactfullname) 
            VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.contactfullname#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into contactdetails: #cfcatch.message#">
            <cflog file="application" text="Query Error Details: #cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETcontactdetails_24340" access="public" returntype="query">
    <cfargument name="idList" type="array" required="true">
    <cfset var result = "">
    
    <cfif arrayLen(arguments.idList) eq 0>
        <cfreturn queryNew("contactid,recordname")>
    </cfif>

    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT contactid, recordname
            FROM contactdetails d
            WHERE d.contactid IN (
                <cfloop list="#arguments.idList#" index="id">
                    <cfqueryparam value="#id#" cfsqltype="CF_SQL_INTEGER" />
                    <cfif id neq arrayLast(arguments.idList)>,</cfif>
                </cfloop>
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message# Query: SELECT contactid, recordname FROM contactdetails WHERE contactid IN (#arguments.idList#)">
            <cfreturn queryNew("contactid,recordname")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactdetails_24364" access="public" returntype="query">
    <cfargument name="cdfullname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM contactdetails 
            WHERE contactfullname = <cfqueryparam value="#arguments.cdfullname#" cfsqltype="CF_SQL_VARCHAR"> 
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message# Query: SELECT * FROM contactdetails WHERE contactfullname = ? AND userid = ? Parameters: #arguments.cdfullname#, #arguments.userid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactdetails_24397" access="public" returntype="query">
    <cfargument name="fname" type="string" required="true">
    <cfargument name="lname" type="string" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM contactdetails
            WHERE contactfullname = <cfqueryparam value="#arguments.fname# #arguments.lname#" cfsqltype="CF_SQL_VARCHAR">
            AND userid = <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INScontactdetails_24399" access="public" returntype="void">
    <cfargument name="x" type="struct" required="true">
    <cfset var queryStr = "">
    <cfset var valuesStr = "">
    <cfset var params = []>

    <cftry>
        <!--- Build the query string dynamically --->
        <cfset queryStr = "INSERT INTO contactdetails_tbl (contactfullname, userid">
        <cfset valuesStr = "VALUES (?, ?">

        <!--- Check optional fields and add them to the query --->
        <cfif structKeyExists(arguments.x, "contactmeetingDate") AND arguments.x.contactmeetingDate NEQ "">
            <cfset queryStr &= ", contactMeetingDate">
            <cfset valuesStr &= ", ?">
            <cfset arrayAppend(params, {value=arguments.x.contactmeetingDate, cfsqltype="CF_SQL_DATE"})>
        </cfif>

        <cfif structKeyExists(arguments.x, "contactMeetingLoc") AND arguments.x.contactMeetingLoc NEQ "">
            <cfset queryStr &= ", contactMeetingLoc">
            <cfset valuesStr &= ", ?">
            <cfset arrayAppend(params, {value=arguments.x.contactMeetingLoc, cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>

        <cfif structKeyExists(arguments.x, "birthday") AND arguments.x.birthday NEQ "">
            <cfset queryStr &= ", contactBirthday">
            <cfset valuesStr &= ", ?">
            <cfset arrayAppend(params, {value=arguments.x.birthday, cfsqltype="CF_SQL_DATE"})>
        </cfif>

        <!--- Close the SQL statement --->
        <cfset queryStr &= ") ">
        <cfset valuesStr &= ")">

        <!--- Execute the query --->
        <cfquery name="insertQuery" datasource="#application.datasource#">
            #queryStr# #valuesStr#
            <cfqueryparam value="#arguments.x.fname# #arguments.x.lname#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error details --->
        <cflog file="application" text="Error in insertContactDetails: #cfcatch.message# - Query: #queryStr# #valuesStr# - Params: #serializeJSON(params)#" type="error">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactdetails_24433" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfargument name="selectContactId" type="numeric" required="false" default="0">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT contactid, recordname
            FROM contactdetails
            WHERE userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
            <cfif arguments.selectContactId neq 0>
                AND contactid = <cfqueryparam value="#arguments.selectContactId#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            ORDER BY contactid
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while fetching contact details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactdetails_24483" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                d.contactid, 
                d.recordname 
            FROM 
                contactdetails d 
            WHERE 
                d.contactStatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR"> 
                AND d.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                d.contactfullname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveContactDetails: #cfcatch.message# Query: SELECT d.contactid, d.recordname FROM contactdetails WHERE contactStatus = 'Active' AND userid = #arguments.userid# ORDER BY contactfullname">
            <cfthrow message="An error occurred while retrieving contact details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactdetails_24514" access="public" returntype="query">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT DISTINCT 
                d.contactid, 
                d.recordname AS contactname, 
                d.contactStatus 
            FROM 
                contactdetails d 
            INNER JOIN 
                audcontacts_auditions_xref x ON x.contactid = d.contactid 
            WHERE 
                x.audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                d.recordname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error executing getContactDetailsByAudProjectID: #cfcatch.message#">
            <cfset result = queryNew("contactid,contactname,contactStatus")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactdetails_24515" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT DISTINCT 
                d.contactid, 
                d.recordname AS contactname, 
                d.contactStatus 
            FROM 
                contactdetails d 
            WHERE 
                d.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND d.contactid NOT IN (
                    SELECT contactid 
                    FROM audcontacts_auditions_xref 
                    WHERE audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
                )  
            ORDER BY 
                d.recordname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getFilteredContacts: #cfcatch.message#">
            <cfthrow message="An error occurred while retrieving contacts." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INScontactdetails_24537" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="cdfullname" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO contactdetails (userid, cdco) 
            VALUES (
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">, 
                <cfqueryparam value="#arguments.cdfullname#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactDetails: #cfcatch.message# Query: INSERT INTO contactdetails (userid, cdco) VALUES (?, ?)" />
            <cfthrow message="Database error occurred while inserting contact details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactdetails_24617" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                datediff(d.contactbirthday, curdate()) AS daysuntil, 
                d.contactfullname AS col1, 
                d.contactid, 
                DATE_FORMAT(d.contactbirthday, '%m-%d') AS col2 
            FROM 
                contactdetails d 
            WHERE 
                d.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
                AND d.contactbirthday IS NOT NULL 
                AND datediff(d.contactbirthday, curdate()) < 15 
            ORDER BY 
                datediff(d.contactbirthday)
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getUpcomingBirthdays: #cfcatch.message#">
            <cfreturn queryNew("daysuntil,col1,contactid,col2", "integer,varchar,integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DETcontactdetails_24624" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                d.contactid, 
                d.contacttitle, 
                d.recordname, 
                d.contactmeetingdate, 
                d.contactmeetingloc, 
                d.refer_contact_id, 
                d.contactFullName AS fullname, 
                d.contactfullname, 
                d.contactNickname, 
                d.contactID, 
                d.userID, 
                d.contactStatus, 
                d.contactCreationDate, 
                d.contactLastUpdated, 
                d.contactphoto, 
                d.contactBirthday, 
                d.contactPronoun, 
                d.newsletter_yn, 
                d.googlealert_yn, 
                d.socialmedia_yn
            FROM contactdetails d
            INNER JOIN taousers u ON u.userid = d.userid
            WHERE d.contactID = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
    <cfcatch>
        <cflog file="application" text="Error in getContactDetails: #cfcatch.message#">
        <cfreturn queryNew("")>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DETcontactdetails_24625" access="public" returntype="query">
    <cfargument name="refer_contact_id" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                d.contactid, 
                d.contacttitle, 
                d.recordname, 
                d.contactmeetingdate, 
                d.contactmeetingloc, 
                d.refer_contact_id, 
                d.contactFullName AS fullname, 
                d.contactNickname, 
                d.contactID, 
                d.userID, 
                d.contactStatus, 
                d.contactCreationDate, 
                d.contactLastUpdated, 
                d.contactphoto, 
                d.contactBirthday, 
                d.contactPronoun
            FROM contactdetails d
            INNER JOIN taousers u ON u.userid = d.userid
            WHERE d.contactID = <cfqueryparam value="#arguments.refer_contact_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch>
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="REScontactdetails" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                d.contactid, 
                d.recordname AS col1 
            FROM 
                contactdetails d 
            WHERE 
                d.contactstatus = 'Active' 
                AND d.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                d.contactfullname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveContacts: #cfcatch.message# Query: SELECT d.contactid, d.recordname AS col1 FROM contactdetails d WHERE d.contactstatus = 'Active' AND d.userid = ? ORDER BY d.contactfullname Parameters: userId=#arguments.userId#">
            <cfset result = queryNew("contactid,col1")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="DETcontactdetails_24629" access="public" returntype="query">
    <cfargument name="refer_contact_id" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                d.contactid, 
                d.contacttitle, 
                d.recordname, 
                d.contactmeetingdate, 
                d.contactmeetingloc, 
                d.refer_contact_id, 
                d.contactFullName AS fullname, 
                d.contactfullname, 
                d.contactNickname, 
                d.contactID, 
                d.userID, 
                d.contactStatus, 
                d.contactCreationDate, 
                d.contactLastUpdated, 
                d.contactphoto, 
                d.contactBirthday, 
                d.contactPronoun
            FROM contactdetails d
            INNER JOIN taousers u ON u.userid = d.userid
            WHERE d.contactID = <cfqueryparam value="#arguments.refer_contact_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getContactDetails: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactdetails_24674" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfargument name="compId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                d.contactid, 
                'Name' AS head1, 
                'Last Update' AS head2, 
                d.contactfullname AS col1, 
                MAX(u.updatetimestamp) AS col2 
            FROM 
                contactdetails d 
            INNER JOIN 
                updatelog u ON u.recid = d.contactid 
            WHERE 
                d.contactStatus = 'Active' 
                AND d.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
                AND u.userid = d.userid 
                AND u.compid = <cfqueryparam value="#arguments.compId#" cfsqltype="CF_SQL_INTEGER"> 
            GROUP BY 
                d.contactfullname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveContactDetails: #cfcatch.message# Query: #result.sql# Parameters: userId=#arguments.userId#, compId=#arguments.compId#">
            <cfreturn queryNew("contactid,head1,head2,col1,col2")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactdetails_24683" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    <cfset var result = "">
    
 
        <cfquery name="result" datasource="abod">
            SELECT 
                d.contactid, 
                d.recordname AS contactname, 
                d.contactStatus 
            FROM 
                contactdetails d 
            INNER JOIN 
                taousers u ON u.userid = d.userid 
            WHERE 
                u.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
                AND d.contactStatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR"> 
                AND d.contactid IN (
                    SELECT contactid 
                    FROM contactitems 
                    WHERE valuetext = <cfqueryparam value="My Team" cfsqltype="CF_SQL_VARCHAR"> 
                    AND valuecategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR">
                ) 
            ORDER BY 
                d.contactfullname
        </cfquery>


    <cfreturn result>
</cffunction>
<cffunction name="DETcontactdetails_24685" access="public" returntype="query">
    <cfargument name="rcontactid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                d.contactid, 
                d.contacttitle, 
                d.recordname, 
                d.contactmeetingdate, 
                d.contactmeetingloc, 
                d.refer_contact_id, 
                d.contactFullName AS fullname, 
                d.contactNickname, 
                d.contactID, 
                d.userID, 
                d.contactStatus, 
                d.contactCreationDate, 
                d.contactLastUpdated, 
                d.contactphoto, 
                d.contactBirthday, 
                d.contactPronoun, 
                d.newsletter_yn, 
                d.googlealert_yn, 
                d.socialmedia_yn
            FROM contactdetails d
            INNER JOIN taousers u ON u.userid = d.userid
            WHERE d.contactID = <cfqueryparam value="#arguments.rcontactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactDetails: #cfcatch.message# Query: SELECT ... WHERE contactID = #arguments.rcontactid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
