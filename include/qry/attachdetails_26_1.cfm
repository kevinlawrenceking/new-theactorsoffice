<!--- This ColdFusion page retrieves attachment details based on the provided attachid. --->

<cfquery name="attachdetails">
    <!--- Query to select attachment details from the attachments table based on attachid --->
    SELECT 
        attachid, 
        noteid, 
        attachname, 
        attachfilename 
    FROM 
        attachments 
    WHERE 
        attachid = #attachid#
</cfquery>
