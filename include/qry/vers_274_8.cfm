
<cftry>
    <cfset vers = createObject("component", "services.TaoVersionService").gettaoversions()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in vers_274_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
