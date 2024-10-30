
<cftry>
    <cfset typesService = createObject("component", "services.EventTypesUserService")>
    <cfset types = typesService.SELeventtypes_user_24484(userid=userid, isAuditionModule=isAuditionModule)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_333_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
