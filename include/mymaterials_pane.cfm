<!--- This ColdFusion page handles the display and management of materials for user auditions, 
      including adding, updating, and deleting materials. --->

<!--- Ensure 'materials' variable is defined --->
<cfparam name="materials" default="" />

<!--- JavaScript to load modal content for adding new materials --->
<cfoutput>
    <script>
        $(document).ready(function() {
            // Load modal content dynamically when 'Add Material' modal is shown
            $("##remoteaddMaterial").on("show.bs.modal", function() {
                $(this).find(".modal-body").load("/include/remoteaddMaterial.cfm?userid=#userid#&src=account&new_isshare=1");
            });
        });
    </script>
</cfoutput>

<!--- Set up modals with different IDs and titles for Add, Update, and Delete Material actions --->
<cfset modalid = "remoteaddMaterial" />
<cfset modaltitle = "Add Material" />
<cfinclude template="/include/modal.cfm" />

<cfset modalid = "remoteDeleteaudmedia" />
<cfset modaltitle = "Delete Material" />
<cfinclude template="/include/modal.cfm" />

<cfset modalid = "remoteupdatematerial" />
<cfset modaltitle = "Update Material" />
<cfinclude template="/include/modal.cfm" />

<!--- Load query for retrieving materials --->
<cfinclude template="/include/qry/materials_sel.cfm" />

<!--- Modal for 'My Materials' information/help --->
<div id="mymaterialshelp" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">My Materials</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body">
                <p>There are times when you submit your own monologues, songs, or sides as your audition.</p>
                <p>To add materials in your repertoire to TAO, go to My Account and then Materials.</p>
                <p>Once added, they will appear in this list so you can easily add them to any of your auditions.</p>
            </div>
        </div>
    </div>
</div>

<!--- Page heading with link to 'My Materials' modal --->
<cfoutput>
    <h4 class="p-1 d-flex">
        My Materials &nbsp;&nbsp; 
        <a href="" title="click for details" data-bs-toggle="modal" data-bs-target="##mymaterialshelp">  
            <i class="fe-info font-14 mr-1"></i>
        </a>
    </h4>
</cfoutput>

<!--- Add Material button --->
<cfoutput>
    <div class="col-md-12 col-lg-12 col-xl-12 p-1 d-flex">
        <center>
            <a data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteaddMaterial" 
               class="btn btn-xs btn-primary waves-effect waves-light" title="Add Material">
                Add Material
            </a>
        </center>
    </div>
</cfoutput>

<!--- Table for listing materials --->
<div class="row pt-3 pb-3">
    <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped">
        <thead>
            <tr>
                <th width="50">Action</th>
                <th>Type</th>
                <th>Name</th>
                <th>Filename</th>
                <th>URL</th>
                <th>Created</th>
                <th>Audition</th>
            </tr>
        </thead>
        <tbody>
            <!--- Loop through materials query --->
            <cfloop query="headshots_sel">
                <!--- Load events for each material --->
                <cfinclude template="/include/qry/events_166_1.cfm" />
                <cfset materials = ValueList(events.audprojectid)>

                <!--- JavaScript to handle Delete and Update Modals dynamically based on media ID --->
                <cfoutput>
                    <script>
                        $(document).ready(function() {
                            // Load delete modal content dynamically
                            $("##remoteDeleteaudmedia#headshots_sel.mediaid#").on("show.bs.modal", function() {
                                $(this).find(".modal-body").load("/include/remoteDeleteaudmedia.cfm?mediaid=#headshots_sel.mediaid#&secid=196");
                            });
                        });
                    </script>

                    <!--- Delete Material Modal --->
                    <div id="remoteDeleteaudmedia#headshots_sel.mediaid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: red;">
                                    <h4 class="modal-title">Delete Material</h4>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                                        <i class="mdi mdi-close-thick"></i>
                                    </button>
                                </div>
                                <div class="modal-body"></div>
                            </div>
                        </div>
                    </div>

                    <script>
                        $(document).ready(function() {
                            // Load update modal content dynamically
                            $("##remoteupdatematerial#headshots_sel.mediaid#").on("show.bs.modal", function() {
                                $(this).find(".modal-body").load("/include/remoteupdatematerial.cfm?src=account&mediaid=#headshots_sel.mediaid#");
                            });
                        });
                    </script>

                    <!--- Update Material Modal --->
                    <div id="remoteupdatematerial#headshots_sel.mediaid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Update Material</h4>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                                        <i class="mdi mdi-close-thick"></i>
                                    </button>
                                </div>
                                <div class="modal-body"></div>
                            </div>
                        </div>
                    </div>

                    <cfdump var="#headshots_sel#" label="Headshots Query Output">
<CfaborT>

                    <!--- Table row for each material --->
                    <tr>
                        <td>
                            <a title="Edit" data-bs-toggle="modal" data-bs-target="##remoteupdatematerial#headshots_sel.mediaid#">
                                <i class="mdi mdi-square-edit-outline"></i>
                            </a>
                            <cfif events.recordcount is 0>
                                <a data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteDeleteaudmedia#headshots_sel.mediaid#"
                                   title="Delete media">
                                    <i class="mdi mdi-trash-can-outline"></i>
                                </a>
                            </cfif>
                        </td>
                        <td class="text-nowrap">#headshots_sel.mediaType#</td>
                        <td class="text-nowrap">#headshots_sel.mediaName#</td>
                        <td class="text-nowrap">
                            <a href="##" id="downloadLink_#headshots_sel.mediaid#" style="text-decoration: underline; color: blue;">
                                #headshots_sel.mediaFilename#
                            </a>
                        </td>
                        <td class="text-nowrap">
                            <cfif headshots_sel.mediaurl neq "">
                                <a href="#headshots_sel.mediaurl#" target="_blank" style="text-decoration: underline; color: blue;">
                                    #headshots_sel.mediaurl#
                                </a>
                            </cfif>
                        </td>
                        <td class="text-nowrap">
                            #dateformat(headshots_sel.mediacreated, 'm-d-YYYY')#<br />#timeformat(headshots_sel.mediacreated, 'medium')#
                        </td>
                        <td class="text-nowrap">
                            <cfif events.recordcount neq 0>
                                <a href="/app/auditions/?materials=#materials#" style="text-decoration: underline; color: blue;">
                                    #events.recordcount#
                                </a>
                            <cfelse>
                                0
                            </cfif>
                        </td>
                    </tr>

                    <!--- JavaScript for handling download link for each media item --->
                    <script type="text/javascript">
                        document.getElementById('downloadLink_#headshots_sel.mediaid#').addEventListener('click', function(e) {
                            e.preventDefault();
                            const host = '#host#';
                            const userid = '#userid#';
                            const mediafilename = '#headshots_sel.mediafilename#';
                            window.location.href = '/include/mediadownload.cfm?host=' + host + '&userid=' + userid + '&mediafilename=' + mediafilename;
                        });
                    </script>
                </cfoutput>
            </cfloop>
        </tbody>
    </table>
</div>
