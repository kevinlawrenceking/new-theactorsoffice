<!--- This ColdFusion page handles the display and management of media headshots, including modals for selection and deletion. --->

<cfinclude template="/include/qry/audmedia.cfm" />
<cfinclude template="/include/qry/types_44_1.cfm" />
<cfinclude template="/include/qry/audlinks_44_2.cfm" />

<div id="remoteselectheadshot" class="modal fade" tabindex="-1" aria-labelledby="headshotModalLabel">
    <div class="modal-dialog modal-lg"> <!-- Large modal for better viewing -->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="headshotModalLabel">Select a Headshot</h4>
                <button type="button" class="close" data-bs-dismiss="modal">
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body">
                <!-- Content will be loaded dynamically -->
                <div id="headshotGalleryContainer">
                    <p class="text-center">Loading headshots...</p>
                </div>
            </div>
        </div>
    </div>
</div>



<cfset modalid="remoteselectmaterial" />
<cfset modaltitle="Select Material" />
<cfinclude template="/include/modal.cfm" />

<cfoutput>

<script>
        $(document).ready(function() {
            $("##remoteadd").on("show.bs.modal", function(event) {
                <!--- Load media addition modal content --->
                $(this).find(".modal-body").load("/include/remotaudmatadd.cfm?eventid=#eventid#&audprojectid=#audprojectid#&secid=196");
            });
        });
    </script>


    <div id="remoteadd" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" >

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" >
                    <h4 class="modal-title" id="standard-modalLabel">Upload Media</h4>
                    <button type="button" class="close" data-bs-dismiss="modal" >
<i class="mdi mdi-close-thick"></i></button>
                </div>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>
</cfoutput>

<cfset i=0 />
    <h4 class="p-1 d-flex">My Headshots

    </h4>
<cfoutput>
    <div class="col-md-12 col-lg-12 col-xl-12 p-1 d-flex">
        <center>
<cfoutput>
    <a data-bs-remote="true" 
       data-bs-toggle="modal" 
       data-bs-target="##remoteselectheadshot" 
       data-bs-placement="top" 
       title="Select Headshots" 
       data-bs-original-title="Add media" 
       class="btn btn-xs btn-primary waves-effect waves-light"
       data-audprojectid="#audprojectid#">
        My Headshots
    </a>
</cfoutput>
        </center>
    </div>
</cfoutput>

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
                <div class="p-3">
                    <center>
                        <a href="#session.userMediaUrl#/#headshots.mediaFileName#?ver=#rand()#" data-toggle="lightbox" data-gallery="example-gallery">
                            <img src="#session.userMediaUrl#/#headshots.mediaFileName#?ver=#rand()#" class="mr-2 rounded-square gambar img-thumbnail img-fluid p-0 m-0" title="User ID: 30" style="max-width:120px; height:120px; height:100%" alt="profile-image" id="item-img-output" />
                        </a>
                    </center>
                </div>
                <a class="pt-0" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteDelete#headshots.mediaid#" data-bs-placement="top" title="Delete media" data-bs-original-title="Delete media">
                    <p class="p-0" style="padding:10px;">
                        <center>
                            #headshots.medianame# <i class="mdi mdi-trash-can-outline"></i>
                        </center>
                    </p>
                </a>
                <br>
                <center>
                    <a class="btn-lg" href="/include/download_media.cfm?mediaid=#headshots.mediaid#"> <i class="mdi mdi-cloud-download-outline"></i></a>
                </center>
                <span class="p-3">&nbsp;</span>
                <span class="p-3">&nbsp;</span>
            </div>
        </cfoutput>
    </cfloop>
</div>

<script>
$(document).ready(function() {
    $("a[data-bs-target='#remoteselectheadshot']").click(function() {
        var audprojectid = $(this).data("audprojectid");  
        $("#headshotGalleryContainer").html('<p class="text-center">Loading headshots...</p>');  
        $("#headshotGalleryContainer").load("/include/load_headshot_gallery.cfm?audprojectid=" + audprojectid);
    });

 
    $(document).on("click", ".select-headshot", function() {
        var mediaid = $(this).data("mediaid");
        var audprojectid = $(this).data("audprojectid");
        updateSelectedHeadshot(mediaid, audprojectid);
    });
});

 
function updateSelectedHeadshot(mediaid, audprojectid) {
    console.log("Sending AJAX request with:", mediaid, audprojectid); // Debugging

    $.post("/include/update_selected_headshot.cfm", 
        { mediaid: mediaid, audprojectid: audprojectid }, 
        function(response) {
            console.log("Response received:", response); // Debugging
            alert("Response: " + response); // Show full response for debugging
            $("#remoteselectheadshot").modal("hide");
        }
    ).fail(function(jqXHR, textStatus, errorThrown) {
        console.error("AJAX error:", textStatus, errorThrown); // Log errors if request fails
        alert("Error updating headshot. Check console.");
    });
}

</script>