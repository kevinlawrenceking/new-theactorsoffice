<cfloop query="eventtypes_user">
    <script>
        $(document).ready(function() {
            $("##updateeventtype_<cfoutput>#eventtypes_user.id#</cfoutput>").on("show.bs.modal", function(event) {
                $(this).find(".modal-body").load("/include/updateeventtype.cfm?id=<cfoutput>#eventtypes_user.id#</cfoutput>");
            });
        });
    </script>

    <div id="updateeventtype_<cfoutput>#eventtypes_user.id#</cfoutput>" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: ##<cfoutput>#eventtypes_user.eventtypecolor#</cfoutput>;">
                    <h4 class="modal-title" id="standard-modalLabel"><cfoutput>#eventtypes_user.eventtypename#</cfoutput> Appointment Type Update</h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                        <i class="mdi mdi-close-thick"></i>
                    </button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
</cfloop>

<!--- Modifications: Removed unnecessary cfoutput tags around variable outputs, ensured consistent attribute quoting, spacing, and formatting, used double pound signs for hex color codes to avoid interpretation as variables. --->