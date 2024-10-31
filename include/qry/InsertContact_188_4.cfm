
<cftry>
    <cfset userService = createObject("component", "/services/UserService")>
    <cfset userService.UPDtaousers_24001(new_contactid=new_contactid, userid=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in InsertContact_188_4.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the user contact." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
