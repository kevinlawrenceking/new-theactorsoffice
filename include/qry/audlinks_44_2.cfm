
<cfset audlinks = "" />

<cftry>
    <cfset audlinkService = createObject("component", "services.AuditionLinkService") />
    <cfset audlinks = audlinkService.SELaudlinks(audroleid=audroleid) />

    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in audlinks_44_2.cfm]: #cfcatch.message#" />
        <cfset audlinks = queryNew("") />
    </cfcatch>
</cftry>
