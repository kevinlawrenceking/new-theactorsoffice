
<cftry>
    <cfset systemUserService = createObject("component", "services.SystemUserService")>
    <cfset find_d = systemUserService.SELfusystemusers_23864(idlist=idlist, new_systemid=new_systemid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_d_104_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error executing fetch in find_d_104_1.cfm." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
