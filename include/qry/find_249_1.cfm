
<cftry>
    <cfset find = createObject("component", "services.SiteTypeUserService").SELsitetypes_user_24144(userid=userid, new_sitetypename=new_sitetypename)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_249_1.cfm] #cfcatch.message#">
        <cfthrow message="Fetch operation failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
