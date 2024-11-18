<!--- This ColdFusion page retrieves contact details for the logged-in user from the database. --->

<cfquery name="relationships">
    <!--- Query to select contact details where record name is not empty for the current user. --->
    select * 
    from contactdetails d 
    where recordname <> '' 
      and userid = #userid# 
    order by d.contactfullname
</cfquery>
