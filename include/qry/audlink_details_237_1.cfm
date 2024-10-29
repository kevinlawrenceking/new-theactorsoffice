
<cftry>
    <cfset audlink_details = createObject("component", "services.AuditionLinkService").getAudLinksByLinkId(linkid=linkid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audlink_details_237_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
