
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc" />

    <cfset results = contactItemService.getcontactitems({
        userid: "#userid#",
        uploadid: #uploadid#
    }) />

<cfcatch type="any">
    <cfset errorLog("[Error in results_141_2.cfm]: " & cfcatch.message) />
</cfcatch>
</cftry>
