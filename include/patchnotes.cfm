<!--- This ColdFusion page includes a query for notes and displays them in a list format. --->
<cfinclude template="/include/qry/notes_186_1.cfm" />

<div class="row">
    <div style="padding:15px;">
        <ul>
            <!--- Output each note from the query results --->
            <cfloop query="notes">
                <li>#notes.patchnote#</li>
            </cfloop>
        </ul>
    </div>
</div>

<!--- Changes made based on standards:
1. Replaced cfoutput with cfloop for looping over query results.
2. Removed unnecessary # symbols around variable outputs within cfloop.
--->