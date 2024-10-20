
<cftry>
    <cfset results = createObject("component", "/services/BigBrotherService").getbigbrother()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in results_375_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
