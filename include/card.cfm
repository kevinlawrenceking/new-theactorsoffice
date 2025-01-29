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
  <p class="tao-card-title">
    <cfif card_title neq "NULL">
      #card_title#
    </cfif>
  </p>

  <p class="tao-card-company">
    <cfif card_company neq "NULL">
      #card_company#
    </cfif>
  </p>

  <p class="tao-card-contact">
    <cfif card_phone neq "NULL">
      <i class="fe-phone me-1"></i> #card_phone#<br />
    </cfif>
    <cfif card_email neq "NULL">
      <a href="mailto:#card_email#"><i class="fe-mail me-1"></i> #card_email#</a>
    </cfif>
  </p>
</div>


        <Cfif card_ribbon1 neq "">
                <div class="ribbon ribbon-card ribbon-#card_ribbon1# float-end" style="position: absolute; bottom: 25px; right: 5px; margin-right: -15px;">
                  <i class="mdi mdi-access-point me-1"></i>#card_ribbon1#
                </div>
</cfif>

<Cfif card_ribbon2 neq "">
                <div class="ribbon ribbon-card ribbon-#card_ribbon2# float-end" style="position: absolute; bottom: 45px; right: 5px; margin-right: -15px;">
                  <i class="mdi mdi-access-point me-1"></i>#card_ribbon2#
                </div>
                </cfif>

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

