
<cftry>
    <cfset result = createObject("component", "services.AuditionMediaService").updateaudmedia(
        new_mediaTypeID=new_mediaTypeID,
        new_mediaURL=new_mediaURL,
        new_mediaName=new_mediaName,
        new_mediaFilename=sdffdsfsdds ? new_mediaFilename : "",
        new_mediaExt=sdffdsfsdds ? new_mediaExt : "",
        new_userid=new_userid,
        new_isDeleted=new_isDeleted,
        new_isShare=new_isShare,
        new_mediaID=new_mediaID
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audmedia_upd_386_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
