
<cftry>
    <cfset variables.itemTypesUserService = createObject("component", "services.ItemTypesUserService")>
    <cfset variables.itemTypesUserService.insertItemTypeUser(customtype="#customtype#", userid=#userid#)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in insert_199_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
