<cfoutput>
    <div class="tao-card-photo">
        <!-- Trash Icon in Header -->
        <div class="tao-card-photo-header">
            <i class="mdi mdi-square-edit-outline" data-bs-toggle="modal" data-bs-target="##remoteDeleteaudmedia#currentid#"></i>
        </div>

        <!-- Card Body: Image + Overlay -->
        <div class="tao-card-photo-body">
            <img src="#card_image#" alt="#card_name#">
            
            <!-- Magnifying Glass Icon (Opens Lightbox) -->
            <div class="image-overlay">
                <a href="#card_image#" data-lightbox="headshots" data-title="#card_name#">
                    <i class="mdi mdi-magnify"></i>
                </a>
            </div>
        </div>

        <!-- Footer with Name -->
        <div class="tao-card-photo-footer">
            <div class="photo-name">#card_name#</div>
        </div>
    </div>
</cfoutput>
