
<cftry>
    <cfset suidList = []> <!--- Assuming you have a list of suids to exclude, otherwise keep it empty --->
    <cfset createObject("component", "services.NotificationService").UPDfunotifications_24650(suidList=suidList)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_465_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
