
<cftry>
    <cfset contactAuditionService = createObject("component", "services.ContactAuditionService.cfc" />
    <cfset contactAuditionService.UPDaudcontacts_auditions_xref(
        new_contactid = new_contactid,
        new_audprojectid = new_eventid
    ) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcontacts_auditions_xref_ins_351_1.cfm]: #cfcatch.message#" />
        <cfthrow>
    </cfcatch>
</cftry>
