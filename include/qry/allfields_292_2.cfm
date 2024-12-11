<!--- This ColdFusion page retrieves the structure of a database table specified by the variable 'comptable' --->
<cfquery name="allfields">         
    <!--- Query to describe the structure of the specified table --->
    Describe #comptable# 
</cfquery>
