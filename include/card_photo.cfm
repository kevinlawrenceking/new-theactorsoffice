<cfoutput>
    <div class="tao-card-photo">
        <!-- Headshot Image -->
        <img src="#card_image#" alt="#card_name#">

        <!-- Magnifying Glass Icon (Opens Lightbox) -->
        <div class="image-overlay">
            <a href="#card_image#" data-lightbox="headshots" data-title="#card_name#">
                <i class="mdi mdi-magnify"></i>
            </a>
        </div>

          <div class="tao-card-footer">
        <span>#card_name#</span>
    
                <i class="mdi mdi-trash-can" data-bs-toggle="modal" data-bs-target="##remoteDeleteaudmedia#currentid#"></i> <!-- Trash Icon -->
            </div>
        </div>
    </div>
</cfoutput>
