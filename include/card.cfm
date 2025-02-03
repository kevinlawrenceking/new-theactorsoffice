<cfoutput>
  <div class="col" id="card-#card_id#">
    <div class="tao-card-md">

      <!--- Header --->
      <cfif card_header_yn eq "Y">
        <div class="tao-card-header">
          <!--- Delete Icon (Left) --->
          <cfif card_delete neq "">
            <a href="javascript:void(0);" 
               class="text-danger trash-icon" 
               onclick="confirmDelete('#card_id#');">
              <i class="mdi mdi-trash-can-outline"></i>
            </a>
          </cfif>

          <!--- View Details Icon (Right) --->
          <cfif card_details neq "">
            <a href="#card_details#" class="text-decoration-none view-icon" title="View Details">
              <i class="mdi mdi-eye"></i>
            </a>
          </cfif>
        </div>
      </cfif>


      <!--- Contact Name (Full Width) --->
      <cfif card_name neq "">
        <p class="tao-card-name">
          <a href="#card_details#" title="#card_name#">#card_name#</a>
        </p>
      </cfif>

      <!--- Card Body (Avatar & Contact Info) --->
      <div class="tao-card-body">
  
  
        <div class="tao-card-avatar-container">
          <img src="#card_image#" alt="profile-image" class="tao-card-calendar">
        </div>

        <!--- Right Section: Contact Info --->
        <div class="tao-card-info-container">
          <!--- Title Badge --->
          <p class="tao-card-title">
            <cfif card_title neq "NULL">
              <span class="badge badge-blue">#card_title#</span>
            <cfelse>
              <span class="badge badge-blue invisible">&nbsp;</span>
            </cfif>
          </p>

          <!--- Company Name --->
          <p class="tao-card-company">
            <cfif card_company neq "NULL">#card_company#</cfif>
          </p>

          <!--- Contact Details: Phone & Email --->
          <p class="tao-card-contact">
            <span>
              <i class="fe-phone me-1 <cfif card_phone neq ''>has-content</cfif>"></i>
              <cfif card_phone neq ''>#card_phone#<cfelse>&nbsp;</cfif>
            </span>
          <span>
  <i class="mdi mdi-account-multiple <cfif card_reminder neq ''>has-content</cfif>"></i>
  <cfif card_reminder neq ''>#card_reminder#<cfelse>&nbsp;</cfif>
</span>

          </p>
        </div> 

      </div>
      <!--- End Card Body --->

      <!--- Footer (Social Icons / Text) --->
      <div class="tao-card-footer">
        <div class="tao-card-social">
      

          <cfif card_footer_type eq "social">
          <cfif card_email neq "">
     <a href="mailto:#card_email#" target="_blank" title="#card_email#">
                  <i class="fe-mail"></i>
                </a>
                </cfif>
            <cfloop query="profiles">
              <cfif profiles.valuetext neq "NULL">
                <a href="#profiles.valuetext#" target="_blank" title="#profiles.valuetype#">
                  <i class="mdi #profiles.typeiconmdi#"></i>
                </a>
              </cfif>
            </cfloop>
          <cfelseif card_footer_type eq "text">
            <span>#card_footer_text#</span>
          </cfif>
        </div>
      </div>

    </div>
    <!--- End tao-card-md --->
  </div>
  <!--- End col --->
</cfoutput>


