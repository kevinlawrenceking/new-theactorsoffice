
<cftry>
    <cfset systemUserService = new "/services/SystemUserService.cfc" />
    <cfset systemUserService.updateUserStatus(new_contactid=new_contactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_304_6.cfm]: #cfcatch.message#" />
        <cfthrow message="Error calling updateUserStatus function." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
