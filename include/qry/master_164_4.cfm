
<cftry>
    <cfset master = createObject("component", "/services/SiteTypeMasterService").getsitetypes_master(current_sitetypename)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in master_164_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
