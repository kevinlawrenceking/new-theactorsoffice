
<cftry>
    <cfset findsubs = createObject("component", "/services/AuditionRoleService").getaudroles(userid=userid, submitsiteid=submitsiteid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findsubs_259_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
