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
          <img src="#card_image#"  alt="profile-image" class="tao-card-avatar">
        </div>

        <!--- Right Section: Contact Info --->
        <div class="tao-card-info-container">
          <p class="tao-card-name">John Doe</p>
          <p class="tao-card-title">Actor / Performer</p>
          <p class="tao-card-contact">
            <span><i class="fe-phone"></i> (123) 456-7890</span>
            <span><i class="fe-mail"></i> johndoe@email.com</span>
          </p>
        </div>

      </div> <!--- end tao-card-body --->

      <!--- Card Footer --->
      <div class="tao-card-footer">
        <div class="tao-card-social">
          <a href="##"><img src="/path-to/facebook-icon.png" alt="Facebook"></a>
          <a href="##"><img src="/path-to/twitter-icon.png" alt="Twitter"></a>
          <a href="##"><img src="/path-to/linkedin-icon.png" alt="LinkedIn"></a>
        </div>
      </div>

    </div> <!--- end .tao-card-md --->
  </div> <!--- end col --->
</cfoutput>
