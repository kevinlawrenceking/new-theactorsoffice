<!--- This ColdFusion page retrieves a list of records from the specified table and formats them for display. --->
<cfoutput><h1>#RPgupdate.tableSelect#</h1></cfoutput><cfabort>
<cfquery name="selects">
    select recordname as value, 
           recordname as text 
    from #RPgupdate.tableSelect# 
    order by recordname
</cfquery>
