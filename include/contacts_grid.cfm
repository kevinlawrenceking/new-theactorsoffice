
<cfset defrows = defrows />


<div class="view-toggle d-flex mb-3">
    <button id="toggle-table" class="btn btn-primary me-2">
        <i class="mdi mdi-menu fa-1x"></i>
    </button>
    <button id="toggle-gallery" class="btn btn-secondary">
        <i class="mdi mdi-drag fa-1x"></i>
    </button>
</div>


<div class="container">
  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-3">
    <cfloop query="myteam">


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

        <!--- Assign card values dynamically --->
        <cfset card_header="Yes"/>
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

        <!--- Assign ribbon values dynamically --->
        <Cfloop query="rels">
          <cfif rels.currentrow eq 1>
            <Cfset card_ribbon1=rels.systemType/>
          <cfelseif rels.currentrow eq 2>
            <Cfset card_ribbon2=rels.systemType/>
          </cfif>
        </Cfloop>


      <cfinclude template="/include/card.cfm" />
    </cfloop>
  </div> <!--- end row --->
</div> <!--- end container --->










