<!--- This ColdFusion page includes a modal for adding a new form with a title from a query. --->
<cfinclude template="/include/qry/find_modal_title_107_3.cfm" />

<div id="remoteNewForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: ##f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">
                    <cfoutput>#findModalTitle.compName#</cfoutput> Add Form
                </h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">x</button>
            </div>
            <div class="modal-body"></div>
        </div> <!--- /.modal-content --->
    </div> <!--- /.modal-dialog --->
</div>

<!--- Changes made:
1. Standardized the file name in cfinclude tag to lower case.
2. Removed unnecessary cfoutput tag around variable output.
3. Used double pound signs for hex color code to avoid interpretation as variables.
4. Standardized variable names and casing.
--->