<cfcomponent displayname="ContactAuditionService" hint="Handles operations for ContactAudition table" output="false"> 
<cffunction name="INSaudcontacts_auditions_xref" access="public" returntype="void">
    <cfargument name="contactId" type="numeric" required="true">
    <cfargument name="audStepId" type="numeric" required="true">

    <cfset var queryResult = "">
    
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            INSERT INTO audcontacts_auditions_xref (contactid, audprojectid, xrefnotes)
            SELECT DISTINCT x.contactid, r.audprojectid, 'Was missing - audition_check.cfm' AS xrefnotes
            FROM eventcontactsxref x
            INNER JOIN events e ON x.eventid = e.eventid
            INNER JOIN audroles r ON r.audRoleID = e.audroleid
            LEFT JOIN audcontacts_auditions_xref ax ON x.contactid = ax.contactid AND r.audprojectid = ax.audprojectid
            WHERE ax.contactid IS NULL 
            AND x.contactid = <cfqueryparam value="#arguments.contactId#" cfsqltype="CF_SQL_INTEGER">
            AND e.audstepid <> <cfqueryparam value="#arguments.audStepId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <!--- Handle successful query execution if necessary --->
        
    <cfcatch type="any">
        <cflog file="errorLog" text="Error in insertAuditionXref: #cfcatch.message# Query: #cfcatch.Detail#">
        <!--- Additional error handling logic --->
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSaudcontacts_auditions_xref_23780" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT IGNORE INTO audcontacts_auditions_xref 
            SET audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">, 
                xrefNotes = <cfqueryparam value="audition-add2.cfm" cfsqltype="CF_SQL_VARCHAR">, 
                contactid = <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in insertAuditionContact: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting audition contact." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cfscript>
function getAuditionContacts(required numeric audprojectid, required numeric new_contactid) {
    var result = "";
    try {
        result = queryExecute(
            "SELECT * FROM audcontacts_auditions_xref WHERE audprojectid = ? AND contactid = ?",
            [
                {value=arguments.audprojectid, cfsqltype="CF_SQL_INTEGER"},
                {value=arguments.new_contactid, cfsqltype="CF_SQL_INTEGER"}
            ]
        );
    } catch (any e) {
        cflog(type="error", text="Error executing query in getAuditionContacts: #e.message#");
        result = queryNew(""); // Return an empty query set on error
    }
    return result;
}
</cfscript>

<cffunction name="DELaudcontacts_auditions_xref" access="public" returntype="void" hint="Deletes a contact from the audcontacts_auditions_xref table based on project and contact IDs.">
    <cfargument name="audprojectid" type="numeric" required="true" hint="The ID of the project." />
    <cfargument name="old_contactid" type="numeric" required="true" hint="The ID of the contact to be deleted." />

    <cftry>
        <cfquery datasource="abod">
            DELETE FROM audcontacts_auditions_xref
            WHERE audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
            AND contactid = <cfqueryparam value="#arguments.old_contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error deleting contact: #cfcatch.message# Query: DELETE FROM audcontacts_auditions_xref WHERE audprojectid = #arguments.audprojectid# AND contactid = #arguments.old_contactid#">
            <cfthrow message="An error occurred while deleting the contact." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSaudcontacts_auditions_xref_24059" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">

    <cftry>
        <cfquery name="qryInsert" datasource="abod">
            INSERT IGNORE INTO audcontacts_auditions_xref 
            SET 
                audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">, 
                contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch>
            <cflog file="application" type="error" text="Error inserting into audcontacts_auditions_xref: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DELaudcontacts_auditions_xref_24127" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            DELETE FROM audcontacts_auditions_xref 
            WHERE audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in deleteAudcontactsAuditionsXref: #cfcatch.message#">
            <cflog file="application" text="Query: DELETE FROM audcontacts_auditions_xref WHERE audprojectid = #arguments.audprojectid#">
            <cflog file="application" text="Error Detail: #cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSaudcontacts_auditions_xref_24512" access="public" returntype="void">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_audprojectid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audcontacts_auditions_xref (contactid, audprojectid)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_contactid#" null="#NOT len(trim(arguments.new_contactid))#">,
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audprojectid#" null="#NOT len(trim(arguments.new_audprojectid))#">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAuditionContact: #cfcatch.message# Query: INSERT INTO audcontacts_auditions_xref (contactid, audprojectid) VALUES (#arguments.new_contactid#, #arguments.new_audprojectid#)">
            <cfthrow message="Error inserting audition contact." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudcontacts_auditions_xref" access="public" returntype="void">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_audprojectid" type="numeric" required="true">
    <cftry>
        <cfquery datasource="abod">
            UPDATE audcontacts_auditions_xref 
            SET 
                contactid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_contactid#" null="#NOT len(trim(arguments.new_contactid))#">, 
                audprojectid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audprojectid#" null="#NOT len(trim(arguments.new_audprojectid))#"> 
            WHERE 
                audprojectid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="0">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating audcontacts_auditions_xref: #cfcatch.message#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DELaudcontacts_auditions_xref_24545" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            DELETE FROM audcontacts_auditions_xref 
            WHERE audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="cf_sql_integer"> 
            AND xrefNotes = <cfqueryparam value="Referral" cfsqltype="cf_sql_varchar">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in deleteReferralAuditions: #cfcatch.message# Query: DELETE FROM audcontacts_auditions_xref WHERE audprojectid = #arguments.audprojectid# AND xrefNotes = 'Referral';">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="DELaudcontacts_auditions_xref_24548" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="deletecontactid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            DELETE FROM audcontacts_auditions_xref 
            WHERE audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="cf_sql_integer"> 
            AND contactid = <cfqueryparam value="#arguments.deletecontactid#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in deleteAuditionContact: #cfcatch.message# Query: DELETE FROM audcontacts_auditions_xref WHERE audprojectid = #arguments.audprojectid# AND contactid = #arguments.deletecontactid#">
            <cfthrow message="Error executing query in deleteAuditionContact." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSaudcontacts_auditions_xref_24551" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT IGNORE INTO audcontacts_auditions_xref 
            SET audprojectid = <cfqueryparam value="#arguments.audprojectid#" cfsqltype="cf_sql_integer">, 
                contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudContactAuditionXref: #cfcatch.message#">
            <cfthrow message="Database operation failed." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
