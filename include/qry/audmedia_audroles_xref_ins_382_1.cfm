
<cftry>
    <cfset result = createObject("component", "/services/AuditionMediaAudRolesXRefService").updateaudmedia_audroles_xref(
        new_mediaid = new_mediaid,
        new_audroleid = new_audroleid,
        new_mediaAudroleDescript = new_mediaAudroleDescript,
        new_isDeleted = new_isDeleted
    )>
    <cfset isfetch = 1>
    <!--- Additional code to update the database with isfetch = 1 can be added here --->
<cfcatch type="any">
    <cfset errorLog = "[Error in audmedia_audroles_xref_ins_382_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
