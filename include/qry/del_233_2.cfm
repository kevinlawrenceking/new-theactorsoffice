
<cfset suidList = []>

<cfquery name="suidQuery" datasource="yourDataSource">
    SELECT suid FROM fusystemusers
</cfquery>

<cfloop query="suidQuery">
    <cfset arrayAppend(suidList, suidQuery.suid)>
</cfloop>

<cftry>
    <cfset createObject("component", "services.NotificationService").UPDfunotifications_24130(suidList=suidList)>
    <cfquery name="updateFetchStatus" datasource="yourDataSource">
        UPDATE funotifications_tbl 
        SET isfetch = 1 
        WHERE isdeleted = 1
    </cfquery>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_233_2.cfm]: #cfcatch.message# Query: #cfcatch.detail#">
        <cfthrow message="Error updating notifications." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
