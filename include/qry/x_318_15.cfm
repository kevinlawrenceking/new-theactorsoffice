
<cftry>
    <cfset x = createObject("component", "services.SiteLinksMasterService").getsitelinks_master()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_318_15.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
