
<cftry>
    <cfset FindPage = createObject("component", "/services/PageService").getAppPageDetails(thispage=trim(thispage))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindPage_188_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
