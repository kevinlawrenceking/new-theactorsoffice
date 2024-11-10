```ColdFusion
<cfparam name="legendStatus" default="" />
<script>
    $(document).ready(function() {
        $("#remoteAudAdd").on("show.bs.modal", function(event) {
            $(this).find(".modal-body").load("/include/remoteAudAdd.cfm?userId=<cfoutput>#userId#</cfoutput>");
        });
    });
</script>
<div id="remoteAudAdd" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: ##f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Audition Type</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>
<div class="d-flex justify-content-between">
    <div>
        <a href="/app/appoint-add/?returnurl=calendar-appoint&rcontactid=0">
            <button class="btn btn-xs btn-primary" id="btn-new-event">
                <i class="mdi mdi-plus-circle-outline"></i> Add Appointment
            </button>
        </a>
        <cfif isAuditionModule eq "1">
            <a href="" class="btn btn-xs btn-primary" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAudAdd" data-bs-placement="top" title="Add Audition">Add Audition</a>
        </cfif>
    </div>
    <div>
        <cfif access_token eq "">
            <cfset clientId = "764716537559-ncfiag8dl4p05v7c9kcoltss0ou3heki.apps.googleusercontent.com">
            <cfset redirectUri = "https://dev.theactorsoffice.com/include/oauth_callback.cfm">
            <cfset scope = "https://www.googleapis.com/auth/calendar">
            <cfset authUrl = "https://accounts.google.com/o/oauth2/v2/auth?response_type=code&client_id=#clientId#&redirect_uri=#redirectUri#&scope=#scope#&access_type=offline">
            <a href="#authUrl#">
                <button class="btn btn-xs btn-primary" type="button">
                    <i class="mdi mdi-link"></i> Link Google
                </button>
            </a>
        </cfif>
        <button class="btn btn-xs btn-primary" type="button" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#subscription" toggle="tooltip" data-bs-placement="top" title="View Link"> 
            <i class="mdi mdi-link"></i> Subscribe 
        </button>
        <button class="btn btn-xs btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"> 
            <i class="mdi mdi-map-legend"></i> Legend 
        </button>
    </div>
</div>
<div class="collapse #legendStatus#" id="collapseExample" style="margin-top:5px;">
    <div class="card">
        <div class="card-body">
            <p><strong>Legend</strong></p>
            <div style="margin-left:20px;">
                <cfloop query="eventTypesUser">
                    <span class="fc-event-dot" style="background-color:##eventTypesUser.eventTypeColor#;font-size:14px;"></span> #eventTypesUser.eventTypeName# 
                    <span style="font-size:10px;padding-right:25px;min-width:200px;">
                        <a href="updateEventType_#eventTypesUser.id#.cfm" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##updateEventType_#eventTypesUser.id#" toggle="tooltip" data-bs-placement="top" title="Update Type"> 
                            <i class="mdi mdi-square-edit-outline"></i> 
                        </a> 
                    </span>
                </cfloop>
            </div>
            <div style="font-size:14px;" class="p-2">
                <a href="addEventType.cfm" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##addEventType" toggle="tooltip" data-bs-placement="top" title="Add Type">
                    <button class="btn btn-sm btn-primary" type="button">
                        <i class="mdi mdi-map-legend"></i> Add New
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>
<div id="calendar"></div>

<!--- Changes made:
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Avoided using `#` symbols within conditional checks unless essential.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. For any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs `##` to avoid interpretation as variables.
--->