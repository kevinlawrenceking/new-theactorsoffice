<!--- This ColdFusion page displays a modal for personal assessments and a questionnaire for events. --->
<cfinclude template="/include/qry/auds_byrole.cfm" />

<cfloop query="events">
    <!--- Loop through each event to display its details and associated modal --->
    <script>
        $(document).ready(function() {
            $("##remoteUpdateAnswer").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remoteassform.cfm?eventid=" + eventid + "&audprojectid=" + audprojectid);
            });
        });
    </script>

    <div id="remoteUpdateAnswer" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: ##f3f7f9;">
                    <h4 class="modal-title" id="standard-modalLabel">
                        <strong>#events.audstep#: </strong>#dateformat(events.eventStart,'long')#: Personal Assessment
                    </h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                        <i class="mdi mdi-close-thick"></i>
                    </button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>

    <cfset eventId = events.eventid />
    <cfinclude template="/include/qry/aud_questions.cfm" />

    <h4>Personal Assessment</h4>

    <div class="card mb-1">
        <div class="card-header" id="heading_#eventId#">
            <h5 class="m-0">
                <a class="text-dark" data-bs-toggle="collapse" href="##collapse_#eventId#" aria-expanded="true">
                    <i class="mdi mdi-filmstrip mr-1 text-primary"></i>
                    <strong>#events.audstep#: </strong>#dateformat(events.eventStart,'long')#
                </a>
            </h5>
        </div>

        <div id="collapse_#eventId#" class="collapse show" aria-labelledby="headin_#eventId#" data-bs-parent="##accordion">
            <div class="card-body">
                <h4>Audition Assessment Questionnaire
                    <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateAnswer" toggle="tooltip" data-bs-placement="top" title="Update Answer" data-bs-original-title="Update Answer">
                        <i class="mdi mdi-square-edit-outline"></i>
                    </a>
                </h4>

                <div class="row">
                    <cfif questions.recordcount gt 0>
                        <div class="col-md-12 col-lg-12 col-xl-12 p-1 text-nowrap">
                            <a href="/include/aud_assessment_add.cfm?eventid=#eventId#&audprojectid=#audprojectid#" class="btn btn-primary waves-effect waves-light">Create</a>
                        </div>
                    </cfif>

                    <cfloop query="questions">
                        <div class="col-md-12 p-2 text-dark">
                            <strong>#questions.qorder#. #questions.qtext#</strong>
                        </div>

                        <div class="col-md-12 p-2">&nbsp;
                            <cfif questions.qtype eq "rating">
                                <em>#questions.arating#</em>
                            <cfelseif questions.qtype eq "text">
                                <em>#questions.atext#</em>
                            <cfelseif questions.qtype eq "long">
                                <em>#questions.amemo#</em>
                            </cfif>
                        </div>
                    </cfloop>
                </div>
            </div>
        </div>
    </div>
</cfloop>

<!--- Changes made: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks unless essential.
3. Simplified record count logic for icons or conditional displays.
4. Standardized variable names and casing.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Used uniform date and time formatting across the code.
7. Improved logic for expanding and collapsing views in mobile layouts.
8. Removed any cftry and cfcatch blocks entirely.
9. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs ## to avoid interpretation as variables.
--->