<!--- This ColdFusion page displays the user's team members and allows adding new members from existing relationships or creating new ones. --->
<cfinclude template="/include/qry/myteam_499_1.cfm" />  

<h4>My Team</h4>

<p>
    Select a Team Member from your existing relationships or add a new one.
</p>

  <input type="hidden" name="ctaction" value="addmember"/>
  <div class="row" style="margin: auto;">
    <div class="col-md-2 p-2">Add a new person to your team:
    </div>
    <div class="col-md-4 p-2">
      <a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddContact">
        <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
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



<div class="container-fluid">
    <div class="row">
        <!--- Loop through each team member --->
<!--- Make sure you have a container or container-fluid around your row --->
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
         

<div class="card h-100 shadow-sm border border-dark text-center">
  <!--- Card Body --->
  <div class="card-body text-center d-flex flex-column justify-content-center">
    <!--- Avatar --->
    <cfset contact_avatar_filename = "#session.userContactsPath#\#myteam.contactid#\avatar.jpg" />
    <cfif isimagefile(contact_avatar_filename)>
      <img 
        src="#session.userContactsUrl#/#myteam.contactid#/avatar.jpg?ver=#rand()#" 
        class="rounded-circle img-thumbnail avatar-xl mb-3 mx-auto d-block" 
        alt="profile-image" 
      />
    <cfelse>
      <img 
        src="#application.defaultAvatarUrl#" 
        class="rounded-circle img-thumbnail avatar-xl mb-3 mx-auto d-block" 
        alt="profile-image" 
      />
    </cfif>

    <!--- Contact Name --->
    <h5 class="card-title mb-1">
      <a href="/app/contact/?contactid=#myteam.contactid#">
        #myteam.contactname#
      </a>
    </h5>

    <!--- Tags (as badges) --->
    <p class="card-text">
      <cfloop query="mytags">
        <cfoutput>
          <span class="badge bg-secondary me-1">#mytags.valuetext#</span>
        </cfoutput>
      </cfloop>
    </p>

    <!--- Phone / Email --->
    <cfif new_phone neq "" OR new_email neq "">
      <p class="text-muted small mb-0">
        <cfif new_phone neq "">
          <i class="fe-phone me-1"></i> #new_phone#<br />
        </cfif>
        <cfif new_email neq "">
          <i class="fe-mail me-1"></i> #new_email#
        </cfif>
      </p>
    </cfif>
  </div> <!--- end .card-body --->

  <!--- Card Footer: Remove Button --->
  <div class="card-footer bg-transparent border-0 text-center">
    <a href="/app/myaccount/?new_pgid=122&ctaction=deleteitem&deletecontactid=#myteam.contactid#"
       title="Remove from team"
       class="btn btn-sm" style="background-color: ##fffff; border: none; color: ##2e4f65;"
       >
      <i class="fe-trash-2 me-1"></i> Remove
    </a>
  </div>
</div>



        </div> <!--- end col --->
      </cfoutput>
    </cfloop>
  </div> <!--- end row --->
</div> <!--- end container --->
</div>
</div>
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
