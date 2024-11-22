
<!--- Include Croppie CSS and JS --->
<link rel="stylesheet" href="/app/assets/css/croppie.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.js"></script>


<!--- Includes for setting reference variables --->
<cfinclude template="/include/qry/FindRefPage_136_1.cfm"/>
<cfinclude template="/include/qry/FindRefcontacts_135_2.cfm"/>

<!--- Determine settings based on ref_pgid --->
<cfset picsize = 200 />
<cfset inputsize = ref_pgid is "9" ? 200 : 300 />

<cfoutput>
    <cfset cookie.uploadDir = "" />
    <cfset cookie.return_url = "" />
    <cfset subtitle = "" />
    <cfset image_url = "" />

    <cfif ref_pgid is "3">
        <cfset cookie.uploadDir = dir_contact_avatar_filename />
        <cfset cookie.return_url = "/app/contact/?contactid=" & contactid />
        <cfset subtitle = FindRefContacts.recordname />
        <cfset browser_contact_avatar_loc = "/media-" & host & "/users/" & userid & "/contacts/" & contactid />
        <cfset image_url = browser_contact_avatar_loc & "/avatar.jpg" />
    <cfelseif ref_pgid is "7">
        <cfset subtitle = userFirstName & " " & userLastName />
        <cfset image_url = session.userAvatarUrl />
        <cfset cookie.uploadDir = session.userAvatarPath />
        <cfset cookie.return_url = "/app/myaccount/" />
    <cfelseif ref_pgid is "9">
        <cfset subtitle = userFirstName & " " & userLastName />
        <cfset image_url = session.contactAvatarUrl />
        <cfset cookie.uploadDir = session.userAvatarPath />
        <cfset cookie.return_url = "/app/setup/" />
    </cfif>
</cfoutput>

<!--- Styles for disabling buttons --->
<style>
  .btn-success:disabled {
    color: #fff;
    background-color: #D3D3D3;
    border-color: #D3D3D3;
  }
</style>

<!--- Display Subtitle --->
<cfoutput>
    <h4>#subtitle#</h4>


<!--- Image Upload Form --->
<div class="row">
    <div id="cont">
        <h5 class="col-md-12" style="padding-bottom:20px;">Avatar has been updated!</h5>
    </div>
    <div id="selectfile">
        <h5 class="col-md-12" style="padding-bottom:20px;">Select an image on your computer and upload image. Then click Continue.</h5>
        <div class="col-md-12" style="padding-bottom:20px;">
            <strong>Select a file:</strong>
            <input type="file" id="upload">
        </div>
        <input type="hidden" name="picturebase" id="picturebase" value="">
        <div class="col-md-12">
            <div id="upload-input" style="width: #inputsize#px; height: #inputsize#px;"></div>
        </div>
        <div class="col-md-12">
            <button id="uploadbutton" class="btn upload-result btn-primary">Update</button>
        </div>
    </div>
</div>
</cfoutput>

<!--- JavaScript to Handle Croppie and File Upload --->
<script>
$(document).ready(function () {
    $('#cont').hide();
    $('#uploadbutton').hide();

    // Function to show the upload button
    function showUploadButton() {
        $('#uploadbutton')
            .attr('disabled', false)
            .show();
    }

    // Initialize Existing Image and Enable Button
    const existingImage = "<cfoutput>#image_url#</cfoutput>?ver=<cfoutput>#rand()#</cfoutput>";
    if (existingImage) {
        showUploadButton();
    }

    // Initialize Croppie
    var $uploadCrop = $('#upload-input').croppie({
        enableExif: true,
        url: existingImage,
        viewport: {
            width: <cfoutput>#picsize#</cfoutput>, 
            height: <cfoutput>#picsize#</cfoutput>, 
            type: 'circle'
        },
        boundary: {
            width: <cfoutput>#picsize#</cfoutput>, 
            height: <cfoutput>#picsize#</cfoutput>
        }
    });

    // Handle File Input Change
    $('#upload').on('change', function () {
        var reader = new FileReader();
        reader.onload = function (e) {
            $uploadCrop.croppie('bind', { url: e.target.result });
        };
        reader.readAsDataURL(this.files[0]);
    });

    // Handle Croppie Upload Result
    $('.upload-result').on('click', function () {
        $uploadCrop.croppie('result', { type: 'canvas', size: 'viewport' })
            .then(function (resp) {
                $.ajax({
                    url: "/include/image_upload2.cfm",
                    type: "POST",
                    data: { "picturebase": resp },
                    success: function () {
                        $('#upload-input').html(`
                            <img style="margin: 20px;" src="${resp}" alt="User avatar" />
                            <br>
                            <a href="<cfoutput>#cookie.return_url#</cfoutput>">
                                <button type="button" class="btn btn-primary waves-effect mb-2 waves-light">Continue</button>
                            </a>
                        `);
                        $('#uploadbutton').hide();
                        $('#selectfile').hide();
                        $('#cont').show();
                    }
                });
            });
    });
});
</script>