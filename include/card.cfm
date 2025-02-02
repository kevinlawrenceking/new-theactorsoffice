<cfoutput>
  <div class="col">
    <div class="tao-card-md">

      <!--- Header --->
      <cfif card_header_yn eq "Y">
        <div class="tao-card-header">
          <cfif card_delete neq "">
            <a href="#card_delete#" 
            <cfif card_delete_msg neq "">
            onclick="confirmDelete('#card_delete#');" 
            </cfif>
            title="Remove from team" class="text-danger trash-icon">
              <i class="mdi mdi-trash-can-outline"></i>
            </a>
          </cfif>
          <cfif card_details neq "">
            <a href="#card_details#" class="text-decoration-none view-icon">
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
<cfif card_delete_msg neq "">
<cfoutput>
<script>
    function confirmDelete(deleteUrl) {
        if (confirm("#card_delete_msg#")) {
            window.location.href = deleteUrl;
        }
    }
</script>
</cfoutput>
</cfif>

