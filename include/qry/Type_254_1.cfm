<!--- This ColdFusion page retrieves media types from the audmediatypes table based on specific media type IDs. --->

<cfquery name="Type">             
    <!--- Query to select media type ID and media type from the audmediatypes table for specified IDs. --->
    SELECT 
        mediatypeid, 
        mediatype 
    FROM 
        audmediatypes 
    WHERE 
        mediatypeid IN (1, 2, 3, 5, 6, 7, 8, 14)
</cfquery>
