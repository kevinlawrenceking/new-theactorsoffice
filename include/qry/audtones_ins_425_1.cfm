
<cftry>
    <cfset result = createObject("component", "services.AuditionTonesService").insertaudtones(
        tone = new_tone,
        audCatid = new_audCatid,
        isDeleted = new_isDeleted
    )>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery>
        UPDATE some_table SET isfetch = 1 WHERE some_condition
    </cfquery>
<cfcatch type="any">
    <cfset errorLog = "[Error in audtones_ins_425_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
