
<cftry>
    <cfset variables.contactAuditionService = createObject("component", "services.ContactAuditionService")>
    <cfset variables.contactAuditionService.INSaudcontacts_auditions_xref_24512(
        new_contactid=new_contactid,
        new_audprojectid=new_audprojectid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcontacts_auditions_xref_ins_350_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error calling INSaudcontacts_auditions_xref_24512." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
