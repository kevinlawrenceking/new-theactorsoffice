<cfoutput>
  <div class="col" id="card-#card_id#">

    <cfif card_details neq "">
      <a href="#card_details#" title="View Details">
      </cfif>
      <div class="tao-card-md">

        <!--- Header --->
        <cfif card_header_yn eq "Y">
          <div class="tao-card-header tao-card-header-#namecolor#">
            <cfif card_header_text neq "">
              <span class="tao-card-header-text">#card_header_text#</span>
            </cfif>
          </div>
        </cfif>

        <!--- Contact Name (Full Width) --->
        <cfif card_name neq "">
          <p class="tao-card-name">
            #card_name#
          </p>

        </cfif>

        <!--- Card Body (Avatar & Contact Info) --->
        <div class="tao-card-body">

        <!--- Top Ribbon (e.g., "Booked") ---> 
<cfif card_top_ribbon neq ""> 
    <div class="ribbon-box">
        <div class="ribbon-two">#card_top_ribbon#</div>
    </div> 
</cfif>

          <cfif card_image_yn eq "Y">
            <div class="tao-card-image-container">
              <div class="tao-card-#card_image_type#">
                <img src="#card_image#" alt="profile-image" class="tao-card-#card_image_type#">

                  <!--- Show Year if Calendar Type --->
                  <cfif card_image_type eq "calendar">
                    <div class="calendar-year">#DateFormat('5/1/2025', 'yyyy')#</div>
                  </cfif>
                </div>
              </div>
            </cfif>

            <!--- Right Section: Contact Info --->
            <div class="tao-card-info-avatar">
              <!--- Title Badge --->
              <p class="tao-card-title">
                <cfif card_badge_yn eq "Y">
                  <span class="badge badge-blue">
                    <cfif card_title neq "NULL">#card_title#<cfelse>&nbsp;</cfif>
                  </span>
                <cfelse>
                  #card_title#
                  <cfif card_subtitle neq "">
                    <br>
                      <span class="tao-card-subtitle">#card_subtitle#</span>
                    </cfif>
                  </cfif>
                </p>

                <!--- Company Name --->
                <p class="tao-card-company">
                  <cfif card_company neq "NULL">#card_company#</cfif>

                </p>

           <!--- Contact Details: Source, Casting, Phone, Reminder --->
<p class="tao-card-contact">
  <cfif card_source neq "">
    <span class="contact-item">
      <i class="mdi mdi-pin <cfif card_source neq ''>has-content</cfif>"></i>
      <cfif card_source neq ''>#card_source#<cfelse>&nbsp;</cfif>
    </span>
  </cfif>
  <cfif card_casting neq "">
    <span class="contact-item">
      <i class="mdi mdi-clipboard-account <cfif card_casting neq ''>has-content</cfif>"></i>
      <cfif card_casting neq ''>#card_casting#<cfelse>&nbsp;</cfif>
    </span>
  </cfif>
  <cfif card_phone neq "">
    <span class="contact-item">
      <i class="fe-phone me-1 <cfif card_phone neq ''>has-content</cfif>"></i>
      <cfif card_phone neq ''>#card_phone#<cfelse>&nbsp;</cfif>
    </span>
  </cfif>
  <cfif card_reminder neq "">
    <span class="contact-item">
      <i class="mdi mdi-account-multiple <cfif card_reminder neq ''>has-content</cfif>"></i>
      <cfif card_reminder neq ''>#card_reminder#<cfelse>&nbsp;</cfif>
    </span>
  </cfif>
</p>

              </div>

            </div>
            <!--- End Card Body --->

            <Cfif card_footer_yn eq "Y">
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
            </cfif>

          </div>
          <!--- End tao-card-md --->
          <cfif card_details neq "">
          </a>
        </cfif>
      </div>

      <!--- End col --->
    </cfoutput>
