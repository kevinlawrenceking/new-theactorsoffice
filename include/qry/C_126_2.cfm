<!--- This ColdFusion page retrieves contact details for a specific user, optionally filtering by contact ID. --->

<cfquery name="C">
    SELECT contactid, recordname
    FROM contactdetails
    WHERE userid = #u.userid#
    
    <!--- Check if a specific contact ID is selected for filtering. --->
    <cfif #select_contactid# is not "0">
        AND contactid = #select_contactid#
    </cfif>
    
    ORDER BY contactid
</cfquery>
