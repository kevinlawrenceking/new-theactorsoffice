<cfset audMediaService = createObject("component", services.AuditionMediaService)>
<cfset new_mediaID = audMediaService.INSaudmedia(
    new_mediaTypeID = new_mediaTypeID,
    new_mediaURL = new_mediaURL,
    new_mediaName = new_mediaName,
    new_mediaFilename = new_mediaFilename,
    new_mediaExt = new_mediaExt,
    new_userid = userid,
    new_isDeleted = new_isDeleted,
    new_isshare = new_isshare
)>