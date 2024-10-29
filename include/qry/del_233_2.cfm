
<cftry>
    <cfset suidList = []>
    <cfquery name="getSuidList" datasource="yourDataSource">
        SELECT suid FROM fusystemusers
    </cfquery>
    
    <cfloop query="getSuidList">
        <cfset arrayAppend(suidList, getSuidList.suid)>
    </cfloop>

    <cfset createObject("component", "services.NotificationService").updateNotifications(suidList=suidList)>

    <!--- Update the database to set isfetch = 1 --->
    <cfquery datasource="yourDataSource">
        UPDATE funotifications_tbl
        SET isfetch = 1
        WHERE isdeleted = 0
    </cfquery>

    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_233_2.cfm] #cfcatch.message# Query: #cfcatch.detail#">
        <cfthrow message="Error updating notifications." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
