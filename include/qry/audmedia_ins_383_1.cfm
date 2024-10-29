
<cftry>
    <cfset objAuditionMediaService = createObject("component", "services.AuditionMediaService")>
    <cfset objAuditionMediaService.insertAudMedia(
        new_mediaTypeID = new_mediaTypeID,
        new_mediaURL = new_mediaURL,
        new_mediaName = new_mediaName,
        new_mediaFilename = new_mediaFilename,
        new_mediaExt = new_mediaExt,
        new_userid = new_userid,
        new_isDeleted = new_isDeleted,
        new_isshare = new_isshare
    )>
    <cfquery name="updateFetchStatus" datasource="#yourDataSource#">
        UPDATE yourTableName SET isfetch = 1 WHERE yourCondition
    </cfquery>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audmedia_ins_383_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
