
<cftry>
    <cfset pageService = new services.PageService()>
    <cfset FindPage = pageService.SELpgpages_24003(thispage=trim(thispage))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindPage_188_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
