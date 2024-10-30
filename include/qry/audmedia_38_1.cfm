
<cftry>
    <cfset audmedia = createObject("component", "services.AuditionMediaService").SELaudmedia_23799(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmedia_38_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
