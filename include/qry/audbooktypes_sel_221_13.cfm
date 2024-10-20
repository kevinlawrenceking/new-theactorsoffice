
<cftry>
    <cfset audbooktypes_sel = createObject("component", "/services/AuditionBookTypeService").getaudbooktypes()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audbooktypes_sel_221_13.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
