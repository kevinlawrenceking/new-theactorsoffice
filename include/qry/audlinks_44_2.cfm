
<cftry>
    <cfset audlinksService = createObject("component", "services.AuditionLinkService")>
    <cfset filters = {audroleid = audroleid}>
    <cfset audlinks = audlinksService.getaudlinks(filters)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audlinks_44_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
