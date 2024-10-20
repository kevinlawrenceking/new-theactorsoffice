
<cftry>
    <cfset result = createObject("component", "/services/AuditionProjectService").insertaudprojects(
        projName = new_projName,
        projDescription = new_projDescription,
        userid = new_userid,
        audSubCatID = new_audSubCatID,
        unionID = new_unionID,
        networkID = new_networkID,
        toneID = new_toneID,
        contractTypeID = new_contractTypeID,
        isDeleted = new_isDeleted,
        IsDirect = isdirect,
        contactid = (len(trim(new_contactid)) ? new_contactid : "")
    ) />
<cfcatch>
    <cfset errorLog = "[Error in audprojects_ins_399_1.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
