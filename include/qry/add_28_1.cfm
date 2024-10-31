
<cftry>
    <cfset objContactService = createObject("component", "services.ContactService")>
    <cfset objContactService.INScontactdetails_23769(userid=userid, cdfullname=cdfullname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_28_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
