<!--- This ColdFusion page retrieves contact details for the logged-in user from the database. --->

<cfquery name="relationships">
    <!--- Select all contact details where record name is not empty and matches the current user's ID. --->
    select * 
    from contactdetails d 
    where recordname <> '' 
      and userid = #userid# 
    order by d.contactfullname
</cfquery>
