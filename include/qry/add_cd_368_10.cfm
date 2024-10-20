
<cftry>
    <cfset add_cd = createObject("component", "services.ContactAuditionService").insertaudcontacts_auditions_xref(
        contactid = cdcheck.contactid,
        audprojectid = cdcheck.audprojectid
    )>
    <cfcatch>
        <cflog text="[Error in add_cd_368_10.cfm]: #cfcatch.message# Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
