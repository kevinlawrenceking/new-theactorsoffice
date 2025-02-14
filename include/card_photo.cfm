<cfoutput>
    <div class="tao-card-md">
        <!-- Trash Icon in Header -->
        <div class="tao-card-header">
            <i class="mdi mdi-trash-can" data-bs-toggle="modal" data-bs-target="##remoteDeleteaudmedia#currentid#"></i>
        </div>

        <!-- Card Body: Image + Overlay -->
        <div class="tao-card-body">
            <img src="#card_image#" alt="#card_name#">
            
            <!-- Magnifying Glass Icon (Opens Lightbox) -->
            <div class="image-overlay">
                <a href="#card_image#" data-lightbox="headshots" data-title="#card_name#">
                    <i class="mdi mdi-magnify"></i>
                </a>
            </div>
        </div>

        <!-- Footer with Name -->
        <div class="tao-card-footer">
            <div class="photo-name">#card_name#</div>
        </div>
    </div>
</cfoutput>
