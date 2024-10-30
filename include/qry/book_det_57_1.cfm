
<cftry>
    <cfset book_det = createObject("component", "services.AuditionRoleService").SELaudroles_23809(audroleid=#audroleid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in book_det_57_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
