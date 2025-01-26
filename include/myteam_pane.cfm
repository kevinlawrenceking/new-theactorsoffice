<!--- This ColdFusion page displays the user's team members and allows adding new members from existing relationships or creating new ones. --->
<cfinclude template="/include/qry/myteam_499_1.cfm" />  

<h4>My Team</h4>

  <input type="hidden" name="ctaction" value="addmember"/>
  <div class="row" style="margin: auto;">
    <div class="col-md-2 p-2">Add a new person to your team:
    </div>
    <div class="col-md-4 p-2">
      <a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddContact">
        <button id="mybtns" type="submit" class="btn btn-sm btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
          Add
        </button>
      </a>
    </div>
</div>

<form class="sel_client" action="/app/myaccount/?new_pgid=122" method="POST">
  <div class="row" style="margin: auto;">
    <div class="col-md-2 p-2">Or select an existing relationship:</div>
    <div class="col-md-4 p-2">
      <div class="input-group">
        <input type="text" class="form-control" required="required" placeholder="Search..." name="topsearch_myteam" id="autocomplete2" autocomplete="off"/>
        <div class="input-group-append">
          <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
            <i class="fe-plus"></i>
            Select
          </button>
        </div>
      </div>
    </div>
  </div>
</form>












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
          <div class="card h-100 shadow-sm border border-dark">

            <!--- Card Header --->
            <div class="card-header d-flex justify-content-between align-items-center" style="background-color: ##ededf1; color: ##595959; font-weight: bold;">
              <a href="/app/myaccount/?new_pgid=122&ctaction=deleteitem&deletecontactid=#myteam.contactid#"
                 title="Remove from team"
                 class="text-decoration-none text-danger">
                <i class="fe-trash-2"></i>
              </a>
              <a href="/app/contact/?contactid=#myteam.contactid#" class="text-decoration-none">
                <i class="fe-eye" title="View Details"></i>
              </a>
            </div>

            <!--- Card Body --->
            <div class="card-body text-center">
              <!--- Avatar --->
              <div class="mb-2">
                <cfset contact_avatar_filename = "#session.userContactsPath#\#myteam.contactid#\avatar.jpg" />
                <cfif isimagefile(contact_avatar_filename)>
                  <img 
                    src="#session.userContactsUrl#/#myteam.contactid#/avatar.jpg?ver=#rand()#" 
                    class="rounded-circle img-thumbnail avatar-md" 
                    alt="profile-image" 
                  />
                <cfelse>
                  <img 
                    src="#application.defaultAvatarUrl#" 
                    class="rounded-circle img-thumbnail avatar-md" 
                    alt="profile-image" 
                  />
                </cfif>
              </div>

              <!--- Full Name --->
              <p class="mb-1" style="font-weight: bold; font-size: 1.2rem;">
                #myteam.contactname#
              </p>

              <!--- Contact Info --->
              <div>
                <!--- Title --->
                <p class="mb-1" style="font-weight: bold;">
                  Makeup Artist
                </p>

                <!--- Company --->
                <p class="mb-1" style="font-size: smaller; font-weight: bold; color: ##595959;">
                  Dummy Company Name
                </p>

                <!--- Phone / Email --->
                <p class="text-muted small mb-0">
                  <cfif new_phone neq "">
                    <i class="fe-phone me-1"></i> #new_phone#<br />
                  </cfif>
                  <cfif new_email neq "">
                    <i class="fe-mail me-1"></i> #new_email#
                  </cfif>
                </p>
              </div>
            </div> <!--- end .card-body --->

            <!--- Card Footer --->
            <div class="card-footer border-1 text-center" style="padding-top: 1rem;">
              <!--- Social Media Icons --->
              <div>
                <a href="##" class="text-decoration-none me-2" title="Facebook">
                  <i class="fe-facebook"></i>
                </a>
                <a href="##" class="text-decoration-none me-2" title="Twitter">
                  <i class="fe-twitter"></i>
                </a>
                <a href="##" class="text-decoration-none" title="LinkedIn">
                  <i class="fe-linkedin"></i>
                </a>
              </div>
            </div>
          </div>
        </div> <!--- end col --->
      </cfoutput>
    </cfloop>
  </div> <!--- end row --->
</div> <!--- end container --->









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
