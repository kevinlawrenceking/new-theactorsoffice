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

<style>
    .box-row {
        margin-bottom: 20px; /* Adjust the margin as per your requirement */
    }
</style>

<cfset modalid="remoteAddContactAud" />

<cfset modaltitle="Add Contact" />

<cfinclude template="/include/modal.cfm" />

<cfinclude template="/include/qry/audcontacts_349_1.cfm" />

<cfinclude template="/include/qry/audcontacts_sel_349_2.cfm" />

<h4>Audition Relationships</h4>

<p>
    Add a relationship from your existing relationships or 
    <a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddContactAud">
        <strong>Add</strong>
    </a> a new one. Check the dates to link them to the specific audition appointment.
</p>

<form class="app-search" action="/app/audition/?secid=175" method="POST">
    <cfoutput>  
        <input type="hidden" name="ctaction" value="addmember">
        <input type="hidden" name="audprojectid" value="#audprojectid#">
    </cfoutput>

    <div class="row">
        <div class="col-md-2 py-2">Add relationship:</div>
        <div class="col-md-3 py-2">
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

            <cfoutput>
                <div class="col-xl-3 col-md-4 col-sm-6 col-xs-12" style="padding-bottom:20px;">
                    <div class="text-center card-box border border-secondary border-1 h-100">
                        <div class="pt-1 pb-1">
                            <cfset contact_avatar_filename = "#session.userContactsPath#\#audcontacts.contactid#\avatar.jpg" />

                            <cfif isimagefile(contact_avatar_filename)>
                                <img src="#session.userContactsUrl#/#audcontacts.contactid#/avatar.jpg?ver=#rand()#" class="rounded-circle img-thumbnail avatar-xl" alt="profile-image">
                            <cfelse>
                                <img src="#application.defaultAvatarUrl#" class="rounded-circle img-thumbnail avatar-xl" alt="profile-image">
                            </cfif>

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
                            <cfif "#projectDetails.contactid#" is not "#audcontacts.contactid#">
                                <a href="/app/audition/?audprojectid=#audprojectid#&ctaction=deleteContact&amp;deletecontactid=#audcontacts.contactid#&secid=175" title="Remove from Audition" style="padding-left:10px;color:dimgrey;">
                                    <span><i class="fe-trash-2 font-10 text-muted"></i></span>
                                </a>
                            </cfif>
                        </div>
                    </div><!--- end .padding --->
                </div>
            </cfoutput>
        </cfloop>
    </div>

    <p>&nbsp;</p><!--- end card-box --->
</div><br>
