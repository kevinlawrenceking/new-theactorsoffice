
<cftry>
    <cfset variables.contactAuditionService = createObject("component", "services.ContactAuditionService")>
    <cfset variables.contactAuditionService.DELaudcontacts_auditions_xref(audprojectid=audprojectid, old_contactid=old_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in del_277_4.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while deleting the contact." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
