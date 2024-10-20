
<cfset contactAuditionService = createObject("component", "/services/ContactAuditionService")>

<cftry>
    <cfquery name="selectMissingContacts" datasource="#application.dsn#">
        SELECT DISTINCT 
            x.contactid, 
            r.audprojectid
        FROM 
            eventcontactsxref x
        INNER JOIN 
            events e ON x.eventid = e.eventid
        INNER JOIN 
            audroles r ON r.audRoleID = e.audroleid
        LEFT JOIN 
            audcontacts_auditions_xref ax ON x.contactid = ax.contactid AND r.audprojectid = ax.audprojectid
        WHERE 
            ax.contactid IS NULL 
            AND x.contactid > 0 
            AND e.audstepid <> 5
    </cfquery>

    <cfloop query="selectMissingContacts">
        <cfset contactAuditionService.insertaudcontacts_auditions_xref(
            contactid=selectMissingContacts.contactid,
            audprojectid=selectMissingContacts.audprojectid,
            xrefNotes="Was missing - audition_check.cfm",
            isfollow=false
        )>
    </cfloop>
    
    <cfcatch type="any">
        <cflog text="[Error in addmissing_33_3.cfm]: #cfcatch.message# Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
