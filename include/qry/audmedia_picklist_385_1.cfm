
<cftry>
    <cfset audMediaService = createObject("component", "services.AuditionMediaService")>
    <cfset audmedia_picklist = audMediaService.SELaudmedia_24570(userid=userid, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmedia_picklist_385_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
