<!--- This ColdFusion page handles access control for the audition module and manages follow-up actions. --->

<cfparam name="isnew" default="0" />

<!--- Check if the user has access to the audition module --->
<cfif #isAuditionModule# is not "1">
    <h5>You do not have access to the audition module.</h5>
    
    <form>
        <input type="button" value="Go back!" onclick="history.back()">
    </form>
    <cfabort>
</cfif>

<!--- Include the query for the audition module --->
<cfinclude template="/include/qry/uu_33_1.cfm" />

<!--- Check if the record is new --->
<cfif #isnew# is "1">
    
    <!--- Include follow-up queries --->
    <cfinclude template="/include/qry/followups_33_2.cfm" />
    
    <!--- Check if there is exactly one follow-up record --->
    <cfif #followups.recordcount# is "1">
        
        <!--- Check if the follow-up event has started --->
        <cfif followups.eventstart lt now()>
            
            <cfoutput>
                <script>
                    $(document).ready(function() {
                        // Load the content when the modal is shown
                        $("##follow").on("show.bs.modal", function(event) {
                            $(this).find(".modal-body").load("/include/folowup_body.cfm?contactid=#followups.contactid#");
                        });

                        // Show the modal
                        $("##follow").modal('show');
                    });
                </script>
            </cfoutput>
        </cfif>
        
        <!--- Modal for adding follow-up system --->
        <div id="follow" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            <cfoutput>Add Follow Up System</cfoutput>
                        </h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                            <i class="mdi mdi-close-thick"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                    </div>
                </div>
            </div>
        </div>
        
    </cfif>
</cfif>

<!--- Include the query for adding missing records --->
<cfinclude template="/include/qry/addmissing_33_3.cfm" />
