
<cftry>
    <cfset book_det = createObject("component", "services.AuditionRoleService").getAudRoleDetails(audroleid=#audroleid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in book_det_57_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
