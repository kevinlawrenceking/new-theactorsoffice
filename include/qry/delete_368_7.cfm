
<cftry>
    <cfset objContactAuditionService = createObject("component", "services.ContactAuditionService")>
    <cfset objContactAuditionService.deleteAuditionContact(audprojectid=#audprojectid#, deletecontactid=#deletecontactid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_368_7.cfm]: #cfcatch.message#">
        <cfthrow message="Error executing fetch in delete_368_7.cfm." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
