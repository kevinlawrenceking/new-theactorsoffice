<!--- Start of card layout --->
<cfoutput>
  <div class="col">
    <div class="tao-card-md">

      <!--- Card Header --->
      <div class="tao-card-header">
        <!--- Trash/Delete Icon (Left) --->
        <a href="##" title="Remove from team" class="text-danger trash-icon">
          <i class="mdi mdi-trash-can-outline"></i>
        </a>

        <!--- View Icon (Right) --->
        <a href="##" class="text-decoration-none view-icon">
          <i class="mdi mdi-eye"></i>
        </a>
      </div>

      <!--- Card Body --->
      <div class="tao-card-body">
        
        <!--- Left Section: Avatar --->
        <div class="tao-card-avatar-container">
          <img src="#card_image#"   alt="profile-image" class="tao-card-avatar">
        </div>

        <!--- Right Section: Contact Info --->
        <div class="tao-card-info-container">
             <p class="tao-card-name">
        <a href="#card_details#">#card_name#</a>
    </p>
      <!--- Title (Always Takes Space) --->
    <p class="tao-card-title">
        <cfif card_title neq "NULL"><span class="badge badge-blue">#card_title#</span><cfelse>&nbsp;</cfif>
    </p
         <!--- Company (Always Takes Space) --->
    <p class="tao-card-company">
        <cfif card_company neq "NULL">#card_company#<cfelse>&nbsp;</cfif>
    </p>

           <!--- Contact Info (Phone & Email) --->
    <p class="tao-card-contact">
        <!--- Phone (Show Icon Only if Exists) --->
        <span>
            <i class="fe-phone me-1 <cfif card_phone neq ''>has-content</cfif>"></i>
            <cfif card_phone neq ''>#card_phone#<cfelse>&nbsp;</cfif>
        </span>

        <!--- Email (Show Icon Only if Exists) --->
        <span>
            <i class="fe-mail me-1 <cfif card_email neq ''>has-content</cfif>"></i>
            <cfif card_email neq ''>
                <a href="mailto:#card_email#">#card_email#</a>
            <cfelse>&nbsp;</cfif>
        </span>
    </p>
        </div>

      </div> <!--- end tao-card-body --->

      <!--- Card Footer --->
  <!--- Card Footer --->
<div class="tao-card-footer">
    <div class="tao-card-social">
        <a href="https://facebook.com" target="_blank" title="Facebook">
            <i class="mdi mdi-facebook"></i>
        </a>
        <a href="https://instagram.com" target="_blank" title="Instagram">
            <i class="mdi mdi-instagram"></i>
        </a>
        <a href="https://twitter.com" target="_blank" title="Twitter">
            <i class="mdi mdi-twitter"></i>
        </a>
        <a href="https://linkedin.com" target="_blank" title="LinkedIn">
            <i class="mdi mdi-linkedin"></i>
        </a>
    </div>
</div>


    </div> <!--- end .tao-card-md --->
  </div> <!--- end col --->
</cfoutput>
