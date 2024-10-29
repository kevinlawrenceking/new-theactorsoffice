
<cftry>
    <cfset findsubs = createObject("component", "services.AuditionRoleService").getAudRoles(userid=userid, submitsiteid=submitsiteid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findsubs_259_3.cfm]: #cfcatch.message#" />
        <cfthrow>
    </cfcatch>
</cftry>
