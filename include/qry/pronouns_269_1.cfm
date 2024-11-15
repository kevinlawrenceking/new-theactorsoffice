<!--- This ColdFusion page retrieves the gender pronoun for a specific user based on their user ID. --->

<cfquery name="pronouns">
    <!--- Query to select the gender pronoun from the genderpronouns_users table for the given user ID. --->
    SELECT genderPronoun 
    FROM genderpronouns_users 
    WHERE userid = #userid#
</cfquery>
