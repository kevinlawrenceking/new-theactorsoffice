
<cftry>
    <cfset application.auditionProjectService = createObject("component", "services.AuditionProjectService")>
    <cfset application.auditionProjectService.insertAudProject(
        new_projName=new_projName,
        new_projDescription=new_projDescription,
        new_userid=new_userid,
        new_audSubCatID=new_audSubCatID,
        new_unionID=new_unionID,
        new_networkID=new_networkID,
        new_toneID=new_toneID,
        new_contractTypeID=new_contractTypeID,
        new_isDeleted=new_isDeleted,
        isdirect=isdirect
        <cfif len(trim(new_contactid))>
            ,new_contactid=new_contactid
        </cfif>
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in audprojects_ins_399_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
