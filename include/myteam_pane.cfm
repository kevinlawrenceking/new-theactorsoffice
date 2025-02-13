<!--- This ColdFusion page displays the user's team members and allows adding 
      new members from existing relationships or creating new ones. --->

<cfinclude template="/include/qry/getMyTeam.cfm"/>

<link href="https://cdn.materialdesignicons.com/6.5.95/css/materialdesignicons.min.css" rel="stylesheet">

<h4>My Team</h4>

<!--- Row for “Add New Person” (modal) and “Select Existing Relationship” --->
<div class="row mb-3">
  <!--- Add New Person Column --->
  <div class="col-12 col-md-6 mb-2">
    <p class="fw-semibold">Add a new person to your team:</p>
    <a href="remoteAddContact.cfm?src=account" 
       data-bs-remote="true" 
       data-bs-toggle="modal" 
       data-bs-target="#remoteAddContact">
      <button type="button" 
              class="btn btn-sm btn-primary waves-effect waves-light"
              style="background-color: #406e8e; border: #406e8e;">
        Add
      </button>
    </a>
  </div>

  <!--- Select Existing Relationship Column --->
  <div class="col-12 col-md-6 mb-2">
    <p class="fw-semibold">Or select an existing relationship:</p>
    <form class="sel_client" action="/app/myaccount/?new_pgid=122" method="POST">
      <input type="hidden" name="ctaction" value="addmember" />
      <div class="input-group">
        <input type="text" 
               class="form-control" 
               required="required"
               placeholder="Search..." 
               name="topsearch_myteam" 
               id="autocomplete2" 
               autocomplete="off"/>
        <button id="select_contact" 
                type="submit" 
                class="btn btn-xs btn-primary waves-effect waves-light"
                style="background-color: #406e8e; border: #406e8e;">
          <i class="fe-plus"></i> Select
        </button>
      </div>
    </form>
  </div>
</div>

<!--- Card Grid: remove 'justify-content-center' so it left-aligns naturally --->
<div class="container mb-5">
  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-3">
    
    <!--- Loop through myteam to display each card --->
    <cfloop query="myteam">
      <div class="col" id="card-#myteam.contactid#">
        <!--- All your CFSET and <cfinclude> lines here. --->
        <cfset card_name = myteam.card_name />
        <cfset card_image = application.defaultAvatarUrl />
        <cfif isimagefile("#session.userContactsPath#\#myteam.contactid#\avatar.jpg")>
          <cfset card_image="#session.userContactsUrl#/#myteam.contactid#/avatar.jpg?ver=#rand()#"/>
        </cfif>

        <cfinclude template="/include/card.cfm" />
      </div>
    </cfloop>
    
  </div>
</div>

<!--- Team Share Section with extra space before it --->
<div class="mt-5">
  <h4>Team Share</h4>
  <cfoutput>
    <p>
      You can share with your team using the team share link:
      <strong>
        <a href="https://#host#.theactorsoffice.com/share/?uid=#uid#" 
           target="U" 
           title="View Teamshare">
          https://#host#.theactorsoffice.com/share/?uid=#uid#
        </a>
      </strong>
      <br>If you click on the button you will see your report.
    </p>
  </cfoutput>
</div>

<!--- JavaScript for deleting a team member (unchanged) --->
<script>
  function confirmRemove(contactId) {
    if (confirm("Are you sure you want to remove this person from your team?")) {
      fetch('/include/delete_team.cfm', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: 'contactid=' + encodeURIComponent(contactId)
      })
      .then(response => response.json())
      .then(data => {
        if (data.success) {
          document.getElementById('card-' + contactId).remove();
        } else {
          alert("Error: " + data.message);
        }
      })
      .catch(error => console.error('Error:', error));
    }
  }
</script>
