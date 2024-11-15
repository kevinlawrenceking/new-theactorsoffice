<!--- This ColdFusion page retrieves distinct company values associated with a user from the database. --->
<cfquery name="companies">
    <!--- Select distinct company values from contactitems joined with contactdetails for a specific user --->
    SELECT DISTINCT i.valueCompany AS new_valuecompany
    FROM contactitems i
    INNER JOIN contactdetails d ON d.contactid = i.contactid
    WHERE i.VALUEcategory = 'company' 
      AND d.userid = <cfqueryparam value="#userid#" cfsqltype="cf_sql_integer">
      AND i.valuecompany <> '' 
      AND i.valueCompany IS NOT NULL 
      AND i.valuecompany <> 'Custom'
    ORDER BY i.valuecompany
</cfquery>
