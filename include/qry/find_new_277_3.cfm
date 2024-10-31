
<cftry>
    <cfset find_new = createObject("component", "services.ContactAuditionService").getAuditionContacts(audprojectid=audprojectid, new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog type="error" text="[Error in find_new_277_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
