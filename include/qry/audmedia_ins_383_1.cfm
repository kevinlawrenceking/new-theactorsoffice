
<cftry>
    <cfset componentPath = "/services/AuditionMediaService.cfc">
    <cfset audMediaService = createObject("component", componentPath)>
    <cfset audMediaService.INSaudmedia(
        new_mediaTypeID = new_mediaTypeID,
        new_mediaURL = new_mediaURL,
        new_mediaName = new_mediaName,
        new_mediaFilename = new_mediaFilename,
        new_mediaExt = new_mediaExt,
        new_userid = new_userid,
        new_isDeleted = new_isDeleted,
        new_isshare = new_isshare
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audmedia_ins_383_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
