
<!--- This ColdFusion page retrieves the next order number for a specific user from the pgpanels_user table. --->
<cftry>
    <cfset Findtotal = createObject("component", "services.PanelUserService").SELpgpanels_user_24147(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findtotal_249_4.cfm]: #cfcatch.message#; Data: #userid#">
        <cfset Findtotal = queryNew("new_pnOrderNo", "integer")>
    </cfcatch>
</cftry>
