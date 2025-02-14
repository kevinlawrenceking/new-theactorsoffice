<cfoutput>
    <div class="tao-card-photo">
        <!-- Headshot Image -->
        <img src="#card_image#" alt="#card_name#">

        <!-- Footer -->
        <div class="tao-card-footer">
            <div class="icon-container">
                <i class="mdi mdi-trash-can" data-bs-toggle="modal" data-bs-target="##remoteDeleteaudmedia#currentid#"></i>
            </div>
            <div class="photo-name">#card_name#</div>
        </div>
    </div>
</cfoutput>
