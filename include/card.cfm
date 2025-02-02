<cfoutput>
  <div class="col" id="card-#card_id#">
    <div class="tao-card-md">
      <!--- Header --->
      <cfif card_header_yn eq "Y">
        <div class="tao-card-header">
        <Cfoutput>
          <cfif card_delete neq "">
           <a href="javascript:void(0);" 

   class="text-danger trash-icon" 
    onclick="confirmDelete('#card_id#');">
    <i class="mdi mdi-trash-can-outline"></i>
</a>
          </cfif>
</cfoutput>


          <cfif card_details neq "">
            <a href="#card_details#" class="text-decoration-none view-icon" title="View Details">
              <i class="mdi mdi-eye"></i>
            </a>
        </cfif>
          </div>
      </cfif>

      <!--- Name (Now Full Width) --->
      <cfif card_name neq "">
        <p class="tao-card-name">
          <a href="#card_details#" title="#card_name#">#card_name#</a>
        </p>
      </cfif>

      <!--- Card Body (Avatar & Info) --->
      <div class="tao-card-body">
        <!--- Left: Avatar --->
        <div class="tao-card-avatar-container">
          <img src="#card_image#" alt="profile-image" class="tao-card-avatar"></div>

          <!--- Right: Contact Info --->
          <div class="tao-card-info-container">
            <p class="tao-card-title">
              <cfif card_title neq "NULL">
                <span class="badge badge-blue">#card_title#</span>
              <cfelse>
                <span class="badge badge-blue invisible">&nbsp;</span>
              </cfif>
            </p>
            <p class="tao-card-company">
              <cfif card_company neq "NULL">#card_company#</cfif>
            </p>
            <p class="tao-card-contact">
              <!--- Phone (Only Show if Not NULL) --->
              <span>
                <i class="fe-phone me-1 <cfif card_phone neq ''>has-content</cfif>"></i>
                <cfif card_phone neq ''>#card_phone#<cfelse>&nbsp;</cfif>
              </span>

              <!--- Email (Only Show if Not NULL) --->
              <span>
                <i class="fe-mail me-1 <cfif card_email neq ''>has-content</cfif>"></i>
                <cfif card_email neq ''>
                  <a href="mailto:#card_email#">#card_email#</a>
                <cfelse>&nbsp;</cfif>
              </span>
            </p>
          </div>
        </div>
              <div class="ribbon ribbon-card ribbon-#card_ribbon1# float-end" style="position: absolute; bottom: 25px; right: 5px; margin-right: -15px;">
                  <i class="mdi mdi-access-point me-1"></i>#card_ribbon1#
                </div>
</cfif>

<Cfif card_ribbon2 neq "">
                <div class="ribbon ribbon-card ribbon-#card_ribbon2# float-end" style="position: absolute; bottom: 45px; right: 5px; margin-right: -15px;">
                  <i class="mdi mdi-access-point me-1"></i>#card_ribbon2#
                </div>
                </cfif>

        <!--- Footer (Social Icons) --->
        <div class="tao-card-footer">

          <div class="tao-card-social">

            <cfif card_footer_type eq "social">
              <cfloop query="profiles">
                <cfif profiles.valuetext neq "NULL">
                  <a href="#profiles.valuetext#" target="_blank" title="#profiles.valuetype#">
                    <i class="mdi #profiles.typeiconmdi#"></i>
                  </a>
                </cfif>
              </cfloop>

            <cfelseif card_footer_type eq "text">
              <span>#card_footer_text#</span>
            <cfelseif card_footer_type eq "icons">

            </cfif>
          </div>

          

        </div>

      </div>
      <!--- end tao-card-md --->
    </div>
    <!--- end col --->
  </cfoutput>

