
<cftry>
    <cfset dateformats = createObject("component", "services.DateFormatService").SELdateformats()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in dateformats_463_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
