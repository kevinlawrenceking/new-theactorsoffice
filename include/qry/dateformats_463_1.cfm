
<cftry>
    <cfset dateformatsService = createObject("component", "services.DateFormatService")>
    <cfset dateformats = dateformatsService.getDateFormats()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in dateformats_463_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
