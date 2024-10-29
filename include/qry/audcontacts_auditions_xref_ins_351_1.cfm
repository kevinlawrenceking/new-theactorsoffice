
<cftry>
    <cfset variables.contactAuditionService = new "/services/ContactAuditionService.cfc"()>
    <cfset variables.contactAuditionService.updateAudContactsAuditionsXref(new_contactid=new_contactid, new_audprojectid=new_eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcontacts_auditions_xref_ins_351_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
