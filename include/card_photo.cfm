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

        <!-- Footer with Name, Lighthouse, and Trash Icons -->
        <div class="tao-card-image-footer">
            <div class="photo-name">#card_name#</div>
            <div class="icon-container">
    
                <i class="mdi mdi-trash-can" data-bs-toggle="modal" data-bs-target="##remoteDeleteaudmedia#currentid#"></i> <!-- Trash Icon -->
            </div>
        </div>
    </div>
</cfoutput>
