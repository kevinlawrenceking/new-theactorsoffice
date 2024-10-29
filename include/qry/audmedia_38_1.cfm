
<cftry>
    <cfset audmedia = createObject("component", "services.AuditionMediaService").getMediaByEventId(eventid=#eventid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmedia_38_1.cfm]: #cfcatch.message#" />
        <cfthrow>
    </cfcatch>
</cftry>
