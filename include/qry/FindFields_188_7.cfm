
<cftry>
    <cfset FindFields = createObject("component", "services.PageService").SELpgpages_24004(thispage=trim(thispage))>
    <cfcatch>
        <cflog file="errorLog" text="[Error in FindFields_188_7.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
