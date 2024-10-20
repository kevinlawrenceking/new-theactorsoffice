
<cftry>
    <cfset mennuItemsAud = createObject("component", "/services/ComponentService").getpgcomps()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in mennuItemsAud_496_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
