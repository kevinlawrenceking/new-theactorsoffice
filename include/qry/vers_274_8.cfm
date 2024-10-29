
<cftry>
    <cfset vers = createObject("component", "services.TaoVersionService").getVersionData()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in vers_274_8.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
