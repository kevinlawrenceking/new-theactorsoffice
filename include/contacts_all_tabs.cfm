<!--- This ColdFusion page manages contacts, allowing users to add relationships, tags, and systems to selected contacts. It includes modals for user interactions and displays contact information in a tabbed interface. --->
<cfparam name="contactExpand" default="true" />
<cfparam name="addedCount" default="0" />
<cfparam name="removedCount" default="0" />
<cfparam name="skippedCount" default="0" />
<cfparam name="contactCheckVisible" default="false" />
<cfparam name="maintenanceExpand" default="false" />
<cfparam name="byTag" default="" />
<cfparam name="targetExpand" default="false" />
<cfparam name="followUpExpand" default="false" />
<cfparam name="allExpand" default="false" />
<cfparam name="pageAction" default="view" />

<style>
/* Extra small devices (phones, less than 768px) */
/* No media query since this is the default in Bootstrap */
.font-size: 11px; // regular text
.large { font-size: 20px; }

/* Small devices (tablets, 768px and up) */
@media (min-width: @screen-sm-min) {
    .font-size: 13px; // regular text
    .large { font-size: 50px; }
}

/* Medium devices (desktops, 992px and up) */
@media (min-width: @screen-md-min) {
    .font-size: 16px; // regular text
    .large { font-size: 100px; }
}

/* Large devices (large desktops, 1200px and up) */
@media (min-width: @screen-lg-min) {
    .font-size: 18px; // regular text
    .large { font-size: 150px; }
}
</style>

<!--- Check if session action is defined; if not, set it to 'view' --->
<cfif NOT isdefined('session.pageAction')>
    <cfset session.pageAction = "view">
</cfif>

<!--- Include last updates query --->
<cfinclude template="/include/qry/lastUpdates.cfm" />

<!--- Initialize modal for adding a relationship --->
<script>
$(document).ready(function() {
    $("#remoteAddName").on("show.bs.modal", function(event) {
        // Place the returned HTML into the selected element
        $(this).find(".modal-body").load("/include/remoteAddName.cfm");
    });
});
</script>

<div id="remoteAddName" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add A Relationship</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>

<!--- Check if session action is 'bulk' and handle modal display accordingly --->
<cfif session.pageAction is "bulk">
    <cfset session.pageAction = "view" />
    <script>
    $(document).ready(function() {
        $("#bulkModal").modal('show');
    });
    </script>

    <script>
    var table = $("#contacts_ss");
    var btn = $('#btnSelectedRows');

    function enableBtn() {
        btn.prop("disabled", table.find("input:checked").length === 0);
    }

    table.on("change", "input", enableBtn);
    enableBtn();
    </script>

    <div id="bulkModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Selected Updated Summary</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                </div>
                <div class="modal-body">
                    <cfif addedCount is not "0">
                        <p>
                            <cfoutput>#addedCount# #bt#<cfif addedCount is not "1">s</cfif> added.</cfoutput>
                        </p>
                    </cfif>
                    <cfif removedCount is not "0">
                        <p>
                            <cfoutput>#removedCount# #bt#<cfif removedCount is not "1">s</cfif> removed.</cfoutput>
                        </p>
                    </cfif>
                    <cfif skippedCount is not "0">
                        <p>
                            <cfoutput>#skippedCount# relationship<cfif skippedCount is not "1">s</cfif> skipped.</cfoutput>
                        </p>
                    </cfif>
                    <div class="form-group text-center col-md-12">
                        <a href="/app/contacts/">
                            <button class="btn btn-primary waves-effect waves-light" type="button" style="background-color: ##406e8e; border: ##406e8e;">Continue</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</cfif>

<!--- If session action is not 'bulk', hide the bulk modal --->
<cfif session.pageAction is not "bulk">
    <script>
    $(document).ready(function() {
        $("#bulkModal").modal('hide');
    });
    </script>
</cfif>

<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="button-list nomobile">
                    <button type="button" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddName" data-bs-placement="top" class="btn btn-warning waves-effect waves-light">
                        <span class="btn-label"><i class="fe-user-plus"></i></span>Add Relationship
                    </button>
                    <button type="button" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#exampleModal4" data-bs-placement="top" class="btn btn-warning waves-effect waves-light">
                        <span class="btn-label"><i class="mdi mdi-tag-plus"></i></span>Add Tag to Selected
                    </button>
                    <button type="button" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#exampleModal3" data-bs-placement="top" class="btn btn-warning waves-effect waves-light">
                        <span class="btn-label"><i class="mdi mdi-checkbox-multiple-marked"></i></span>Add System to Selected
                    </button>
                    <button type="button" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-placement="top" class="btn btn-warning waves-effect waves-light">
                        <span class="btn-label"><i class="mdi mdi-tag-plus-outline"></i></span>Search Tag
                    </button>
                    <a href="/app/contacts-import/" target="import" class="text-reset font-18 py-1 px-2 d-inline-block" data-toggle="tooltip" data-placement="top" title="Import Relationships" data-original-title="Import Relationships">
                        <button type="button" class="btn btn-warning waves-effect waves-light">
                            <span class="btn-label"><i class="fe-upload"></i></span>Import Relationships
                        </button>
                    </a>
                </div>

                <ul class="nav nav-pills navtab-bg nav-justified">
                    <li class="nav-item">
                        <a href="#all" data-bs-toggle="tab" aria-expanded="true" class="nav-link active"> All </a>
                    </li>
                    <li class="nav-item">
                        <a href="#targeted" data-bs-toggle="tab" aria-expanded="false" class="nav-link"> Targeted </a>
                    </li>
                    <li class="nav-item">
                        <a href="#followup" data-bs-toggle="tab" aria-expanded="false" class="nav-link"> Follow Up </a>
                    </li>
                    <li class="nav-item">
                        <a href="#maintenance" data-bs-toggle="tab" aria-expanded="false" class="nav-link"> Maintenance </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane" id="all">
                        <cfset contactsTable = "contacts_ss" />
                        <cfinclude template="/include/contactsTable.cfm" />
                    </div>

                    <div class="tab-pane show active" id="targeted">
                        <cfset contactsTable = "contacts_ss_target" />
                        <cfinclude template="/include/contactsTable.cfm" />
                    </div>

                    <div class="tab-pane" id="followup">
                        <cfset contactsTable = "contacts_ss_followup" />
                        <cfinclude template="/include/contactsTable.cfm" />
                    </div>

                    <div class="tab-pane" id="maintenance">
                        <cfset contactsTable = "contacts_ss_maint" />
                        <cfinclude template="/include/contactsTable.cfm" />
                    </