<!--- This ColdFusion page retrieves media types from the audmediatypes table for specific media type IDs. --->

<cfquery name="Type">             
    <!--- Query to select media type IDs and their corresponding media types from the database. --->
    SELECT mediatypeid, mediatype 
    FROM audmediatypes 
    WHERE mediatypeid IN (1, 2, 3, 5, 6, 7, 8, 14)
</cfquery>
