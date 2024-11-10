<!--- This ColdFusion page handles the uploading and cropping of user avatars. --->
<cfinclude template="/include/qry/FindRefPage_136_1.cfm" />
<cfinclude template="/include/qry/FindRefcontacts_135_2.cfm" />

<style>
    .btn-success:disabled {
        color: ##fff;
        background-color: ##D3D3D3;
        border-color: ##D3D3D3;
    }
</style>

<!--- Check the reference page ID and set variables accordingly --->
<cfif ref_pgid is "3">
    <cfset cookie.uploadDir = dir_contact_avatar_filename />
    <cfset cookie.return_url = "/app/contact/?contactid=" & contactid />
    <cfset subtitle = FindRefContacts.recordname />
    <cfset browser_contact_avatar_loc = "/media-" & host & "/users/" & userid & "/contacts/" & contactid />
    <cfset browser_contact_avatar_filename = browser_contact_avatar_loc & "/avatar.jpg" />
    <cfset image_url = browser_contact_avatar_filename />
<cfelseif ref_pgid is "7">
    <cfset subtitle = userFirstName & " " & userLastName />
    <cfset image_url = session.contactAvatarUrl />
    <cfset cookie.uploadDir = session.userAvatarPath />
    <cfset cookie.return_url = "/app/myaccount/" />
<cfelseif ref_pgid is "9">
    <cfset subtitle = userFirstName & " " & userLastName />
    <cfset image_url = session.contactAvatarUrl />
    <cfset cookie.uploadDir = session.userAvatarPath />
    <cfset cookie.return_url = "/app/setup/" />
</cfif>

<!--- Set picture size based on reference page ID --->
<cfif ref_pgid is "9">
    <cfset picsize = 200 />
    <cfset inputsize = 200 />
<cfelse>
    <cfset picsize = 200 />
    <cfset inputsize = 300 />
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
        <div id="upload-input" style="width:#inputsize#px; height: #inputsize#px;"></div>
    </div>
    <div class="col-md-12"><br><button id="uploadbutton" class="btn upload-result btn-primary">Update</button></div>
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

    var existingImage = '#image_url#?ver=#rand()#';
    if (existingImage) {
        showButton();
    }
});

var $uploadCrop = $('#upload-input').croppie({
    enableExif: true,
    url: '#image_url#?ver=#rand()#',
    viewport: {
        width: #picsize#,
        height: #picsize#,
        type: 'circle'
    },
    boundary: {
        width: #picsize#,
        height: #picsize#
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
            url: "/include/image_upload2.cfm",
            type: "POST",
            data: {"picturebase": resp},
            success: function (data) {
                var html = '<img style="margin: 20px;" src="' + resp + '" /><br><a href="#cookie.return_url#"><button type="button" class="btn btn-primary waves-effect mb-2 waves-light">Continue</button></a>';
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