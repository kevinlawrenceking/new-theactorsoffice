<!--- This ColdFusion page displays the user's team members and allows adding new members from existing relationships or creating new ones. --->
<cfinclude template="/include/qry/myteam_499_1.cfm" />  

<h4>My Team</h4>

<p>
    Add a Team Member from your existing relationships or 
    <a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddContact">
        <strong>Add</strong>
    </a> a new one.
</p>

<form class="app-search" action="/app/myaccount/?new_pgid=122" method="POST">
    <input type="hidden" name="ctaction" value="addmember" />
  
    <div class="row" style="margin: auto;">
        <div class="col-md-2 p-2">Add Team Member:</div>
        <div class="col-md-3 p-2">
            <div class="input-group">
                <input type="text" class="form-control" name="topsearch_myteam" id="autocomplete2" placeholder="Search..." autocomplete="off">
                <div class="input-group-append">
                    <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
                        <i class="fe-plus"></i> Add 
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>

<div class="container-fluid">
    <div class="row">
        <!--- Loop through each team member --->
        <cfloop query="myteam">
            <cfinclude template="/include/qry/mytags_167_1.cfm" />
            <cfinclude template="/include/qry/Findphone_167_2.cfm" />
            <cfset new_phone = findphone.phone />
            <cfinclude template="/include/qry/Findemail_167_3.cfm" />
            <cfset new_email = Findemail.email />
            
            <cfoutput>
                <div class="col-xl-3 col-md-4 col-sm-6 col-xs-12 ">
                    <div class="text-center card-box border border-secondary border-1 h-100">
                        <div class="pt-1 pb-1">
                            <cfset contact_avatar_filename = "#USERCONTACTSPATH#\#myteam.contactid#\avatar.jpg" />
                            <!--- Check if the contact has an avatar image --->
                            <cfif isimagefile(contact_avatar_filename)>
                                <img src="#userContactsUrl#/#myteam.contactid#/avatar.jpg?ver=#rand()#" class="rounded-circle img-thumbnail avatar-xl" alt="profile-image">
                            <cfelse>
                                <img src="#application.defaultAvatarUrl#" class="rounded-circle img-thumbnail avatar-xl" alt="profile-image">
                            </cfif>
                            <h4 class="mt-2">
                                <A href="/app/contact/?contactid=#myteam.contactid#">#myteam.contactname#</A>
                            </h4>
                            <h5>
                                <!--- Loop through tags associated with the team member --->
                                <cfloop query="mytags">
                                    <cfoutput>#mytags.valuetext#</cfoutput>
                                </cfloop>
                            </h5>
                            <p class="small mt-1">
                                <!--- Display phone number if available --->
                                <cfif #new_phone# is not ""> 
                                    <span> #new_phone# &nbsp;</span> 
                                </cfif>          
                                <!--- Display email if available --->
                                <cfif #new_email# is not ""> 
                                    <BR>
                                    <span> #new_email#  &nbsp;</span>
                                </cfif>
                            </p>
                            <!--- Link to remove member from team --->
                            <a href="/app/myaccount/?new_pgid=122&ctaction=deleteitem&amp;deletecontactid=#myteam.contactid#" title="Remove from team" style="padding-left:10px;color:dimgrey;">
                                <span>
                                    <i class="fe-trash-2 font-10 text-muted"></i>
                                </span>
                            </a>
                        </div> <!--- end .padding --->
                    </div> 
                    <p>&nbsp;</p> <!--- end card-box --->
                </div> 
                <BR>
            </cfoutput>
        </cfloop>
    </div>
</div>

<h4>Team Share</h4>
<cfoutput>
    <p>
        You can share with your team using the team share link:  
        <strong>
            <a href="https://#host#.theactorsoffice.com/share/?u=#userid#" target="U" title="View Teamshare" data-original-title="View Teamshare">
                https://#host#.theactorsoffice.com/share/?u=#userid#
            </a>
        </strong>
        <BR>If you click on the button you will see your report.
    </p>
</cfoutput>
