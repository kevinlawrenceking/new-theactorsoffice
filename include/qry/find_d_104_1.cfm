
<cftry>
    <cfset find_d = createObject("component", "services.SystemUserService").getvm_fusystemusers_count(idlist, new_systemid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_d_104_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
