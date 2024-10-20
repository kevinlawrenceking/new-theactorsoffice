
<cftry>
    <cfset result = createObject("component", "services.ContactAuditionService")
        .insertaudcontacts_auditions_xref(
            contactid=new_contactid,
            audprojectid=new_audprojectid
        )>
    <cfcatch>
        <cflog text="[Error in audcontacts_auditions_xref_ins_350_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
