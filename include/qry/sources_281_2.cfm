<!--- This ColdFusion page retrieves active audio sources from the database and orders them by their name. --->

<cfquery name="sources">
    <!--- Query to select active audio sources from the audsources table --->
    SELECT audsourceid, audsource 
    FROM audsources 
    WHERE isdeleted = 0 
    ORDER BY audsource
</cfquery>
