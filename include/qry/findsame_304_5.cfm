
<cftry>
    <cfset systemUserService = createObject("component", "services.SystemUserService")>
    <cfset findsame = systemUserService.SELfusystemusers_24344(new_contactid=new_contactid, new_systemid=new_systemid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findsame_304_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
