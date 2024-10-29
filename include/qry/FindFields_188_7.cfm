
<cftry>
    <cfset FindFields = createObject("component", "/services/PageService").getDynamicQueryResults(thispage=trim(thispage))>
    <cfcatch>
        <cflog file="errorLog" text="[Error in FindFields_188_7.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
