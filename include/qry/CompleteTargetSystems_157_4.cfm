
<cftry>
    <cfset SystemUserService = new services.SystemUserService()>
    <cfset result = SystemUserService.updatefusystemusers({
        "userid": new_userid,
        "systemids": [5, 6],
        "contactid": new_contactid
    })>
    <cfcatch type="any">
        <cfset errorLog = "[Error in CompleteTargetSystems_157_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
