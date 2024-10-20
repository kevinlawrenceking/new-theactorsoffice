
<cftry>
    <cfset result = createObject("component", "/services/PanelUserService").updatepgpanels_user(userid=userid)>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery name="updateFetchStatus">
        UPDATE pgpanels_user
        SET isfetch = 1
        WHERE userid = #userid#
    </cfquery>
<cfcatch type="any">
    <cfset errorLog = "[Error in x_94_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
