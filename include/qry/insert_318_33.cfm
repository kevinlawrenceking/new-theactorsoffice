
<cftry>
    <cfset itemTypesUserService = createObject("component", "/services/ItemTypesUserService")>
    <cfset itemTypesUserService.INSitemtypes_user_24464(
        valuetype = x.valuetype,
        typeicon = x.typeicon,
        userid = users.userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_318_33.cfm]: #cfcatch.message#">
        <cfthrow message="Error calling INSitemtypes_user_24464." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
