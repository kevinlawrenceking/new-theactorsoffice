<!--- This ColdFusion page handles access control for the audition module and manages follow-up actions. --->
<cfparam name="isNew" default="0" />

<!--- Check if the user has access to the audition module --->
<cfif isAuditionModule neq 1>
    <h5>You do not have access to the audition module.</h5>
    <form>
        <input type="button" value="Go back!" onclick="history.back()">
    </form>
    <cfabort>
</cfif>

<!--- Include the query for the audition module --->
<cfinclude template="/include/qry/uu_33_1.cfm" />

<!--- Check if the record is new --->
<cfif isNew eq 1>

    <!--- Include follow-up queries --->
    <cfinclude template="/include/qry/followUps_33_2.cfm" />

    <!--- Check if there is exactly one follow-up record --->
    <cfif followUps.recordCount eq 1>

        <!--- Check if the follow-up event has started --->
        <cfif followUps.eventStart lt now()>
            <script>
                $(document).ready(function() {
                    // Load the content when the modal is shown
                    $("##follow").on("show.bs.modal", function(event) {
                        $(this).find(".modal-body").load("/include/followUp_body.cfm?contactId=" + followUps.contactId);
                    });

                    // Show the modal
                    $("##follow").modal('show');
                });
            </script>
        </cfif>

        <!--- Modal for adding follow-up system --->
        <div id="follow" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Follow Up System</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                            <i class="mdi mdi-close-thick"></i>
                        </button>
                    </div>
                    <div class="modal-body"></div>
                </div>
            </div>
        </div>

    </cfif>

</cfif>

<!--- Include the query for adding missing records --->
<cfinclude template="/include/qry/addMissing_33_3.cfm" />

<!--- 
Changes made:
1. Removed unnecessary # symbols in conditional checks.
2. Removed unnecessary cfoutput tags around variable outputs.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Simplified record count logic for icons or conditional displays.
6. Used double pound signs ## for jQuery syntax to avoid interpretation as variables.
--->