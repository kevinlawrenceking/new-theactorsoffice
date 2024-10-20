
<cftry>
    <cfset result = createObject("component", "/services/AuditionMediaAudRolesXRefService").insertaudmedia_audroles_xref(
        mediaid = new_mediaid,
        audroleid = new_audroleid,
        mediaAudroleDescript = new_mediaAudroleDescript,
        isDeleted = new_isDeleted
    )>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery>
        UPDATE some_table SET isfetch = 1 WHERE some_condition
    </cfquery>
<cfcatch type="any">
    <cfset errorLog = "[Error in audmedia_audroles_xref_ins_381_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
