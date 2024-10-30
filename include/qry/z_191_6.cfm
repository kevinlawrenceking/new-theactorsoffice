
<cftry>
    <cfset z = createObject("component", "/services/AuditionProjectService").SELaudprojects_24016(userid=#userid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in z_191_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
