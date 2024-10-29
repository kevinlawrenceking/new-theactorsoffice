
<cftry>
    <cfset componentPath = "/services/ContactService.cfc">
    <cfset contactService = createObject("component", componentPath)>
    <cfset contactService.INScontactdetails_23775(userid=userid, contactfullname=cdco)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_28_7.cfm]: #cfcatch.message#">
        <cfthrow message="Error in add_28_7.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
