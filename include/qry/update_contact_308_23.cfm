
<cftry>
    <cfset result = createObject("component", "services.AuditionImportService").updateauditionsimport(
        ID = x.id,
        data = {
            status = new_status,
            audprojectid = new_audprojectid
        }
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_contact_308_23.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
