
<cftry>
    <cfset reldetails = createObject("component", "services.SystemUserService").getfusystemusers(suid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in reldetails_271_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
