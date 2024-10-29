
<cftry>
    <cfset Findtotal = createObject("component", "services.PanelUserService").getNewPnOrderNo(userid=userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findtotal_249_4.cfm]: #cfcatch.message#; Data: #userid#" />
    </cfcatch>
</cftry>
