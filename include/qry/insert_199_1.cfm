
<cftry>
    <cfset typeresult = createObject("component", "services.ItemTypesUserService").insertitemtypes_user(customtype, userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_199_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
