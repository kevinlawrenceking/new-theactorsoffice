<!--- This ColdFusion page displays the user's team members and allows adding new members from existing relationships or creating new ones. --->

<cfinclude template="/include/qry/getMyTeam.cfm"/>

<link href="https://cdn.materialdesignicons.com/6.5.95/css/materialdesignicons.min.css" rel="stylesheet">

<h4>My Team</h4>

<input type="hidden" name="ctaction" value="addmember"/>

<!--- Section to add a new person to the team --->
<div class="row justify-content-center">
  <div class="col-md-3 p-2">Add a new person to your team:</div>
  <div class="col-md-4 p-2">
    <a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddContact">
      <button id="mybtns" type="submit" class="btn btn-sm btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
        Add
      </button>
    </a>
  </div>
</div>

<!--- Section to select an existing relationship --->
<form class="sel_client" action="/app/myaccount/?new_pgid=122" method="POST">
  <div class="row justify-content-center">
    <div class="col-md-3 p-2">Or select an existing relationship:</div>
    <div class="col-md-4 p-2">
      <div class="input-group">
        <input type="text" class="form-control" required="required" placeholder="Search..." name="topsearch_myteam" id="autocomplete2" autocomplete="off"/>
        <div class="input-group-append">
          <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
            <i class="fe-plus"></i> Select
          </button>
        </div>
      </div>
    </div>
  </div>
</form>






<!--- Start of card grid container --->
<div class="container mb-8">
  <div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-3">
    
    <!--- Loop through the myteam query --->
    <cfloop query="myteam">
      
      <!--- Each team member card should be inside a column div --->
      <div class="col">
        
        <!--- Restored all variable assignments --->
        <cfset aud_cat_icon = ""/>
        <cfset card_avatar = "Yes"/>
        <cfset card_badge_yn = "N"/>
        <cfset card_casting = "Casting"/>
        <cfset card_company = myteam.card_company/>
        <cfset card_delete = "/app/myaccount/?new_pgid=122&ctaction=deleteitem&deletecontactid=" & myteam.contactid/>
        <cfset card_delete_msg = "Are you sure you want to remove this person from your team?"/>
        <cfset card_details = "/app/contact/?contactid=" & myteam.contactid/>
        <cfset card_email = myteam.card_email/>
        <cfset card_footer_text = "Crd footer text"/>
        <cfset card_footer_type = "social"/>
        <cfset card_footer_yn = "Y"/>
      <cfset card_header_text = myteam.card_name/>
        <cfset card_header_yn = "Y"/>
        <cfset card_icon = ""/>
        <cfset card_icon_yn = "Y"/>
        <cfset card_id = myteam.contactid/>
        <cfset card_image_type = "avatar"/>
        <cfset card_image_yn = "Y"/>
  
        <cfset card_phone = myteam.card_phone/>
        <cfset card_reminder = ""/>
        <cfset card_ribbon1 = ""/>
        <cfset card_ribbon2 = ""/>
        <cfset card_ribbon_straight = ""/>
        <cfset card_social_yn = "Y"/>
        <cfset card_source = ""/>
        <cfset card_subtitle = ""/>
        <cfset card_title = myteam.card_title/>
        <cfset card_top_ribbon = ""/>
        <cfset namecolor = "medium"/>
        <cfset ribbon_icon = ""/>

        <cfset currentid = myteam.contactid/>

        <cfinclude template="/include/qry/getSocialIcons.cfm"/>
        <cfinclude template="/include/qry/getRemindersByRelationship.cfm"/>

        <!--- Assign default avatar if no image exists --->
        <cfif isimagefile("#session.userContactsPath#\#myteam.contactid#\avatar.jpg")>
          <cfset card_image="#session.userContactsUrl#/#myteam.contactid#/avatar.jpg?ver=#rand()#"/>
        <cfelse>
          <cfset card_image="#application.defaultAvatarUrl#"/>
        </cfif>

        <!--- Assign reminder values dynamically --->
        <cfloop query="rels">
          <cfif rels.currentrow eq 1>
            <cfset card_reminder = rels.systemType/>
          </cfif>
        </cfloop>

        <cfinclude template="/include/card.cfm"/>

      </div> <!--- End of col div --->

    </cfloop> <!--- end cfloop --->

  </div> <!--- end row div --->
</div> <!--- end container div --->






<!--- Team Share Section (Only One Copy Now) --->
<h4>Team Share</h4>
<cfoutput>
  <p>
    You can share with your team using the team share link:
    <strong>
      <a href="https://#host#.theactorsoffice.com/share/?uid=#uid#" target="U" title="View Teamshare" data-original-title="View Teamshare">
        https://#host#.theactorsoffice.com/share/?uid=#uid#
      </a>
    </strong>
    <br>If you click on the button you will see your report.
  </p>
</cfoutput>

<!--- JavaScript for deleting a team member --->
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
          document.getElementById('card-' + contactId).remove();
        } else {
          alert("Error: " + data.message);
        }
      })
      .catch(error => console.error('Error:', error));
    }
  }
</script>
