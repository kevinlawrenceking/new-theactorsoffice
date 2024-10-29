
<cftry>
    <cfset results = createObject("component", "services.ContactItemService").getActiveContacts(userid=#userid#, uploadid=#uploadid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_141_2.cfm]: #cfcatch.message# Query: #cfcatch.detail#" />
    </cfcatch>
</cftry>
