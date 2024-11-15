<!--- This ColdFusion page retrieves user details based on the provided user ID. --->

<cfquery name="U">
    SELECT
        u.userid,
        u.recordname,
        u.userFirstName,
        u.userLastName,
        u.userEmail,
        u.contactid,
        u.userRole
    FROM 
        taousers u
    <!--- Check if a specific user ID is selected for filtering. --->
    <cfif #select_userid# is not "0">
        WHERE 
            u.userid = #select_userid#
    </cfif>
</cfquery>
