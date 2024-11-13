<cfset objService = createObject("component", "services.AuditionVocalTypeXRefService")>
<cfset objService.UPDaudvocaltypes_audition_xref(
    new_audRoleID = new_audRoleID,
    new_vocaltypeid = new_vocaltypeid,
    new_id = new_id
)>
<cfquery datasource="abod">
    UPDATE some_table SET isfetch = 1 WHERE some_condition
</cfquery>