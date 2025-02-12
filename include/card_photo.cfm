<cfoutput>
    <div class="tao-card-photo">
        <!-- Headshot Image -->
        <img src="#card_image#" alt="#card_name#">
        
        <!-- Magnifying Glass Icon (Centered on Image) -->
        <div class="image-overlay">
            <i class="mdi mdi-magnify"></i>
        </div>

        <!-- Footer with Name, Lighthouse, and Trash Icons -->
        <div class="tao-card-footer">
            <div class="photo-name">#card_name#</div>
            <div class="icon-container">
                <!-- Lighthouse Icon -->
                <i class="mdi mdi-lightbulb-outline"></i>
                <!-- Trash Icon -->
                <i class="mdi mdi-trash-can" data-bs-toggle="modal" data-bs-target="##remoteDeleteaudmedia#currentid#"></i>
            </div>
        </div>
    </div>
</cfoutput>
