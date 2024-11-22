<cfinclude template="/include/qry/FindRefPage_136_1.cfm"/>
<cfinclude template="/include/qry/FindRefcontacts_135_2.cfm"/>

<cfset picsize=200/>
<cfset inputsize=ref_pgid is "9" ? 200 : 300/>

<link rel="stylesheet" href="/app/assets/css/croppie.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.js"></script>

  <cfoutput>
    <h4>#subtitle#</h4>


  <div class="row">
    <div id="cont">
      <h5 class="col-md-12" style="padding-bottom:20px;">Avatar has been updated!</h5>
    </div>
    <div id="selectfile">
      <h5 class="col-md-12" style="padding-bottom:20px;">Select an image on your computer and upload image. Then click Continue.</h5>
      <div class="col-md-12" style="padding-bottom:20px;">
        <strong>Select a file:</strong>
        <input type="file" id="upload"></div>
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
      <script>
        $(document).ready(function () {
          $('#cont').hide();
          $('#uploadbutton').hide();

          function showUploadButton() {
            $('#uploadbutton')
              .attr('disabled', false)
              .show();
          }

          var existingImage = "<cfoutput>#image_url#</cfoutput>?ver=<cfoutput>#rand()#</cfoutput>";
          if (existingImage) {
            showUploadButton();
          }

          var $uploadCrop = $('#upload-input').croppie({
            enableExif: true,
            url: existingImage,
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
              $uploadCrop.croppie('bind', {url: e.target.result});
            };
            reader.readAsDataURL(this.files[0]);
          });

          $('.upload-result').on('click', function () {
            $uploadCrop
              .croppie('result', {
                type: 'canvas',
                size: 'viewport'
              })
              .then(function (resp) {
                $.ajax({
                  url: "/include/image_upload2.cfm",
                  type: "POST",
                  data: {
                    "picturebase": resp
                  },
                  success: function () {
                    $('#upload-input').html('<img style="margin: 20px;" src="' + resp + '" alt="User avatar" /><br><a href="<cfoutput>#cookie.return_url#</cfoutput>"><button type="button" class="btn btn-primary waves-effect mb-2 waves-light">Continue</button></a>');
                    hideUploadButton();
                  }
                });
              });
          });
        });
      </script>