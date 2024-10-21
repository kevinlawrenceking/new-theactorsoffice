
<cftry>
    <cfset mennuItemsU = createObject("component", "/services/ComponentService").getpgcomps()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in menuitems.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
