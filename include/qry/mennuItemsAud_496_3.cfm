
<cftry>
    <cfset mennuItemsaud = createObject("component", "/services/ComponentService").getpgcomps()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in mennuItemsaud_496_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
