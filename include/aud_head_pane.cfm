<!--- This ColdFusion page handles the display and management of media headshots, including modals for selection and deletion. --->
<cfinclude template="/include/qry/audmedia.cfm" />
<cfinclude template="/include/qry/types_44_1.cfm" />
<cfinclude template="/include/qry/audlinks_44_2.cfm" />

<cfset modalId = "remoteSelectHeadshot" />
<cfset modalTitle = "Select a Headshot" />
<cfinclude template="/include/modal.cfm" />

<cfset modalId = "remoteSelectMaterial" />
<cfset modalTitle = "Select Material" />
<cfinclude template="/include/modal.cfm" />

<script>
    $(document).ready(function() {
        $("##remoteSelectHeadshot").on("show.bs.modal", function(event) {
            $(this).find(".modal-body").load("/include/remoteSelectHeadshot.cfm?selected_eventid=#eventId#&eventid=#eventId#&audProjectId=#audProjectId#&secid=196");
        });
    });
</script>

<script>
    $(document).ready(function() {
        $("##remoteAdd").on("show.bs.modal", function(event) {
            $(this).find(".modal-body").load("/include/remotaudmatadd.cfm?eventid=#eventId#&audProjectId=#audProjectId#&secid=196");
        });
    });
</script>

<div id="remoteAdd" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: ##f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Upload Media</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<cfset i = 0 />

<div class="col-md-12 col-lg-12 col-xl-12 p-1 d-flex">
    <center>
        <a data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteSelectHeadshot" data-bs-placement="top" title="Select Headshots" data-bs-original-title="Add media" class="btn btn-xs btn-primary waves-effect waves-light">My Headshots</a>
    </center>
</div>

<div class="row pt-3 pb-3">
    <cfloop query="headshots">
        <script>
            $(document).ready(function() {
                $("##remoteDelete#headshots.mediaId#").on("show.bs.modal", function(event) {
                    $(this).find(".modal-body").load("/include/remoteDeleteHeadshots_auditions_xref.cfm?mediaId=#headshots.mediaId#&secid=196&audProjectId=#audProjectId#");
                });
            });
        </script>

        <div id="remoteDelete#headshots.mediaId#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: red;">
                        <h4 class="modal-title">Delete Media</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                    </div>
                    <div class="modal-body"></div>
                </div>
            </div>
        </div>

        <div class="col-xl-2 col-lg-4 col-md-6 col-sm-12">
            <div class="p-3">
                <center>
                    <a href="#session.userMediaUrl#/#headshots.mediaFileName#?ver=#rand()#" data-toggle="lightbox" data-gallery="example-gallery">
                        <img src="#session.userMediaUrl#/#headshots.mediaFileName#?ver=#rand()#" class="mr-2 rounded-square gambar img-thumbnail img-fluid p-0 m-0" title="User ID: 30" style="max-width:120px; height:120px; height:100%" alt="profile-image" id="item-img-output">
                    </a>
                </center>
            </div>

            <a class="pt-0" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteDelete#headshots.mediaId#" data-bs-placement="top" title="Delete media" data-bs-original-title="Delete media">
                <p class="p-0" style="padding:10px;">
                    <center> #headshots.mediaName# <i class="mdi mdi-trash-can-outline"></i> </center>
                </p>
            </a>

            <br>

            <center>
                <a class="btn-lg" href="/include/download_media.cfm?mediaId=#headshots.mediaId#">
                    <i class="mdi mdi-cloud-download-outline"></i>
                </a>
            </center>

            <span class="p-3">&nbsp;</span>
            <span class="p-3">&nbsp;</span>
        </div>
    </cfloop>
</div>

<!--- Changes: Standardized variable names and casing, removed unnecessary `<cfoutput>` tags, ensured consistent attribute quoting, spacing, and formatting. --->