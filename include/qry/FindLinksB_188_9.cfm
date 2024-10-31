
<cftry>
    <cfset FindLinksB = createObject("component", "services.PageAppLinkService").SELpgapplinks_24006(pgid=findpage.pgid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in FindLinksB_188_9.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
