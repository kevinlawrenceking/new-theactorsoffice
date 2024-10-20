
<cftry>
    <cfset result = createObject("component", "/services/AuditionMediaTypeService").updateaudmediatypes(
        new_mediaType = new_mediaType,
        new_isDeleted = new_isDeleted,
        new_mediaTypeID = new_mediaTypeID
    )>
    <cfset isfetch = 1>
    <!--- Code to update the database with isfetch = 1 --->
<cfcatch type="any">
    <cfset errorLog = "[Error in audmediatypes_ins_380_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
