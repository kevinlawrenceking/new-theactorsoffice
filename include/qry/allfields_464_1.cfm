<!--- This ColdFusion page retrieves the structure of a database table specified by the variable 'tname' --->
<cfquery name="allfields">
    DESCRIBE #tname#
</cfquery>
