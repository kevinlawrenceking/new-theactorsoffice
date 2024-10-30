
<cftry>
    <cfset findsystem = createObject("component", "services.SystemUserService").SELfusystemusers_24426(
        maint_contactid = maint_contactid,
        maint_systemid = maint_systemid
    )>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in findsystem_315_33.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching the system user. Please check the logs for more details.">
    </cfcatch>
</cftry>
