
<cftry>
    <cfset FindFields = createObject("component", "services.PageService").getpgpages(trim(thispage))>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindFields_188_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
