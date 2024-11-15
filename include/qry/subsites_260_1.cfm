<!--- This ColdFusion page retrieves a list of submission sites for a specific user from the database. --->

<cfquery name="subsites">
    <!--- Selects submission site details for the user, excluding empty site names. --->
    SELECT submitsiteid,
           submitsitename,
           catlist
    FROM audsubmitsites_user 
    WHERE userid = #userid# 
          AND submitsitename <> ''
    ORDER BY submitsitename
</cfquery>
