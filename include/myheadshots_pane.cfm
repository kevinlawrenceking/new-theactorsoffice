<!--- This ColdFusion page handles the display and management of user headshots, including adding and deleting headshots through modals. --->

<script>
    $(document).ready(function() {
        $("#remoteaddHeadshot").on("show.bs.modal", function(event) {
            <!--- Load the HTML for adding a headshot into the modal body --->
            $(this).find(".modal-body").load("<cfoutput>/include/remoteaddHeadshot.cfm?userid=#userid#&src=account</cfoutput>");
        });
    });
</script>

<cfset modalid="remoteaddHeadshot" />
<cfset modaltitle="Add Headshot" />
<cfinclude template="/include/modal.cfm" />

<cfset modalid="remoteDeleteaudmedia" />
<cfset modaltitle="Delete Headshot" />
<cfinclude template="/include/modal.cfm" />

<cfinclude template="/include/qry/headshots_sel_478_1.cfm" />

<cfoutput>
    <h4 class="p-1 d-flex">My Headshots 
        <span class="ms-auto text-muted"> 
            <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##matupdate" data-bs-placement="top" title="Update Materials" data-bs-original-title="Update Materials"></a>
        </span>
    </h4>
</cfoutput>

<cfset i=0 />

<cfoutput>
    <div class="col-md-12 col-lg-12 col-xl-12 p-1 d-flex">
        <center>
            <a data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteaddHeadshot" data-bs-placement="top" title="Add media" data-bs-original-title="Add headshot" class="btn btn-xs btn-primary waves-effect waves-light">Add Headshot</a>
        </center>
    </div>
</cfoutput>

<div class="row pt-3 pb-3">

 









         <div class="container">
    <!--- Start of card grid container --->
    <div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-3">
      <!--- Loop through the myteam query --->

      <cfloop query="headshots_sel">


        <cfoutput>
            <script>
                $(document).ready(function() {
                    $("##remoteDeleteaudmedia#headshots_sel.mediaid#").on("show.bs.modal", function(event) {
                        <!--- Load the HTML for deleting a headshot into the modal body --->
                        $(this).find(".modal-body").load("/include/remoteDeleteaudmedia.cfm?mediaid=#headshots_sel.mediaid#&new_secid=999");
                    });
                });
            </script>

            <div id="remoteDeleteaudmedia#headshots_sel.mediaid#" class="modal fade" tabindex="-1" role="dialog" >

                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: red;">
                            <h4 class="modal-title">Delete Headshot</h4>
                            <button type="button" class="close" data-bs-dismiss="modal" >
<i class="mdi mdi-close-thick"></i></button>
                        </div>
                        <div class="modal-body"></div>
                    </div>
                </div>
            </div>
        </cfoutput>




         <cfset aud_cat_icon = ""/>
        <cfset card_avatar = "Yes"/>
        <cfset card_badge_yn = "N"/>
        <cfset card_casting = ""/>
        <cfset card_company = "" />
       <cfset card_delete="/include/download_media.cfm?mediaid=" & headshots_sel.mediaid />
        <cfset card_delete_msg = "Are you sure you want to delete this headshot?"/>
        <cfset card_details = "" />
        <cfset card_email = ""/>
        <cfset card_footer_text = "Crd footer text"/>
        <cfset card_footer_type = ""/>
        <cfset card_footer_yn = "N"/>
        <cfset card_header_text = myteam.card_name/>
        <cfset card_header_yn = "N"/>
        <cfset card_icon = ""/>
        <cfset card_icon_yn = "N"/>
        <cfset card_id = myteam.contactid/>
        <cfset card_image_type = "image"/>
        <cfset card_image_yn = "Y"/>
         <cfset card_image=session.userMediaUrl & "/" & headshots_sel.mediaFileName />
         <cfset card_name = headshots_sel.medianame  />
        <cfset card_phone = "" />
        <cfset card_reminder = ""/>
        <cfset card_ribbon1 = ""/>
        <cfset card_ribbon2 = ""/>
        <cfset card_ribbon_straight = ""/>
        <cfset card_social_yn = "N"/>
        <cfset card_source = ""/>
        <cfset card_subtitle = ""/>
        <cfset card_title = "title" />
        <cfset card_top_ribbon = ""/>
        <cfset namecolor = "medium"/>
        <cfset ribbon_icon = ""/>
        <cfset currentid = headshots_sel.mediaid/>

        <!--- Assign card values dynamically --->
 


   
 <cfinclude template="/include/card.cfm"/>

      </cfloop>

    </div>
  </div>


</div>

