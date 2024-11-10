><!--- Consolidate cfparam --->
<cfparam name="contactExpand" default="true" />
<cfparam name="maintenanceExpand" default="false" />
<cfparam name="targetExpand" default="false" />
<cfparam name="followupExpand" default="false" />
<cfparam name="allExpand" default="false" />
<cfparam name="pgAction" default="view" />
<cfparam name="addedCount" default="0" />
<cfparam name="removedCount" default="0" />
<cfparam name="skippedCount" default="0" />
<cfparam name="contactCheckVisible" default="false" />
<cfparam name="byTag" default="" />
<cfparam name="byImport" default="" />

<!--- Set default session page action if not defined --->
<cfif NOT isDefined('session.pgAction')>
    <cfset session.pgAction = "view">
</cfif>

<!--- Include last updates query --->
<cfinclude template="/include/qry/lastupdates.cfm" />

<!--- Responsive Tabs CSS --->
<style>
    .responsive-tabs {
        padding: 1rem;
    }
    .responsive-tabs .nav-tabs {
        display: none;
    }
    @media (min-width: 768px) {
        .responsive-tabs .nav-tabs {
            display: flex;
        }
        .responsive-tabs .card {
            border: none;
        }
        .responsive-tabs .card .card-header {
            display: none;
        }
        .responsive-tabs .card .collapse {
            display: block;
        }
    }
    @media (max-width: 767px) {
        .responsive-tabs .tab-pane {
            display: block !important;
            opacity: 1;
        }
    }
</style>

<!--- Remote Add Name Modal --->
<div id="remoteAddName" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add A Relationship</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $("#remoteAddName").on("show.bs.modal", function(event) {
            $(this).find(".modal-body").load("/include/remoteAddName.cfm");
        });
    });
</script>

<!--- Bulk Action Handling --->
<cfif session.pgAction is "bulk">
    <cfset session.pgAction = "view" />
    <script>
        $(document).ready(function() {
            $("#bulkModal").modal('show');
            var table = $("#contacts_ss");
            var btn = $('#btnSelectedRows');
            function enableBtn() {
                btn.prop("disabled", table.find("input:checked").length === 0);
            }
            table.on("change", "input", enableBtn);
            enableBtn();
        });
    </script>

    <!--- Bulk Modal --->
    <div id="bulkModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Selected Updated Summary</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                </div>
                <div class="modal-body">
                    <cfif addedCount neq "0">
                        <p><cfoutput>#addedCount# #bt#<cfif addedCount neq "1">s</cfif> added.</cfoutput></p>
                    </cfif>
                    <cfif removedCount neq "0">
                        <p><cfoutput>#removedCount# #bt#<cfif removedCount neq "1">s</cfif> removed.</cfoutput></p>
                    </cfif>
                    <cfif skippedCount neq "0">
                        <p><cfoutput>#skippedCount# relationship<cfif skippedCount neq "1">s</cfif> skipped.</cfoutput></p>
                    </cfif>
                    <div class="form-group text-center col-md-12">
                        <a href="/app/contacts/">
                            <button class="btn btn-primary btn-sm waves-effect waves-light" type="button" style="background-color: ##406e8e; border: ##406e8e;">Continue</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</cfif>

<!--- Contact Tabs --->
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <cfif byTag neq "">
                    <div class="container">
                        <a href="/app/contacts/"><span class="badge badge-blue">#byTag# X</span></a>
                    </div>
                </cfif>

                <cfif byImport neq "">
                    <div class="container">
                        <a href="/app/contacts/"><span class="badge badge-blue">Import ###byImport# X</span></a>
                    </div>
                </cfif>

                <div class="container responsive-tabs">
                    <ul class="nav nav-pills navtab-bg nav-justified p-1" role="tablist">
                        <li class="nav-item">
                            <a id="tab-A" href="#contacts" class="nav-link <cfif contactExpand is 'true'> active</cfif>" data-bs-toggle="tab" role="tab">All Relationships</a>
                        </li>
                        <li class="nav-item">
                            <a id="tab-B" href="#target" class="nav-link <cfif targetExpand is 'true'> active</cfif>" data-bs-toggle="tab" role="tab">Targeted List</a>
                        </li>
                        <li class="nav-item">
                            <a id="tab-C" href="#followup" class="nav-link <cfif followupExpand is 'true'> active</cfif>" data-bs-toggle="tab" role="tab">Follow-Up List</a>
                        </li>
                        <li class="nav-item">
                            <a id="tab-D" href="#maintenance" class="nav-link <cfif maintenanceExpand is 'true'> active</cfif>" data-bs-toggle="tab" role="tab">Maintenance List</a>
                        </li>
                    </ul>

                    <div id="content" class="tab-content" role="tablist">
                        <!--- All Relationships --->
                        <div id="contacts" class="card tab-pane fade<cfif contactExpand is 'true'> show active</cfif>" role="tabpanel" aria-labelledby="tab-A">
                            <div class="card-header" role="tab" id="heading-A">
                                <h5 class="mb-0">
                                    <a data-bs-toggle="collapse" href="#collapse-A" aria-expanded="#contactExpand#" aria-controls="collapse-A">All Relationships</a>
                                </h5>
                            </div>

                            <div id="collapse-A" class="collapse show" data-bs-parent="#content" role="tabpanel" aria-labelledby="heading-A">
                                <div class="card-body">
                                    <cfset contactsTable="contacts_ss" />
                                    <cfinclude template="/include/contacts_table.cfm" />
                                </div>
                            </div>
                        </div>

                        <!--- Targeted List --->
                        <div id="target" class="card tab-pane fade<cfif targetExpand is 'true'> show active</cfif>" role="tabpanel" aria-labelledby="tab-B">
                            <div class="card-header" role="tab" id="heading-B">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-bs-toggle="collapse" href="#collapse-B" aria-expanded="#targetExpand#" aria-controls="collapse-B">Targeted List</a>
                                </h5>
                            </div>

                            <div id="collapse-B" class="collapse" data-bs-parent="#content" role="tabpanel" aria-labelledby="heading-B">
                                <div class="card-body" id="targetTest">
                                    <cfset contactsTable="contacts_ss_target" />
                                    <cfinclude template="/include/contacts_table.cfm" />
                                </div>
                            </div>
                        </div>

                        <!--- Follow-Up List --->
                        <div id="followup" class="card tab-pane fade<cfif followupExpand is 'true'> show active</cfif>" role="tabpanel" aria-labelledby="tab-C">
                            <div class="card-header" role="tab" id="heading-C">
                                <h5 class="mb-0">
                                    <a data-bs-toggle="collapse" href="#collapse-C" aria-expanded="#followupExpand#" aria-controls="collapse-C">Follow-Up List</a>
                                </h5>
                            </div>

                            <div id="collapse-C" class="collapse" data-bs-parent="#content" role="tabpanel" aria-labelledby="heading-C">
                                <div class="card-body">
                                    <cfset contacts