
<cftry>
    <cfset find_new = createObject("component", "/services/ContactAuditionService").getaudcontacts_auditions_xref(
        contactid = new_contactid,
        audprojectid = audprojectid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_new_277_3.cfm] #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
