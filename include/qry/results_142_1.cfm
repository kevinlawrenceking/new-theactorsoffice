
<cftry>
    <cfset results = createObject("component", "/services/ContactItemService").getContactDetails(uploadid=uploadid)>
    <cfcatch type="any">
        <cflog type="error" text="[Error in results_142_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
