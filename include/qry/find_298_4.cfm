<!--- This ColdFusion page retrieves user tags based on a specified tag name and user ID. --->

<cfquery name="find">
    <!--- Select all columns from tags_user where the tagname matches the left 40 characters of new_valuetext and the userid matches the provided userid. --->
    select * 
    from tags_user 
    where tagname = '#left(new_valuetext, 40)#' 
    and userid = #userid#
</cfquery>
