<cfset auditionMediaService = createObject("component", "services.AuditionMediaService")>
<cfset auditionMediaService.UPDaudmedia_24571(
    new_mediaTypeID = new_mediaTypeID,
    new_mediaURL = new_mediaURL,
    new_mediaName = new_mediaName,
    new_mediaFilename = isDefined('sdffdsfsdds') ? new_mediaFilename : "",
    new_mediaExt = isDefined('sdffdsfsdds') ? new_mediaExt : "",
    new_userid = userid,
    new_isDeleted = new_isDeleted,
    new_isShare = new_isShare,
    new_mediaID = new_mediaID
)>