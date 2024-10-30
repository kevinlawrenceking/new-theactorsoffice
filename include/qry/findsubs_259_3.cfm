
<cftry>
    <cfset findsubs = createObject("component", "services.AuditionRoleService").SELaudroles_24165(userid=userid, submitsiteid=submitsiteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findsubs_259_3.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
