<!--- This ColdFusion page includes a details query and outputs the noted details HTML. --->

<cfinclude template="/include/qry/notes_21_1.cfm" />   

<!--- Output the noted details HTML from the query results. --->
<cfoutput>
    #results.notedetailshtml#
</cfoutput>

