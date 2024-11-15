<!--- This ColdFusion page retrieves records from a specified table and formats them for use in a dropdown or selection list. --->

<cfquery name="selects">
    <!--- Query to select record names from the specified table, ordering by record name. --->
    select 
        recordname as value, 
        recordname as text 
    from 
        #RPgupdate.tableSelect# 
    order by 
        recordname
</cfquery>
