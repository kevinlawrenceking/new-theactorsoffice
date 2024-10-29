
<cftry>
    <cfset findsystem = createObject("component", "services.SystemUserService").getUserByContactAndSystem(maint_contactid=maint_contactid, maint_systemid=maint_systemid)>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in findsystem_315_33.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while fetching system user.">
    </cfcatch>
</cftry>
