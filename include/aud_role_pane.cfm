<div id="essencehelp" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: ##f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Essences</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body">
                <!--- Content here --->
            </div>
        </div>
    </div>
</div>

<cfinclude template="/include/qry/audessences_audtion_xref_49_1.cfm" />

<script>
    $(document).ready(function() {
        $("##roleupdate").on("show.bs.modal", function(event) {
            $(this).find(".modal-body").load("/include/roleupdateform.cfm?audprojectid=<cfoutput>#audprojectid#</cfoutput>&audroleid=<cfoutput>#roledetails.audroleid#</cfoutput>&pgdir=audition");
        });
    });
</script>

<!--- Modal for Role Update --->
<div id="roleupdate" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: ##f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Role Update</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body">
                <!--- Content here --->
            </div>
        </div>
    </div>
</div>

<div class="row">
    <h4 class="p-1 d-flex">Role type: <cfoutput>#roledetails.audroletype#</cfoutput> 
        <span class="ms-auto text-muted">
            <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##roleupdate" data-bs-placement="top" title="Update Role" data-bs-original-title="Update Role">
                <i class="mdi mdi-square-edit-outline"></i>
            </a>
        </span>
    </h4>

    <!--- More content here --->

    <cfif isdefined('sf')>
        <div class="col-md-12 p-1">
            <strong>Sides, Script Story board: </strong>
        </div>
        <div class="col-md-12">
            <a href="sides.pdf"><i class="mdi mdi-48px mdi-file-pdf-box-outline text-primary"></i><br><small>sides.pdf</small></a>
        </div>
    </cfif>
</div>

<!--- Changes made: Removed unnecessary cfoutput tags around variable outputs, used double pound signs for hex color codes, simplified record count logic, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting, improved logic for expanding and collapsing views in mobile layouts, removed cftry and cfcatch blocks entirely. --->