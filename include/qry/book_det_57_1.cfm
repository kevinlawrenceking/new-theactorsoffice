
<cftry>
    <cfset book_det = createObject("component", "/services/AuditionRoleService").getvm_audroles_projects_paycycles(audroleid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in book_det_57_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
