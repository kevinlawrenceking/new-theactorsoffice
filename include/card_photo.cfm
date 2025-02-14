<cfoutput>
    <div class="tao-card-photo">
        <!-- Trash Icon in Header -->
        <div class="tao-card-header">
            <i class="mdi mdi-trash-can" data-bs-toggle="modal" data-bs-target="##remoteDeleteaudmedia#currentid#"></i>
        </div>

        <!-- Headshot Image -->
        <img src="#card_image#" alt="#card_name#">

        <!-- Footer with Name -->
        <div class="tao-card-footer">
            <div class="photo-name">#card_name#</div>
        </div>
    </div>
</cfoutput>
