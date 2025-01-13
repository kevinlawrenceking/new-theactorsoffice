<!--- This ColdFusion page displays the user's team members and allows adding new members from existing relationships or creating new ones. --->
<cfinclude template="/include/qry/myteam_499_1.cfm" />  

<h4>My Team</h4>

<p>
    Select a Team Member from your existing relationships or add a new one.
</p>

<form class="app-search" action="/app/myaccount/?new_pgid=122" method="POST">
    <input type="hidden" name="ctaction" value="addmember" />
  
    <div class="row" style="margin: auto;">
        <div class="col-md-2 p-2">Select an exising relationship:</div>
        <div class="col-md-4 p-2">
            <div class="input-group">
                <input type="text" class="form-control" required placeholder="Start typing to find name" name="topsearch_myteam" required id="autocomplete2" placeholder="Search..." autocomplete="off" />
                <div class="input-group-append">
                    <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
                        <i class="fe-plus"></i> Select 
                    </button>
                </div>
            </div>
        </div>
</form>


<div class="col-md-2 p-2">Or add a new one: </div>
  <div class="col-md-4 p-2"><a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddContact">
                    <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
                        Add 
                    </button></a>
                </div>

    </div>


<div class="container-fluid">
    <div class="row">
        <!--- Loop through each team member --->
<!-- Make sure you have a container or container-fluid around your row -->
<div class="container">
  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 g-3">
    <cfloop query="myteam">
      <cfinclude template="/include/qry/mytags_167_1.cfm" />
      <cfinclude template="/include/qry/Findphone_167_2.cfm" />
      <cfset new_phone = findphone.phone />
      <cfinclude template="/include/qry/Findemail_167_3.cfm" />
      <cfset new_email = Findemail.email />

      <cfoutput>
        <div class="col">
          <div class="card border border-secondary h-100 text-center">
            <div class="pt-3 pb-3">
              <cfset contact_avatar_filename = "#session.userContactsPath#\#myteam.contactid#\avatar.jpg" />
              <!-- Check if the contact has an avatar image -->
              <cfif isimagefile(contact_avatar_filename)>
                <img 
                  src="#session.userContactsUrl#/#myteam.contactid#/avatar.jpg?ver=#rand()#" 
                  class="rounded-circle img-thumbnail avatar-xl" 
                  alt="profile-image" 
                />
              <cfelse>
                <img 
                  src="#application.defaultAvatarUrl#" 
                  class="rounded-circle img-thumbnail avatar-xl" 
                  alt="profile-image" 
                />
              </cfif>

              <h4 class="mt-2">
                <a href="/app/contact/?contactid=#myteam.contactid#">
                  #myteam.contactname#
                </a>
              </h4>

              <!-- Tags -->
              <h5>
                <cfloop query="mytags">
                  <cfoutput>#mytags.valuetext#</cfoutput>
                </cfloop>
              </h5>

              <!-- Phone/Email -->
              <p class="small mt-1 mb-0">
                <cfif new_phone neq ""> 
                  <span>#new_phone#</span><br />
                </cfif>
                <cfif new_email neq "">
                  <span>#new_email#</span>
                </cfif>
              </p>

              <!-- Link to remove member from team -->
              <a href="/app/myaccount/?new_pgid=122&ctaction=deleteitem&deletecontactid=#myteam.contactid#"
                 title="Remove from team"
                 style="padding-left:10px; color:dimgrey;">
                <span>
                  <i class="fe-trash-2 font-10 text-muted"></i>
                </span>
              </a>
            </div> <!-- end pt-3/pb-3 -->
          </div> <!-- end card -->
        </div> <!-- end col -->
      </cfoutput>
    </cfloop>
  </div> <!-- end row -->
</div> <!-- end container -->


<h4>Team Share</h4>
<cfoutput>
    <p>
        You can share with your team using the team share link:  
        <strong>
            <a href="https://#host#.theactorsoffice.com/share/?uid=#uid#" target="U" title="View Teamshare" data-original-title="View Teamshare">
                https://#host#.theactorsoffice.com/share/?uid=#uid#
            </a>
        </strong>
        <BR>If you click on the button you will see your report.
    </p>
</cfoutput>
