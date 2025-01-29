<!--- Start of card layout --->
<cfoutput>
  <div class="col">


    <div class="tao-card-md ribbon-box">
      
      <!--- Card Header --->
      <cfif card_header eq "Yes">
        <div class="tao-card-header">
          <cfif card_delete neq "">
            <a href="#card_delete#" title="Remove from team" class="text-danger">
              <i class="fe-trash-2"></i>
            </a>
          </cfif>
          <cfif card_details neq "">
            <a href="#card_details#" class="text-decoration-none">
              <i class="fe-eye" title="View Details"></i>
            </a>
          </cfif>
        </div>
      </cfif>
      
      <!--- Card Body --->
      <div class="tao-card-body">
      
        <!--- Avatar --->
        <div class="tao-card-avatar">
          <cfif isimagefile("#session.userContactsPath#\#myteam.contactid#\avatar.jpg")>
            <img src="#session.userContactsUrl#/#myteam.contactid#/avatar.jpg?ver=#rand()#" alt="profile-image" />
          <cfelse>
            <img src="#application.defaultAvatarUrl#" alt="profile-image" />
          </cfif>
        </div>
        
        <!--- Full Name --->
        <cfif card_name neq "">
          <p class="tao-card-name">
            <a href="#card_details#">#card_name#</a>
          </p>
        </cfif>
        
        <!--- Contact Info --->
        <div class="tao-card-info">
          <cfif card_title neq "">
            <p class="tao-card-title">#card_title#</p>
          </cfif>
          <cfif card_company neq "">
            <p class="tao-card-company">#card_company#</p>
          </cfif>
          <p class="tao-card-contact">
            <cfif card_phone neq "">
              <i class="fe-phone me-1"></i> #card_phone#<br />
            </cfif>
            <cfif card_email neq "">
              <a href="mailto:#card_email#"><i class="fe-mail me-1"></i> #card_email#</a>
            </cfif>
          </p>
        </div>
      </div> <!--- end .tao-card-body --->
      
      <!--- Card Footer --->
      <cfif card_footer eq "Yes">
        <div class="tao-card-footer">
          <div class="tao-card-social">

            <cfloop query="profiles">
                <a href="#profiles.valuetext#" target="#profiles.valuetext#" title="#profiles.valuetype#">
                  <cfif profiles.typeicon eq "">
                    <img src="#application.retinaIcons14Url#/customlink.png" title="#profiles.valuetext#" />
                  <cfelse>
                    <img src="#application.retinaIcons14Url#/#profiles.typeicon#" title="#profiles.valuetext#" />
                  </cfif>
                </a>
            </cfloop>


          </div>
        </div> <!--- end .tao-card-footer --->
      </cfif>

    </div> <!--- end .tao-card-md --->


  </div> <!--- end col --->
</cfoutput>

