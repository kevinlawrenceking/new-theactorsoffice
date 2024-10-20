
<cftry>
    <cfset itemTypesUserService = new "/services/ItemTypesUserService.cfc"()>
    <cfset itemTypesUserService.insertitemtypes_user(
        valuetype = x.valuetype,
        typeicon = x.typeicon,
        userid = users.userid
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_318_33.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
