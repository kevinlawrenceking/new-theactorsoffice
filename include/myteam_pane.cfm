<!--- This ColdFusion page displays the user's team members and allows adding new members from existing relationships or creating new ones. --->
<cfinclude template="/include/qry/getMyTeam.cfm"/>

<link href="https://cdn.materialdesignicons.com/6.5.95/css/materialdesignicons.min.css" rel="stylesheet">

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
    <!--- Start of card grid container --->
    <div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-3">
      <!--- Loop through the myteam query --->

      <cfloop query="myteam">
        <Cfset currentid=myteam.contactid/>

        <cfinclude template="/include/qry/profiles_516_1.cfm"/>
        <cfinclude template="/include/qry/getRemindersByRelationship.cfm"/>

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
        <Cfparam name="card_social" default="Yes"/>
        <Cfparam name="card_avatar" default="No"/>
        <Cfparam name="card_social" default=""/>
        <cfparam name="card_footer_text" default=""/>
        <cfparam name="card_top_ribbon" default=""/>
        <Cfparam name="ribbon_icon" default=""/>
        <Cfparam name="card_footer_text" default=""/>
        <Cfparam name="card_icon" default=""/>
        <Cfparam name="card_ribbon1" default=""/>
        <Cfparam name="card_ribbon12" default=""/>
<Cfparam name="aud_cat_icon" default=""/>
        <!--- Assign card values dynamically --->
        <cfset card_header="Yes"/>
        <cfset card_social="Yes"/>
        <cfset card_name=myteam.card_name/>
        <cfset card_title=myteam.card_title/>
        <cfset card_company=myteam.card_company/>
        <cfset card_email=myteam.card_email/>
        <cfset card_phone=myteam.card_phone/>
        <cfset card_details="/app/contact/?contactid=" & myteam.contactid/>
        <cfset card_delete="/app/myaccount/?new_pgid=122&ctaction=deleteitem&deletecontactid=" & myteam.contactid/>
        <cfset card_footer="Yes"/>
        <cfset card_social="Yes"/>
        <cfset card_ribbon1=""/>
        <cfset card_ribbon2=""/>
        <Cfset card_avatar = "Yes">
        <Cfparam name="card_image" default=""/>
<cfset card_avatar eq "yes">
        <cfif isimagefile("#session.userContactsPath#\#myteam.contactid#\avatar.jpg")>
          <cfset card_image="#session.userContactsUrl#/#myteam.contactid#/avatar.jpg"/>
        <cfelse>
          <cfset card_image="#application.defaultAvatarUrl#"/>

        </cfif>
<cfset card_icon = "Yes" />
        <!--- Assign ribbon values dynamically 
        <Cfloop query="rels">
          <cfif rels.currentrow eq 1>
            <Cfset card_ribbon1=rels.systemType/>
          <cfelseif rels.currentrow eq 2>
            <Cfset card_ribbon2=rels.systemType/>
          </cfif>
        </Cfloop>--->

        <cfinclude template="/include/card.cfm"/>

      </cfloop>

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
