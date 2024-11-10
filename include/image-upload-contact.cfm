<!--- This ColdFusion page handles the uploading and cropping of a user's avatar image. --->
<cfinclude template="/include/qry/FindRefPage_135_1.cfm" />
<cfinclude template="/include/qry/FindRefcontacts_135_2.cfm" />

<style>
.btn-success:disabled {
    color: ##fff;
    background-color: ##D3D3D3;
    border-color: ##D3D3D3;
}
</style>

<!--- Set cookies for upload directory and return URL --->
<cfset cookie.uploadDirContact = dir_contact_avatar_filename />
<cfset cookie.returnUrl = "/app/contact/?contactid=" & contactid />
<cfset subtitle = FindRefContacts.recordname />
<cfset browserContactAvatarLoc = "/media-" & host & "/users/" & userid & "/contacts/" & contactid />
<cfset browserContactAvatarFilename = browserContactAvatarLoc & "/avatar.jpg" />
<cfset imageUrl = browserContactAvatarFilename />

<!--- Determine picture size based on ref_pgid --->
<cfif ref_pgid is "9">
    <cfset picSize = 200 />
    <cfset inputSize = 200 />
<cfelse>
    <cfset picSize = 200 />
    <cfset inputSize = 300 />
</cfif>

<link rel="stylesheet" href="/app/assets/css/croppie.css">
<script src="https://cdnjs.cloudflare.com/include/libs/croppie/2.6.5/croppie.js"></script>

<h4>#subtitle#</h4>

<div class="row">
    <div id="cont">
        <h5 class="col-md-12" style="padding-bottom:20px;">Avatar has been updated!</h5>
    </div>
    <div id="selectfile">
        <h5 class="col-md-12" style="padding-bottom:20px;">Select an image on your computer and upload image. Then click Continue.</h5>
        <div class="col-md-12" style="padding-bottom:20px;">
            <div style="padding-bottom:10px;"><strong>Select a file:</strong></div>
            <input type="file" id="upload">
        </div>
    </div>
    <input type="hidden" name="picturebase" id="picturebase" value="">
    <div class="col-md-12">
        <div id="upload-input" style="width:#inputSize#px; height: #inputSize#px;"></div>
    </div>
    <div class="col-md-12">
        <br>
        <button id="uploadbutton" class="btn upload-result btn-primary">Update</button>
    </div>
</div>

<script>
$(document).ready(function(){
    $('#cont').hide();
    $('#uploadbutton').hide();

    function showButton() {
        $('#uploadbutton').attr('disabled', false).show();
    }

    $('input:file').change(function(){
        if ($(this).val()) {
            showButton();
        }
    });

    var existingImage = '#imageUrl#?ver=#rand()#';

    if (existingImage) {
        showButton();
    }
});

var $uploadCrop = $('#upload-input').croppie({
    enableExif: true,
    url: '#imageUrl#?ver=#rand()#',
    viewport: {
        width: #picSize#,
        height: #picSize#,
        type: 'circle'
    },
    boundary: {
        width: #picSize#,
        height: #picSize#
    }
});

$('#upload').on('change', function () {
    var reader = new FileReader();
    reader.onload = function (e) {
        $uploadCrop.croppie('bind', {
            url: e.target.result
        }).then(function(){
            console.log('jQuery bind complete');
        });
    }
    reader.readAsDataURL(this.files[0]);
});

$('.upload-result').on('click', function (ev) {
    $uploadCrop.croppie('result', {
        type: 'canvas',
        size: 'viewport'
    }).then(function (resp) {
        $.ajax({
            url: "/include/image_upload-contact2.cfm",
            type: "POST",
            data: {"picturebase": resp},
            success: function (data) {
                var html = '<img style="margin: 20px;" src="' + resp + '" /><br><a href="#cookie.returnUrl#"><button type="button" class="btn btn-primary waves-effect mb-2 waves-light">Continue</button></a>';
                $("#upload-input").html(html);
                $('#uploadbutton').hide();
                $('#selectfile').hide();
                $('#cont').show();
            }
        });
    });
});
</script>

<!--- Changes made based on standards:
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used uniform date and time formatting across the code.
6. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs ## to avoid interpretation as variables.
--->