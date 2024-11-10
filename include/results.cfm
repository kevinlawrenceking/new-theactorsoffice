<!--- This ColdFusion page displays a data table with modals for adding, updating, and deleting records. --->
<cfparam name="detailsRecId" default="" />
<cfparam name="detailsPgId" default="" />

<style>
    table.dataTable tbody td {
        word-break: break-word;
        vertical-align: top;
    }
</style>

<script>
    $(document).ready(function() {
        $("#remoteNewForm").on("show.bs.modal", function(event) {
            <!--- Load the remote new form into the modal body --->
            $(this).find(".modal-body").load("/include/RemoteNewForm.cfm?rpgid=<cfoutput>#pgId#&pgdir=#pgDir#</cfoutput>");
        });
    });
</script>

<cfset rpgId = rpgId />
<cfset hh = 1 />
<cfparam name="childYn" default="N" />

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">
                    <cfoutput>#pgHeading#</cfoutput>
                    <cfif isdefined('hh')>
                        <span class="small right">
                            (<cfoutput>#pgId#</cfoutput>)
                        </span>
                    </cfif>
                </h4>

                <cfif childYn is "N">
                    <div class="d-flex justify-content-between">
                        <div class="float-left">
                            <cfif results.recordcount is "0">No #compName#. </cfif>
                            <p>
                                <cfoutput>You have <strong>#results.recordcount#</strong> #compName#.</cfoutput>
                            </p>
                        </div>

                        <cfif isdefined('blkdfjs')>
                            <div class="dropdown float-end">
                                <a href="#" class="dropdown-toggle arrow-none text-muted" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="mdi mdi-dots-horizontal font-18"></i>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" style="">
                                    <cfif findPage.allowAddYn is "Y">
                                        <a href="remoteNewForm.cfm" style="margin-bottom: 10px;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteNewForm" class="dropdown-item">
                                            <i class="mdi mdi-square-edit-outline mr-1"></i>Create
                                        </a>
                                    </cfif>

                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <i class="fe fe-external mr-1"></i>View
                                    </a>

                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <i class="mdi mdi-content-copy mr-1"></i>Export
                                    </a>
                                </div>
                            </div>
                        </cfif>
                    </div>

                    <cfif findPage.allowAddYn is "Y">
                        <div style="margin-bottom: 30px;">
                            <a href="remoteNewForm.cfm" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteNewForm" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e;margin-bottom: 10px;">
                                Add
                            </a>
                        </div>
                    </cfif>
                </cfif>

                <!--- Rest of the code --->

<!--- Changes were made based on the following rules: 
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Ensured consistent attribute quoting, spacing, and formatting.
4. Used double pound signs `##` to avoid interpretation as variables for hex color codes.
--->