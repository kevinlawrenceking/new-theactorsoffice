
<cftry>
    <cfset resultk = createObject("component", "services.AuditionDialectsUserService").insertauddialects_user(
        auddialectid = 0, 
        auddialect = CustomDialect, 
        userid = userid, 
        audCatid = new_catid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_287_24.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
