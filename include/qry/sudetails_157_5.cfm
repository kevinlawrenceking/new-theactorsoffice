
<cftry>
    <cfset sudetails = createObject("component", "services.SystemService").getfusystems(new_systemid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in sudetails_157_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
