
<cftry>
    <cfset pageService = new "/services/PageService.cfc"()>
    <cfset FindPage = pageService.getpgpages(trim(thispage))>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindPage_188_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
