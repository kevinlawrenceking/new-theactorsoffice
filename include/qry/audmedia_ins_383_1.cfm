
<cftry>
    <cfset result = createObject("component", "services.AuditionMediaService").insertaudmedia(
        mediaTypeID=new_mediaTypeID,
        mediaURL=new_mediaURL,
        mediaName=new_mediaName,
        mediaFilename=new_mediaFilename,
        mediaExt=new_mediaExt,
        userid=new_userid,
        isDeleted=new_isDeleted,
        isshare=new_isshare
    )>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery>
        UPDATE your_table_name SET isfetch = 1 WHERE condition_column = 'condition_value'
    </cfquery>
<cfcatch type="any">
    <cfset errorLog = "[Error in audmedia_ins_383_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
