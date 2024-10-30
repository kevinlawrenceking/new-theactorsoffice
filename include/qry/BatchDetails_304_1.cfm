
<cftry>
    <cfset BatchDetails = createObject("component", "services.ContactService").DETcontactdetails_24340(idList=idlist)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in BatchDetails_304_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
