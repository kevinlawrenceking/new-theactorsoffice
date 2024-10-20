
<cftry>
    <cfset sysAvail = createObject("component", "/services/SystemService").getvm_fusystems_fusystemusers(new_systemscope=new_systemscope, currentid=currentid, userid=session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in sysAvail_539_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
