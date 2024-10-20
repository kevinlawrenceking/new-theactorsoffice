
<cftry>
    <cfset dateformats = createObject("component", "services.DateFormatService").getdateformats()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in dateformats_463_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
