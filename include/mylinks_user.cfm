<!--- This ColdFusion page handles the display and management of site links for a specific dashboard panel. --->
<cfset siteLinksService = createObject("component", "services.SiteLinksService")>
<cfset myLinksUser = siteLinksService.getSiteLinksByPanelId(dashboards.pnid)>
<cfset siteUrlList = siteLinksService.getAllUrlsByPanelId(dashboards.pnid)>
<cfset siteTypeDetails = siteLinksService.getSiteTypeDetailsByPanelId(dashboards.pnid)>

<!--- Set modal ID and title for adding a link --->
<cfset modalId = "addlink_" & siteTypeDetails.sitetypeid>
<cfset modalTitle = "Add " & myLinksUser.pntitle>
<cfinclude template="/include/modal.cfm" />

<!--- Modal for adding a link --->
<div id="#modalId#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: ##f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Add #myLinksUser.pntitle#</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<!--- Dashboard Card --->
<div class="card grid-item loaded" data-id="#dashboards.pnid#">
    <div class="card-header" id="heading_system_#dashboards.currentrow#">
        <h5 class="m-0">
            <a class="text-dark collapsed" data-bs-toggle="collapse" href="##collapse_system_#dashboards.currentrow#">
                #siteTypeDetails.sitetypename# Links
            </a>
        </h5>
    </div>
    <div class="card-body">
        <div class="row">
            <!--- Loop through site links --->
            <cfloop query="myLinksUser">
                <!--- Set modal ID and title for updating a link --->
                <cfset modalId = "updatelink_" & myLinksUser.id>
                <cfset modalTitle = siteTypeDetails.sitetypename & " Link Update">
                <cfinclude template="/include/modal.cfm" />

                <!--- Set modal ID and title for deleting a link --->
                <cfset modalId = "remoteDeleteLink_" & myLinksUser.id>
                <cfset modalTitle = siteTypeDetails.sitetypename & " Link Delete">
                <cfinclude template="/include/modal.cfm" />

                <div class="col-md-12">
                    <a href="#myLinksUser.siteurl#" class="text-reset font-14 py-1 px-1 d-inline-block" target="#myLinksUser.sitename#" title="#myLinksUser.sitename#">
                        <img class="site-icon" id="icon_#myLinksUser.id#" src="#application.RETINAICONS14URL#/#myLinksUser.siteicon#" style="width:14px;" alt="#myLinksUser.sitename#"/>
                        #myLinksUser.sitename#
                    </a>
                    <span id="edit_#myLinksUser.id#" class="hide-edit-icon" data-card-id="#dashboards.pnid#">
                        <a title="Edit" href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##updatelink_#myLinksUser.id#">
                            <i class="mdi mdi-square-edit-outline"></i>
                        </a>
                        <a class="pt-0" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteDeleteLink_#myLinksUser.id#" data-bs-placement="top" data-bs-original-title="Delete link" title="Remove #myLinksUser.sitename#" class="pl-1" style="color:red;">
                            <i class="mdi mdi-trash-can-outline"></i>
                        </a>
                    </span>
                </div>
            </cfloop>

            <div class="col-md-12 col-lg-12">
                <!--- Check if there are any active links --->
                <cfif myLinksUser.recordcount gt 0>
                    <button onclick="openAllUrls('#siteUrlList#')" style="border: 1px solid ##406E8E!important; outline: none!important; color: ##406E8E!important;" class="badge badge-light text-dark">
                        <i class="mdi mdi-book-plus-multiple"></i> Open All
                    </button>
                <cfelse>
                    <center>No active links</center>
                </cfif>
            </div>
        </div>
    </div><!--- card-body end --->

    <div class="card-footer bg-light d-flex justify-content-between">
        <cfif myLinksUser.recordcount gt 0>
            <button class="btn btn-link toggle_edit_mode" data-card-id="#dashboards.pnid#">
                <i class="mdi mdi-square-edit-outline"></i>
            </button>
        </cfif>

        <a class="btn btn-link" href="addlink.cfm" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##addlink_#siteTypeDetails.sitetypeid#">
            <i class="fe-plus-circle"></i>
        </a>
    </div><!--- end card footer --->
</div><!--- end card --->

<script>
    $(document).ready(function () {
        <!--- Loop through site links to setup modals for update and delete actions --->
        <cfloop query="myLinksUser">
            setupModalLoading("updatelink_" & myLinksUser.id, "/include/remotelinkUpdate.cfm", "userid=" & userid & "&new_id=" & myLinksUser.new_id & "&target=dashboard_new");
            setupModalLoading("remoteDeleteLink_" & myLinksUser.id, "/include/remoteDeleteFormLink.cfm", "userid=" & userid & "&new_id=" & myLinksUser.new_id & "&target=dashboard_new");
        </cfloop>

        setupModalLoading("addlink_" & siteTypeDetails.sitetypeid, "/include/remotelinkAdd.cfm", "RETINAICONS14PATH=" & URLEncodedFormat(application.retinaIcons14Path) & "&new_sitetypeid=" & siteTypeDetails.sitetypeid & "&userid=" & userid & "&target=dashboard_new");
    });
</script>

<!--- Changes made: 
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Avoided using `#` symbols within conditional checks unless essential.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Removed any `cftry` and `cfcatch` blocks entirely.
6. For any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs `##` to avoid interpretation as variables.
--->