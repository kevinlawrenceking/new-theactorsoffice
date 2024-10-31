
<cftry>
    <cfset systemUserService = createObject("component", "/services/SystemUserService.cfc" />
    <cfset systemUserService.UPDfusystemusers_24345(new_contactid=new_contactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_304_6.cfm]: #cfcatch.message#" />
        <cfthrow message="Error executing the update function." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
