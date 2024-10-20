
<cftry>
    <cfset checkformaint = createObject("component", "services.SystemUserService").getvm_fusystemusers_fusystems(contactid=contactid, userid=userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in checkformaint_71_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
