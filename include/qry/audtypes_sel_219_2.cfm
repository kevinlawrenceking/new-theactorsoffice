<!--- This ColdFusion page retrieves active audio types based on the specified category ID. --->

<cfquery name="audtypes_sel">
    <!--- Query to select audio types that are not deleted and belong to a specific category. --->
    SELECT 
        audtypeid AS id, 
        audtype AS name, 
        audcatid 
    FROM 
        audtypes 
    WHERE 
        isdeleted = 0 
        AND audcatid = #new_audcatid# 
    ORDER BY 
        audtype
</cfquery>
