<!--- This ColdFusion page retrieves ticket types from the database for display purposes. --->
<cfquery name="types">
    <!--- Query to select ticket types from the tickettypes table --->
    SELECT tickettype AS id, 
           tickettype AS name 
    FROM tickettypes 
    ORDER BY tickettype
</cfquery>
