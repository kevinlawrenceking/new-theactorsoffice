
<cftry>
    <cfset shares = createObject("component", "services.ShareService").getshares(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in shares_534_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
