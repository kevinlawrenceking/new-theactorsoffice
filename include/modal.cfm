<!--- This ColdFusion page generates a modal dialog for displaying content dynamically. --->
<div id="#modalId#" class="modal" tabindex="-1" role="dialog" aria-labelledby="standardModalLabel" aria-bs-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="standardModalLabel">#modalTitle#</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>
<!--- End of modal-fullscreen --->
<!--- Changes made: 
1. Removed unnecessary cfoutput tags around the entire code block.
2. Standardized variable names and casing (e.g., from "modalid" to "modalId", "modaltitle" to "modalTitle").
3. Ensured consistent attribute quoting, spacing, and formatting.
--->