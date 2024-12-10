<!--- This ColdFusion page includes a details query and outputs the noted details HTML. --->
<style>
. ql-hidden {
    display: none;
}
</style>
<cfinclude template="/include/qry/notes_21_1.cfm" />   

<!--- Output the noted details HTML from the query results. --->
<cfoutput>
    #notes.notedetailshtml#
</cfoutput>

