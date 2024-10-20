
<cftry>
    <cfset add_cd = createObject("component", "/services/ContactAuditionService").insertaudcontacts_auditions_xref(contactid=CONTACTID, audprojectid=audprojectid)>
    <cfcatch>
        <cflog text="[Error in add_cd_202_7.cfm]: #cfcatch.message# Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
