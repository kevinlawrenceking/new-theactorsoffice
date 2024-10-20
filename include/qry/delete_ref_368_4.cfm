
<cftry>
    <cfset var contactAuditionService = createObject("component", "/services/ContactAuditionService")>
    <cfset var deleteResult = contactAuditionService.deleteaudcontacts_auditions_xref(contactid=contactid, audprojectid=audprojectid)>
    <cfif not deleteResult>
        <cflog file="errorLog" type="error" text="[Error in delete_ref_368_4.cfm]: Failed to delete records.">
    </cfif>
<cfcatch>
    <cflog file="errorLog" type="error" text="[Error in delete_ref_368_4.cfm]: #cfcatch.message# Details: #cfcatch.detail#">
</cfcatch>
</cftry>
