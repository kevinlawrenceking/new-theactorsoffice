<!--- This ColdFusion page retrieves media details based on the media ID provided. --->

<cfquery name="audmedia_details">
    <!--- Query to select media details from the audmedia table joined with audmediatypes. --->
    SELECT 
        m.mediaid,
        m.mediatypeid,
        m.mediaName,
        m.mediaLoc,
        m.mediaurl,
        m.mediaFilename,
        m.mediaExt,
        m.userid,
        m.mediacreated,
        m.isdeleted,
        t.mediaType 
    FROM 
        audmedia m
    INNER JOIN 
        audmediatypes t 
    ON 
        t.mediaTypeID = m.mediatypeid
    WHERE 
        m.mediaid = #mediaid#
</cfquery>
