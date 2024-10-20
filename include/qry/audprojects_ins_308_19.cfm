
<cftry>
    <cfset result = createObject("component", "/services/AuditionProjectService").insertaudprojects(
        projName = new_projName,
        projDescription = new_projDescription,
        userid = cookie.userid,
        audSubCatID = new_audSubCatID,
        isDeleted = new_isDeleted,
        IsDirect = isdirect,
        contactid = new_contactid,
        projdate = new_projdate
    )>
    <cfquery name="updateFetchStatus">
        UPDATE your_table_name SET isfetch = 1 WHERE your_condition
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in audprojects_ins_308_19.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
