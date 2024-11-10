<!--- This ColdFusion page handles the display and management of contact relationships, including modals for adding relationships and updating tags. --->
<cfparam name="test" default="yes" />
<cfparam name="contactExpand" default="true" />
<cfparam name="addCount" default="0" />
<cfparam name="deleteCount" default="0" />
<cfparam name="skipCount" default="0" />
<cfparam name="contactCheckVisible" default="false" />
<cfparam name="maintenanceExpand" default="false" />
<cfparam name="byTag" default="" />
<cfparam name="targetExpand" default="false" />
<cfparam name="followUpExpand" default="false" />
<cfparam name="allExpand" default="false" />
<cfparam name="pageAction" default="view" />

<!--- Set default page action in session if not defined --->
<cfif NOT isdefined('session.pageAction')>
    <cfset session.pageAction = "view">
</cfif>

<cfinclude template="/include/qry/lastUpdates.cfm" />

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
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<!--- Check if the page action is "bulk" and handle bulk actions accordingly --->
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
            btn.prop("disabled", table.find("input:checked").length === 0)
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
                    <cfif addCount is not "0">
                        <p> 
                            #addCount# #bt#<cfif addCount is not "1">s</cfif> added.
                        </p>
                    </cfif>
                    <cfif deleteCount is not "0">
                        <p> 
                            #deleteCount# #bt#<cfif deleteCount is not "1">s</cfif> removed.
                        </p>
                    </cfif>
                    <cfif skipCount is not "0">
                        <p> 
                            #skipCount# relationship<cfif skipCount is not "1">s</cfif> skipped.
                        </p>
                    </cfif>
                    <div class="form-group text-center col-md-12">
                        <A href="/app/contacts/">
                            <button class="btn btn-primary waves-effect waves-light" type="button" style="background-color: ##406e8e; border: ##406e8e;">Continue</button>
                        </A>
                    </div>
                </div>
            </div>
        </div>
    </div>
</cfif>

<!--- If the page action is not "bulk", hide the bulk modal --->
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
                <div class="row">
                    <div class="btn-group mb-2 col-xs-12">
                        <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="Click to change view">
                            #pgname#<i class="fe-menu"></i> 
                        </button>
                        <div class="dropdown-menu">
                            <cfloop query="FindOptions">
                                <a class="dropdown-item" href="/app/#pgDir#/?new_pgid=#FindOptions.pgid#">#FindOptions.pgname#</a>
                            </cfloop>
                        </div>
                    </div>
                </div>

                <!--- Display tag information if bytag is set --->
                <cfif byTag is not "">
                    <div style="padding-top:10px;padding-bottom:10px">
                        <cfset byTag = "#byTag#">
                        <A HREF="/app/contacts/">
                            <span class="badge badge-blue">#byTag# X</span>
                        </A>
                    </div>
                <cfelse>
                    <div style="padding-top:10px;padding-bottom:10px">&nbsp;</div>
                </cfif>

                <!--- Set contacts table based on pgid --->
                <cfif pgid is "113">
                    <cfset contactsTable = "contacts_ss" />
                </cfif>
                <cfif pgid is "114">
                    <cfset contactsTable = "contacts_ss_target" />
                </cfif>
                <cfif pgid is "115">
                    <cfset contactsTable = "contacts_ss_followup" />
                </cfif>
                <cfif pgid is "116">
                    <cfset contactsTable = "contacts_ss_maint" />
                </cfif>

                <cfinclude template="/include/contacts_table.cfm" />
            </div>
        </div>
    </div>
</div>

<cfinclude template="/include/qry/tags_76_1.cfm" />

<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog modal-dialog-slideout modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tag Selector</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">X</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <cfloop query="tags">
                        <div class="col-md-6">
                            <A HREF="/app/contacts?bytag=#tagname#">
                                <span class="badge badge-blue">#tagname#</span>
                            </A>
                        </div>
                    </cfloop>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div id="exampleModal3" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="standard-modalLabel">System Selected Update</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body">
                <form method="post" class="parsley-examples demo-default selectize-close-btn" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate="" novalidate="" id="myform" name="myform" action="/include/tmpcontactgroups.cfm">
                    <div class="form-group col-md-12">
                        <label for="valuetext">Addz System to all selected relationships</label>
                    </div>
                    <div class="form-group col-md-6">
                        <select id="select-system" name="newSystemType" class="form-control" data-parsley-required="" data-parsley-error-message="System is required" onchange="showDiv('hidden_div', this)">
                            <option value="">Select a System...</option>
                            <