
<cftry>
    <cfset headshots = createObject("component", "services.AuditionMediaService").getaudmedia(audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in headshots_377_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
