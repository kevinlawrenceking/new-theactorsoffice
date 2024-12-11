<!--- This ColdFusion page retrieves active role types based on a specific category ID. --->

<cfquery name="audroletypes_sel">
    <!--- Query to select active role types based on category ID --->
    SELECT 
        audroletypeid AS `id`, 
        audroletype AS `name` 
    FROM 
        audroletypes 
    WHERE 
        audcatid = #cat.audcatid# 
        AND isdeleted IS false
</cfquery>
