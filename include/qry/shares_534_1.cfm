
<cftry>
    <cfset sharesService = createObject("component", "services.ShareService")>
    <cfset shares = sharesService.getSharesByUserId(session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in shares_534_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
