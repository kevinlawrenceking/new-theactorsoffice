<!--- This ColdFusion page retrieves the record name from contact details based on the provided contact ID. --->

<cfquery name="FindRefcontacts">
    <!--- Query to select the record name from contact details table based on contact ID --->
    SELECT recordname
    FROM contactdetails
    WHERE contactid = #contactid#
</cfquery>
