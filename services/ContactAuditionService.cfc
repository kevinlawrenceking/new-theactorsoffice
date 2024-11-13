<cfcomponent displayname="ContactAuditionService" hint="Handles operations for ContactAudition table" output="false"> 
<cffunction name="INSaudcontacts_auditions_xref" access="public" returntype="void">
    <cfargument name="contactId" type="numeric" required="true">
    <cfargument name="audStepId" type="numeric" required="true">

    <cfset var queryResult = "">
    
    <cfquery result="result"  name="queryResult">
        INSERT INTO audcontacts_auditions_xref (contactid, audprojectid, xrefnotes)
        SELECT DISTINCT x.contactid, r.audprojectid, 'Was missing - audition_check.cfm' AS xrefnotes
        FROM eventcontactsxref x
        INNER JOIN events e ON x.eventid = e.eventid
        INNER JOIN audroles r ON r.audRoleID = e.audroleid
        LEFT JOIN audcontacts_auditions_xref ax ON x.contactid = ax.contactid AND r.audprojectid = ax.audprojectid
        WHERE ax.contactid IS NULL 
        AND x.contactid = <cfquery result="result" param value="#arguments.contactId#" cfsqltype="CF_SQL_INTEGER">
        AND e.audstepid <> <cfquery result="result" param value="#arguments.audStepId#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="INSaudcontacts_auditions_xref_23780" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT IGNORE INTO audcontacts_auditions_xref 
        SET audprojectid = <cfquery result="result" param value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">, 
            xrefNotes = <cfquery result="result" param value="audition-add2.cfm" cfsqltype="CF_SQL_VARCHAR">, 
            contactid = <cfquery result="result" param value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cfscript>
function getAuditionContacts(required numeric audprojectid, required numeric new_contactid) {
    var result = "";
    result = queryExecute(
        "SELECT * FROM audcontacts_auditions_xref WHERE audprojectid = ? AND contactid = ?",
        [
            {value=arguments.audprojectid, cfsqltype="CF_SQL_INTEGER"},
            {value=arguments.new_contactid, cfsqltype="CF_SQL_INTEGER"}
        ]
    );
    return result;
}
</cfscript>

<cffunction name="DELaudcontacts_auditions_xref" access="public" returntype="void" hint="Deletes a contact from the audcontacts_auditions_xref table based on project and contact IDs.">
    <cfargument name="audprojectid" type="numeric" required="true" hint="The ID of the project." />
    <cfargument name="old_contactid" type="numeric" required="true" hint="The ID of the contact to be deleted." />

    <cfquery result="result" >
        DELETE FROM audcontacts_auditions_xref
        WHERE audprojectid = <cfquery result="result" param value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
        AND contactid = <cfquery result="result" param value="#arguments.old_contactid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="INSaudcontacts_auditions_xref_24059" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">

    <cfquery result="result"  name="qryInsert">
        INSERT IGNORE INTO audcontacts_auditions_xref 
        SET 
            audprojectid = <cfquery result="result" param value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">, 
            contactid = <cfquery result="result" param value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="DELaudcontacts_auditions_xref_24127" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    
    <cfquery result="result" >
        DELETE FROM audcontacts_auditions_xref 
        WHERE audprojectid = <cfquery result="result" param value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="INSaudcontacts_auditions_xref_24512" access="public" returntype="void">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_audprojectid" type="numeric" required="true">

    <cfquery result="result" >
        INSERT INTO audcontacts_auditions_xref (contactid, audprojectid)
        VALUES (
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_contactid#">,
            <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audprojectid#">
        )
    </cfquery>
</cffunction>

<cffunction name="UPDaudcontacts_auditions_xref" access="public" returntype="void">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_audprojectid" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE audcontacts_auditions_xref 
        SET 
            contactid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_contactid#">, 
            audprojectid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audprojectid#"> 
        WHERE 
            audprojectid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="0">
    </cfquery>
</cffunction>

<cffunction name="DELaudcontacts_auditions_xref_24545" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">

    <cfquery result="result" >
        DELETE FROM audcontacts_auditions_xref 
        WHERE audprojectid = <cfquery result="result" param value="#arguments.audprojectid#" cfsqltype="cf_sql_integer"> 
        AND xrefNotes = <cfquery result="result" param value="Referral" cfsqltype="cf_sql_varchar">
    </cfquery>
</cffunction>

<cffunction name="DELaudcontacts_auditions_xref_24548" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="deletecontactid" type="numeric" required="true">

        <cfquery result="result"  datasource="abod">
            DELETE FROM audcontacts_auditions_xref 
            WHERE audprojectid = <cfquery result="result" param value="#arguments.audprojectid#" cfsqltype="cf_sql_integer"> 
            AND contactid = <cfquery result="result" param value="#arguments.deletecontactid#" cfsqltype="cf_sql_integer">
        </cfquery>
        
</cffunction>
<cffunction name="INSaudcontacts_auditions_xref_24551" access="public" returntype="void">
    <cfargument name="audprojectid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">

        <cfquery result="result"  datasource="abod">
            INSERT IGNORE INTO audcontacts_auditions_xref 
            SET audprojectid = <cfquery result="result" param value="#arguments.audprojectid#" cfsqltype="cf_sql_integer">, 
                contactid = <cfquery result="result" param value="#arguments.contactid#" cfsqltype="cf_sql_integer">
        </cfquery>
        >
</cffunction></cfcomponent>
