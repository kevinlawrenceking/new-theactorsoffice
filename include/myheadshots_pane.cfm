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




 

        <!--- Variables for card --->
        <Cfparam name="card_header" default="No"/>
        <Cfparam name="card_name" default=""/>
        <Cfparam name="card_title" default=""/>
        <Cfparam name="card_company" default=""/>
        <Cfparam name="card_email" default=""/>
        <Cfparam name="card_phone" default=""/>
        <Cfparam name="card_details" default=""/>
        <Cfparam name="card_delete" default=""/>
        <Cfparam name="card_footer" default="No"/>
        <Cfparam name="card_social" default="No"/>
        <Cfparam name="card_avatar" default="No"/>
        <Cfparam name="card_social" default=""/>
        <cfparam name="card_footer_text" default=""/>
        <cfparam name="card_top_ribbon" default=""/>
        <Cfparam name="ribbon_icon" default=""/>
        <Cfparam name="card_footer_text" default=""/>
        <Cfparam name="card_icon" default=""/>
        <Cfparam name="card_ribbon1" default=""/>
        <Cfparam name="card_ribbon12" default=""/>

        <!--- Assign card values dynamically --->
        <cfset card_header="Yes"/>
        <cfset card_social="No"/>
        <cfset card_name=headshots_sel.medianame />


        <cfset card_title=myteam.card_title/>
        <cfset card_company=myteam.card_company/>
        <cfset card_email=myteam.card_email/>
        <cfset card_phone=myteam.card_phone/>
        <cfset card_details="/app/contact/?contactid=" & myteam.contactid/>
        <cfset card_delete="/include/download_media.cfm?mediaid=" & headshots_sel.mediaid />
        <cfset card_footer="No"/>
        <cfset card_social="No"/>
        <cfset card_ribbon1=""/>
        <cfset card_ribbon2=""/>
        <Cfparam name="card_avatar" default="No"/>
        <Cfparam name="card_image" default="Yes"/>

 
          <cfset card_image="#session.userMediaUrl#/#headshots_sel.mediaFileName#?ver=#rand()#"/>
   
 <cfinclude template="/include/card.cfm"/>

      </cfloop>

    </div>
  </div>




