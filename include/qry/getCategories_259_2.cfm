<!--- This ColdFusion page retrieves active audio categories from the database and orders them by name. --->
<cfquery name="getCategories">
    <!--- Query to select active audio categories --->
    SELECT audcatid, audcatname 
    FROM audcategories 
    WHERE isdeleted = 0 
    ORDER BY audcatname
</cfquery>
