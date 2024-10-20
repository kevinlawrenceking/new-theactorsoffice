
<cftry>
    <cfset Findtotal = createObject("component", "services.PanelUserService").getvm_pgpanels_user_sitetypes_user(select_userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Findtotal_318_9.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
