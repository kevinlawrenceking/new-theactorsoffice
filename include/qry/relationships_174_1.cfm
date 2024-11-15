<!--- This ColdFusion page retrieves contact details for a specific user from the database. --->

<cfquery name="relationships">
    <!--- Query to select contact details for the logged-in user --->
    select * 
    from contactdetails d 
    where recordname <> '' 
      and userid = #session.userid# 
    order by d.contactfullname
</cfquery>
