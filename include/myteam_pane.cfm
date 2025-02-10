<!--- This ColdFusion page displays the user's team members and allows adding new members from existing relationships or creating new ones. --->
<cfinclude template="/include/qry/getMyTeam.cfm"/>

<link href="https://cdn.materialdesignicons.com/6.5.95/css/materialdesignicons.min.css" rel="stylesheet">

  <h4>My Team</h4>

  <input type="hidden" name="ctaction" value="addmember"/>

  <div class="row" style="margin: auto;">
    <div class="col-md-3 p-2">Add a new person to your team:
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
      <div class="col-md-3 p-2">Or select an existing relationship:</div>
      <div class="col-md-4 p-2">
        <div class="input-group">
          <input type="text" class="form-control" required="required" placeholder="Search..." name="topsearch_myteam" id="autocomplete2" autocomplete="off"/>
          <div class="input-group-append">
            <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
              <i class="fe-plus"></i>
              Select
            </button>
          </div>
          <!--- end input-group-append --->
        </div>
        <!--- end input-group --->
      </div>
      <!--- end col-md-4 p-2 --->
    </div>
    <!--- end row --->
  </form>
<div style="margin-bottom: 20px;">

<!--- Start of card grid container --->
<div class="container mb-8">
  <div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-3">
    
    <!--- Loop through the myteam query --->
    <cfloop query="myteam">
   
    </cfloop>
    <!--- end cfloop --->

  </div>
  <!--- end row div --->
</div>
<!--- end container div --->



  
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

    <script>
      function confirmDelete(contactId) {
        if (confirm("<cfoutput>#card_delete_msg#</cfoutput>")) {
          fetch('/include/delete_team.cfm', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'contactid=' + encodeURIComponent(contactId)
          })
            .then(response => response.json())
            .then(data => {
              if (data.success) {
                document
                  .getElementById('card-' + contactId)
                  .remove();
              } else {
                alert("Error: " + data.message);
              }
            })
            .catch(error => console.error('Error:', error));
        }
      }
    </script>
