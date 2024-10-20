
<cftry>
    <cfset mennuItemsU = createObject("component", "/services/ComponentService").getpgcomps()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in mennuItemsU_496_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
