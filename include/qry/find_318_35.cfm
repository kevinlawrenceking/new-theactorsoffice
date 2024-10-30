
<cftry>
    <cfset itemTypesUserService = new services.ItemTypesUserService()>
    <cfset find = itemTypesUserService.SELitemtypes_user_24466(
        valuetype = x.valuetype,
        userid = select_userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in find_318_35.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching item types." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
