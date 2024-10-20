
<cftry>
    <cfset xs = createObject("component", "/services/FUActionService").getvm_fuactions_tbl_fuactions(target_id_system)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in xs_283_5.cfm] " & cfcatch.message>
    </cfcatch>
</cftry>
