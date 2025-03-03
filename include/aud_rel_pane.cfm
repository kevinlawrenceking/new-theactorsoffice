<!--- This ColdFusion page handles the addition of audition relationships and displays existing contacts with their details. --->
<cfparam name="dbug" default="N" />
<cfparam name="audprojectid" default="0" />

<script>
    $(document).ready(function() {
        $("#remoteAddContactAud").on("show.bs.modal", function(event) {
            <!--- Load the modal content for adding a contact --->
            $(this).find(".modal-body").load("<cfoutput>/include/remoteAddContactAud.cfm?userid=#userid#&audprojectid=#audprojectid#&src=audition&tagtypes=all</cfoutput>");
        });
    });
</script>

<cfset modalid="remoteAddContactAud" />

<cfset modaltitle="Add Contact" />

<cfinclude template="/include/modal.cfm" />

<cfinclude template="/include/qry/audcontacts_349_1.cfm" />

<cfinclude template="/include/qry/audcontacts_sel_349_2.cfm" />

<h4>Audition Relationships</h4>



  <div class="row" style="margin: auto;">
    <div class="col-md-2 p-2">Add a new person to your audition:
    </div>
    <div class="col-md-4 p-2">
        <a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddContactAud">
        <button id="mybtns" type="submit" class="btn btn-sm btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
          Add
        </button>
      </a>
    </div>
  </div>


<form class="app-search" action="/app/audition/?secid=175" method="POST">
    <cfoutput>  
        <input type="hidden" name="ctaction" value="addmember" />
        <input type="hidden" name="audprojectid" value="#audprojectid#" />
    </cfoutput>

<div class="row" style="margin: auto;">
        <div class="col-md-2 p-2">Or select an existing relationship:</div>
        <div class="col-md-4 p-2">
            <div class="input-group">
                <select class="form-control" name="autocomplete_aud" id="autocomplete_audx">
                    <option value="">Select Contact...</option>
                    <!--- Loop through the audcontacts query to populate the select list --->
                    <cfloop query="audcontacts_sel">
                        <cfoutput>
                            <option value="#contactname#">#contactname#</option>
                        </cfoutput>
                    </cfloop>
                </select>
                <div class="input-group-append">
                    <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="height: 37.3889px">
                        <i class="fe-plus"></i> Add 
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!--- Check if there are any events without booking --->
    <cfif events_nobooking.recordcount gt 0>
        <cfset events_list_nobooking = valuelist(events_nobooking.eventid) />
    <cfelse>
        <cfset events_list_nobooking = 0 />
    </cfif>
    <cfoutput>
        <input type="hidden" name="events_list_nobooking" value="#events_list_nobooking#" />
    </cfoutput>
</form>

<div class="container-fluid">
    <div class="row box-row mb-3">
        <!--- Loop through the audcontacts to display each contact's details --->
        <cfloop query="audcontacts">
            <cfinclude template="/include/qry/mytags_48_1.cfm" />
            <cfinclude template="/include/qry/Findphone_48_2.cfm" />
            <cfset new_phone = Findphone.phone />
            <cfinclude template="/include/qry/Findemail_48_3.cfm" />
            <cfset new_email = Findemail.email />



 <div class="col" id="<cfoutput>card-#audcontacts.contactid#</cfoutput>">
<Cfoutput>
   <cfif isimagefile(contact_avatar_filename)>
                                <cfset card_image ="#session.userContactsUrl#/#audcontacts.contactid#/avatar.jpg?ver=#rand()#"/>
                            <cfelse>
                                <cfset card_image ="#application.defaultAvatarUrl#" />
                            </cfif>

</cfoutput>

        <!--- All the variable assignments that card.cfm depends on --->
        <cfset aud_cat_icon           = "" />
        <cfset card_view_icon_yn      = "Y" />
        <cfset card_avatar            = "Yes" />
        <cfset card_badge_yn          = "Y" />
        <cfset card_casting           = "" />
        <cfset card_company           = "Company" />
        <cfset card_delete            = "" />
        <cfset card_delete_msg        = "" />
        <cfset card_remove            = "/app/audition/?audprojectid=" & audprojectid & "&ctaction=deleteContact&amp;deletecontactid=" & audcontacts.contactid & "&secid=175" />
        <cfset card_remove_msg        = "Are you sure you want to remove this person from this audition?" />
        <cfset card_details           = "/app/contact/?contactid=" & audcontacts.contactid />
        <cfset card_email             = new_email />
        <cfset card_footer_text       = "" />
        <cfset card_footer_type       = "social" />
        <cfset card_footer_yn         = "Y" />
        <cfset card_header_text       = audcontacts.contactname  />
        <cfset card_name              = "" />
        <cfset card_header_yn         = "Y" />
        <cfset card_icon              = "" />
        <cfset card_icon_yn           = "Y" />
        <cfset card_id                = audcontacts.contactid />
        <cfset card_image_type        = "avatar" />
        <cfset card_image_yn          = "Y" />
        <cfset card_image             = "" />
        <cfset card_phone             = new_phone />
        <cfset card_reminder          = "" />
        <cfset card_ribbon1           = "" />
        <cfset card_ribbon2           = "" />
        <cfset card_ribbon_straight   = "" />
        <cfset card_social_yn         = "Y" />
        <cfset card_source            = "" />
        <cfset card_subtitle          = "" />
        <cfset card_title             = "" />
        <cfset card_top_ribbon        = "" />
        <cfset namecolor              = "medium" />
        <cfset ribbon_icon            = "" />
        <cfset currentid              = audcontacts.contactid />












            <cfoutput>
                <div class="col-xl-3 col-md-4 col-sm-6 col-xs-12" style="padding-bottom:20px;">
                  <div class="card h-100 shadow-sm border border-dark text-center">
                    <div class="card-body text-center d-flex flex-column justify-content-center">
                        <div class="pt-1 pb-1">
                            <cfset contact_avatar_filename = "#session.userContactsPath#\#audcontacts.contactid#\avatar.jpg" />

                          

                            <h4 class="mt-2">
                                <a href="/app/contact/?contactid=#audcontacts.contactid#">#audcontacts.contactname#</a>
                            </h4>

                            <p class="mt-1">
                                <cfset z = 0>
                                <cfloop query="mytags">
                                    <cfset z = #z# + 1>
                                    <cfif #z# is "1">
                                        <cfoutput><span class="badge badge-blue">#mytags.valuetext#&nbsp;</span></cfoutput>
                                    </cfif>
                                </cfloop>
                            </p>
                            <p class="small mt-1">
                                <cfif #new_phone# is not "">
                                    <br>
                                    <span>Phone: #new_phone# &nbsp;</span>
                                </cfif>

                                <cfif #new_email# is not "">
                                    <br>
                                    <span>Email: #new_email# &nbsp;</span>
                                </cfif>
                            </p>
                          
                               
                                  
                        </div>
                        </div>
                    
                                      <div class="card-footer border-1 text-center">
                                        <cfif "#projectDetails.contactid#" is not "#audcontacts.contactid#">
  <a class="btn btn-sm" href="/app/audition/?audprojectid=#audprojectid#&ctaction=deleteContact&amp;deletecontactid=#audcontacts.contactid#&secid=175" title="Remove from Audition" >
      <i class="fe-trash-2 me-1"></i> Remove
    </a>
    <cfelse>
    <div style="line-height:26px;"> </div>
    </cfif>
                </div>
                    </div><!--- end .padding --->
                    

                </div>




            </cfoutput>
        </cfloop>
    </div>

    <p>&nbsp;</p><!--- end card-box --->
</div><br>
