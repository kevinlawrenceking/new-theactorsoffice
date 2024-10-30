
<cftry>
    <cfset objContactService = createObject("component", "services.ContactService")>
    <cfset objContactService.INScontactdetails_24537(userid=userid, cdfullname=cdfullname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_367_4.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INScontactdetails_24537." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
