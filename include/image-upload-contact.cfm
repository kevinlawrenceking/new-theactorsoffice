<!--- Include necessary queries --->
<cfinclude template="/include/qry/FindRefPage_135_1.cfm"/>
<cfinclude template="/include/qry/FindRefcontacts_135_2.cfm"/>

<!--- Styling for disabled button --->
<style>
  .btn-success:disabled {
    color: #fff;
    background-color: #D3D3D3;
    border-color: #D3D3D3;
  }
</style>

<!--- Set up dynamic ColdFusion variables --->

 
  <cfset dir_contact_avatar_filename=session.userContactsUrl & "/" & contactid & "/avatar.jpg"/>
   <cfset session.dir_contact_avatar_filename=session.userContactsUrl & "/" & contactid & "/avatar.jpg"/>

 

<cfoutput>

<cfset browser_contact_avatar_filename = session.userContactsUrl & "/" & contactid & "/avatar.jpg" />
<cfset cookie.browser_contact_avatar_filename = session.userContactsUrl & "/" & contactid & "/avatar.jpg" />
  <cfset cookie.uploadDir_Contact="#dir_contact_avatar_filename#"/>
  
  <cfset dir_contact_avatar_filename=session.userContactsUrl & "/" & contactid & "/avatar.jpg"/>
  <cfset cookie.dir_contact_avatar_filename=session.userContactsUrl & "/" & contactid & "/avatar.jpg"/>

  <cfset subtitle="#FindRefContacts.recordname#"/>
  <cfset image_url="#browser_contact_avatar_filename#"/>
   <cfset cookie.image_url="#browser_contact_avatar_filename#"/>
 
  <cfset cookie.return_url="/app/contact/?contactid=#contactid#"/>
  <cfset return_url="/app/contact/?contactid=#contactid#"/>


  browser_contact_avatar_filename: #browser_contact_avatar_filename#<BR>

    cookie.uploadDir_Contact: #cookie.uploadDir_Contact#<BR>

      return_url: #return_url#<BR>

        cookie.return_url: #cookie.return_url#<BR>

          image_url: #image_url#<BR>

            cookie.image_url: #cookie.image_url#<BR>





</cfoutput>

<!--- Determine picture size based on ref_pgid --->
<cfif ref_pgid is "9">
  <cfset picsize=200/>
  <cfset inputsize=200/>
<cfelse>
  <cfset picsize=200/>
  <cfset inputsize=300/>
</cfif>

<link rel="stylesheet" href="/app/assets/css/croppie.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.js"></script>

  <h4>
    <cfoutput>#subtitle#</cfoutput>
  </h4>
  <div class="row">
    <div id="cont">
      <h5 class="col-md-12" style="padding-bottom:20px;">Avatar has been updated!</h5>
    </div>
    <div id="selectfile">
      <h5 class="col-md-12" style="padding-bottom:20px;">Select an image on your computer and upload it. Then click Continue.</h5>
      <div class="col-md-12" style="padding-bottom:20px;">
        <div style="padding-bottom:10px;">
          <strong>Select a file:</strong>
        </div>
        <input type="file" id="upload"></div>
      </div>
      <form>
        <input type="hidden" name="picturebase" id="picturebase" value="">
          <div class="col-md-12">
            <div id="upload-input" style="width:<cfoutput>#inputsize#</cfoutput>px; height:<cfoutput>#inputsize#</cfoutput>px;"></div>
          </div>
          <div class="col-md-12">
            <br>
              <button id="uploadbutton" class="btn upload-result btn-primary">Update</button>
            </div>
          </div>

          <!--- JavaScript for handling Croppie and uploads --->

          <script>
            $(document).ready(function () {
              $('#cont').hide();
              $('#uploadbutton').hide();

              //--- Function to show the upload button ---//
              function showButton() {
                $('#uploadbutton')
                  .attr('disabled', false)
                  .show();
              }

              //--- Change event for file input ---//
              $('input:file').change(function () {
                if ($(this).val()) {
                  showButton();
                }
              });

              var existingImage = '<cfoutput>#image_url#</cfoutput>?ver=<cfoutput>#rand()#&contactid=#cookie.contactid#</cfoutput>';
              if (existingImage) {
                showButton();
              }
            });

            var $uploadCrop = $('#upload-input').croppie({
              enableExif: true,
              url: '<cfoutput>#image_url#</cfoutput>?ver=<cfoutput>#rand()#</cfoutput>',
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

            //--- Change event for the upload input ---//
            $('#upload').on('change', function () {
              var reader = new FileReader();
              reader.onload = function (e) {
                $uploadCrop
                  .croppie('bind', {url: e.target.result})
                  .then(function () {
                    console.log('Croppie bind complete');
                  });
              };
              reader.readAsDataURL(this.files[0]);
            });

            //--- Click event for the upload result button ---//
            $('.upload-result').on('click', function (ev) {
              $uploadCrop
                .croppie('result', {
                  type: 'canvas',
                  size: 'viewport'
                })
                .then(function (resp) {
                  $.ajax({
                    url: "/include/image_upload-contact2.cfm",
                    type: "POST",
                    data: {
                      "picturebase": resp
                    },
                    success: function (data) {
                      var html = '<img style="margin: 20px;" src="' + resp + '" /><br><a href="<cfoutput>#cookie.return_url#</cfoutput>"><button type="button" class="btn btn-primary waves-effect mb-2 waves-light">Continue</button></a>';
                      $("#upload-input").html(html);
                      $('#uploadbutton').hide();
                      $('#selectfile').hide();
                      $('#cont').show();
                    }
                  });
                });
            });
          </script>
