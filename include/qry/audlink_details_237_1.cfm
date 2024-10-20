
<cftry>
    <cfset auditionLinkService = new "/services/AuditionLinkService.cfc"()>
    <cfset audlink_details = auditionLinkService.getaudlinks(filters={linkid=linkid})>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audlink_details_237_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
