<cfparam name="audprojectid" default="">

<cfset userid=30 />
<cfinclude template="/include/qry/headshots_377_2.cfm" />










<div class="row pt-3 pb-3">
    <cfloop query="headshots">
        <cfoutput>
            <script>
                $(document).ready(function() {
                    $("##remoteDelete#headshots.mediaid#").on("show.bs.modal", function(event) {
                        <!--- Load delete media modal content --->
                        $(this).find(".modal-body").load("/include/remoteDeleteheadshots_auditions_xref.cfm?mediaid=#headshots.mediaid#&secid=196&audprojectid=#audprojectid#");
                    });
                });
            </script>

            <div id="remoteDelete#headshots.mediaid#" class="modal fade" tabindex="-1" role="dialog" >

                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: red;">
                            <h4 class="modal-title">Delete Media</h4>
                            <button type="button" class="close" data-bs-dismiss="modal" >
<i class="mdi mdi-close-thick"></i></button>
                        </div>
                        <div class="modal-body"></div>
                    </div>
                </div>
            </div>
        </cfoutput>

        <cfoutput>
            <div class="col-xl-2 col-lg-4 col-md-6 col-sm-12">
        <div class="p-3 text-center">
            <a href="#session.userMediaUrl#/#headshots.mediaFileName#?ver=#rand()#" data-toggle="lightbox" data-gallery="example-gallery">
                <img id="selected-headshot"
                     src="#session.userMediaUrl#/#headshots.mediaFileName#?ver=#rand()#" 
                     class="rounded img-thumbnail img-fluid"
                     style="max-width:120px; height:auto;"
                     alt="#headshots.medianame#">
            </a>
        </div>
        
        <!-- Delete Option -->
        <a class="pt-0 text-center" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteDelete#headshots.mediaid#" title="Delete media">
            <p class="p-0">
                #headshots.medianame# <i class="mdi mdi-trash-can-outline"></i>
            </p>
        </a>

        <!-- Download Button -->
        <center>
            <a class="btn-lg" href="/include/download_media.cfm?mediaid=#headshots.mediaid#">
                <i class="mdi mdi-cloud-download-outline"></i>
            </a>
        </center>
    </div>
</cfoutput>
    </cfloop>
</div>
