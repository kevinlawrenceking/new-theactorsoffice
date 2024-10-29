
<cfset systemUserService = createObject("component", "services.SystemUserService")>

<cftry>
    <cfset FindActive = systemUserService.getActiveSystemUserIDs(contactID=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindActive_304_4.cfm]: #cfcatch.message#"/>
    </cfcatch>
</cftry>
