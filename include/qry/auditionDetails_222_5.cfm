
<cftry>
    <cfset auditionDetails = createObject("component", "services.AuditionProjectService").DETaudprojects_24106(new_eventid=new_eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auditionDetails_222_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
