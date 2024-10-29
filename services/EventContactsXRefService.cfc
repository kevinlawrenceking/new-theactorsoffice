<cfcomponent displayname="EventContactsXRefService" hint="Handles operations for EventContactsXRef table" output="false"> 
<cffunction name="insertEventContact" access="public" returntype="void">
    <cfargument name="new_eventid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO eventcontactsxref (eventid, contactid)
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_eventid#"/>,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_contactid#"/>
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertEventContact: #cfcatch.message#" />
            <cfrethrow />
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getEventContacts" access="public" returntype="query">
    <cfargument name="ContactID" type="numeric" required="true">
    <cfargument name="EventID" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM eventcontactsxref 
            WHERE contactID = <cfqueryparam value="#arguments.ContactID#" cfsqltype="CF_SQL_INTEGER"> 
            AND eventid = <cfqueryparam value="#arguments.EventID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventContacts: #cfcatch.message#; Query: SELECT * FROM eventcontactsxref WHERE contactID = #arguments.ContactID# AND eventid = #arguments.EventID#;">
            <cfthrow message="An error occurred while retrieving event contacts." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="updateEventContactIsDeleted" access="public" returntype="void">
    <cfargument name="eventid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            UPDATE eventcontactsxref 
            SET isdeleted = 1 
            WHERE eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating eventcontactsxref: #cfcatch.message#; Query: UPDATE eventcontactsxref SET isdeleted = 1 WHERE eventid = #arguments.eventid#">
            <cfthrow message="An error occurred while updating the event contact." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertEventContact" access="public" returntype="void">
    <cfargument name="eventid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO eventcontactsxref (eventid, contactid)
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventid#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_contactid#" />
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" type="error" text="Error inserting event contact: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting event contact." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getEventContacts" access="public" returntype="query">
    <cfargument name="eventId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM eventcontactsxref
            WHERE eventid = <cfqueryparam value="#arguments.eventId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventContacts: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertEventContactsXref" access="public" returntype="void">
    <cfargument name="audProjectID" type="numeric" required="true">
    <cfargument name="audStepID" type="numeric" required="true">
    
    <cftry>
        <cfquery name="qryInsertEventContactsXref" datasource="yourDataSource">
            INSERT INTO eventcontactsxref (eventid, contactid)
            SELECT DISTINCT e.eventid, c.contactid
            FROM audprojects p
            INNER JOIN audcontacts_auditions_xref ax ON ax.audprojectid = p.audprojectid
            INNER JOIN contactdetails c ON c.contactid = ax.contactid
            INNER JOIN audroles r ON r.audprojectID = p.audprojectid
            INNER JOIN events e ON e.audRoleID = r.audroleid
            LEFT JOIN eventcontactsxref ecx ON ecx.eventid = e.eventid AND ecx.contactid = c.contactid
            WHERE p.isdeleted = 0 
              AND c.IsDeleted = 0 
              AND e.isdeleted = 0 
              AND r.isdeleted = 0 
              AND e.audstepid <> <cfqueryparam value="#arguments.audStepID#" cfsqltype="CF_SQL_INTEGER">
              AND ecx.eventid IS NULL;
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertEventContactsXref: #cfcatch.message#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="deleteInvalidEventContacts" access="public" returntype="void">
    <cfargument name="eventIds" type="array" required="true">
    
    <cfset var local = {}>

    <cftry>
        <cfif arrayLen(arguments.eventIds) eq 0>
            <!--- Return early if no event IDs are provided --->
            <cfreturn>
        </cfif>

        <cfquery name="deleteQuery" datasource="abod">
            DELETE FROM eventcontactsxref 
            WHERE eventid NOT IN (
                SELECT eventid FROM events
            )
            AND eventid NOT IN (
                <cfloop array="#arguments.eventIds#" index="eventId">
                    <cfqueryparam value="#eventId#" cfsqltype="CF_SQL_INTEGER" list="true">
                </cfloop>
            )
        </cfquery>
        
        <!--- Log successful execution --->
        <cflog text="Successfully executed deleteInvalidEventContacts function." type="information">

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog text="Error in deleteInvalidEventContacts: #cfcatch.message# - #cfcatch.detail#" type="error">
    </cfcatch>
    </cftry>
</cffunction>
<cfscript>
function deleteEventContactsXref(required numeric audStepId) {
    var result = {};
    try {
        // Validate input
        if (!isNumeric(arguments.audStepId)) {
            throw("Invalid input: audStepId must be numeric.");
        }

        // Define the query
        var sql = "
            DELETE FROM eventcontactsxref 
            WHERE eventid IN (
                SELECT eventid 
                FROM events 
                WHERE audstepid = ?
            )
        ";

        // Execute the query with parameterization
        result = queryExecute(
            sql,
            [
                {value=arguments.audStepId, cfsqltype="CF_SQL_INTEGER"}
            ]
        );
    } catch (any e) {
        // Log error details
        cflog(
            text="Error in deleteEventContactsXref: " & e.message & ", SQL: " & sql,
            file="application",
            type="error"
        );
        
        // Return a structured error response
        result = {success=false, message=e.message};
    }
    
    return result;
}
</cfscript>

<cffunction name="getEventContactsXref" access="public" returntype="query">
    <cfargument name="eventNumber" type="numeric" required="true">
    <cfargument name="contactID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM eventcontactsxref 
            WHERE eventid = <cfqueryparam value="#arguments.eventNumber#" cfsqltype="cf_sql_integer"> 
              AND contactid = <cfqueryparam value="#arguments.contactID#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventContactsXref: #cfcatch.message# - Query: SELECT * FROM eventcontactsxref WHERE eventid = ? AND contactid = ?">
            <cfthrow message="An error occurred while retrieving event contacts." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertEventContact" access="public" returntype="void">
    <cfargument name="eventNumber" type="numeric" required="true">
    <cfargument name="contactID" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT IGNORE INTO eventcontactsxref (eventid, contactid)
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eventNumber#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contactID#" />
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertEventContact: #cfcatch.message#">
            <cflog file="application" text="Query: INSERT IGNORE INTO eventcontactsxref (eventid, contactid) VALUES (?, ?)">
            <cflog file="application" text="Parameters: eventNumber=#arguments.eventNumber#, contactID=#arguments.contactID#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getEventContacts" access="public" returntype="query">
    <cfargument name="eventid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM eventcontactsxref
            WHERE eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventContacts: #cfcatch.message# - Query: SELECT * FROM eventcontactsxref WHERE eventid = #arguments.eventid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getEventContacts" access="public" returntype="query">
    <cfargument name="eventid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM eventcontactsxref x
            INNER JOIN contactdetails c ON x.contactid = c.contactid
            WHERE x.eventid = <cfqueryparam value="#arguments.eventid#" cfsqltype="CF_SQL_INTEGER" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getEventContacts: #cfcatch.message#; SQL: #cfcatch.sql#; Data: #arguments.eventid#" type="error">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="insertEventContact" access="public" returntype="void">
    <cfargument name="new_eventid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO eventcontactsxref (eventid, contactid)
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_eventid#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_contactid#" />
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertEventContact: #cfcatch.message# Query: INSERT INTO eventcontactsxref (eventid, contactid) VALUES (#arguments.new_eventid#, #arguments.new_contactid#)" type="error">
            <cfthrow message="Database error occurred while inserting event contact." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateEventContacts" access="public" returntype="void">
    <cfargument name="deletecontactid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE eventcontactsxref_tbl x
            INNER JOIN events e ON x.eventid = e.eventid
            INNER JOIN audroles r ON r.audRoleID = e.audroleid
            INNER JOIN audprojects p ON r.audprojectid = p.audprojectid
            SET x.isdeleted = 1
            WHERE x.contactid = <cfqueryparam value="#arguments.deletecontactid#" cfsqltype="cf_sql_integer">
            AND p.audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in updateEventContacts: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while updating event contacts." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
