
<cftry>
    <cfset deletesystem = createObject("component", "/services/SystemUserService").updatefusystemusers(idlist, new_systemid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in deletesystem_104_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
