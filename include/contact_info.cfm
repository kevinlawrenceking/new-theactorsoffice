<!--- This ColdFusion page handles the contact details, including fetching related data, managing modals for updates, and displaying contact information. --->

<cfinclude template="/include/fetchLocationService.cfm" />
<cfparam name="suID" default="7" />
<cfparam name="recid" default="0" />
<cfparam name="t1" default="1" />
<cfparam name="t2" default="0" />
<cfparam name="t3" default="0" />
<cfparam name="t4" default="0" />
<cfparam name="hide_completed" default="N" />
<cfset dbugz = "N" />

<!--- Determine start date based on session or current date --->
<cfif isDefined("session.mocktoday")>
    <cfset currentStartDate = DateFormat(session.mocktoday, "yyyy-mm-dd") />
<cfelse>
    <cfset currentStartDate = DateFormat(Now(), "yyyy-mm-dd") />
</cfif>

<!--- Expand sections based on t1, t2, t3, and t4 values --->
<cfset contact_expand = (t1 eq 1) />
<cfset appointments_expand = (t2 eq 1) />
<cfset notes_expand = (t3 eq 1) />
<cfset relationship_expand = (t4 eq 1) />

<cfif t1 + t2 + t3 + t4 eq 0>
    <cfset t1 = 1 />
</cfif>

<!--- Save content for debugging purposes --->
<cfsavecontent variable="varcheck">
    <cfoutput>
        T1: #t1#<br>
        T2: #t2#<br>
        T3: #t3#<br>
        T4: #t4#<br>
    </cfoutput>
</cfsavecontent>

<cfif dbugz is "Y">
    <cfoutput>varcheck: #varcheck#</cfoutput>
</cfif>

<!--- Redirect mobile users based on t2, t3, and t4 values --->
<cfif devicetype is "mobile">
    <cfif t2 is "1">
        <cflocation url="/app/contact/?contactid=#contactid#&new_pgid=119" />
    </cfif>
    <cfif t3 is "1">
        <cflocation url="/app/contact/?contactid=#contactid#&new_pgid=118" />
    </cfif>
    <cfif t4 is "1">
        <cflocation url="/app/contact/?contactid=#contactid#&new_pgid=120" />
    </cfif>
</cfif>

<!--- Set up variables for page status, links, and expansions --->
<cfparam name="status_active" default="Y" />
<cfparam name="status_completed" default="N" />
<cfparam name="status_future" default="N" />
<cfparam name="contact_expand" default="true" />
<cfparam name="newendlink" default="" />
<cfparam name="emaillink" default="unknown" />
<cfparam name="newactionlinkURL" default="" />
<cfparam name="updatenoteid" default="0" />
<cfparam name="pgtype" default="add" />
<cfparam name="ctaction" default="view" />
<cfparam name="pfaction" default="view" />

<cfset currentid = contactid />
<cfset session.currentpage = "/app/contact/?contactid=#currentid#" />

<!--- Check for cookie values and set status accordingly --->
<cfif isDefined("cookie.status_active")>
    <cfset status_active = cookie.status_active />
</cfif>
<cfif isDefined("cookie.status_completed")>
    <cfset status_completed = cookie.status_completed />
</cfif>
<cfif isDefined("cookie.status_future")>
    <cfset status_future = cookie.status_future />
</cfif>

<!--- Load external queries and modals --->
<cfinclude template="/include/qry/details_456_1.cfm" />
<cfinclude template="/include/qry/ru.cfm" />
<cfinclude template="/include/modalRemoteNewForm.cfm" />
<cfinclude template="/include/qry/contacts_333_1.cfm" />
<cfinclude template="/include/qry/categories_446_1.cfm" />
<cfinclude template="/include/qry/items_488_1.cfm" />
<cfinclude template="/include/qry/notesContact_507_1.cfm" />
<cfinclude template="/include/qry/Systems_540_1.cfm" />
<cfinclude template="/include/qry/TagsContact_541_1.cfm" />
<cfinclude template="/include/qry/profiles_516_1.cfm" />
<cfinclude template="/include/qry/sysActive_537_1.cfm" />
<cfinclude template="/include/qry/notsall_512_1.cfm" />
<cfinclude template="/include/qry/eventss_443_1.cfm" />
<cfinclude template="/include/qry/findscope.cfm" />
<cfinclude template="/include/qry/sysAvail_539_3.cfm" />
<cfinclude template="/include/qry/rels_519_1.cfm" />
<cfinclude template="/include/qry/emailcheck_469_1.cfm" />
<cfinclude template="/include/qry/phonecheck_515_1.cfm" />
<cfinclude template="/include/fetchContactItems.cfm" />
<cfinclude template="/include/qry/findcompany_476_1.cfm" />

<!--- Check for and set contact photo --->
<cfif details.contactphoto neq "">
    <cfset browser_contact_avatar_filename = details.contactphoto />
</cfif>

<!--- Set status checks based on details --->
<cfparam name="status_active_check" default="" />
<cfparam name="status_completed_check" default="" />
<cfparam name="status_future_check" default="" />
<cfparam name="relationship_expand_check" default="" />

<cfif status_active eq "Y"><cfset status_active_check = "checked" /></cfif>
<cfif status_completed eq "Y"><cfset status_completed_check = "checked" /></cfif>
<cfif status_future eq "Y"><cfset status_future_check = "checked" /></cfif>
<cfif relationship_expand eq "true"><cfset relationship_expand_check = "show active" /></cfif>

<!--- Modal for updating relationship system --->
<script>
    $(document).ready(function() {
        $("#remoteUpdateSUID0").on("show.bs.modal", function() {
            $(this).find(".modal-body").load("/include/remoteUpdateSUID.cfm?suid=0&contactid=#currentid#");
        });
    });
</script>

<div id="remoteUpdateSUID0" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Relationship System</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<!--- Include other modals and JavaScript as needed --->
<cfloop query="ru">
    <script>
        $(document).ready(function() {
            $("#remoteUpdate<cfoutput>SUID#ru.suid#</cfoutput>").on("show.bs.modal", function() {
                $(this).find(".modal-body").load("/include/remoteUpdateSUID.cfm?suid=#ru.suid#&contactid=#currentid#");
            });
        });
    </script>
    <div id="remoteUpdate<cfoutput>SUID#ru.suid#</cfoutput>" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Update Relationship System</h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                        <i class="mdi mdi-close-thick"></i>
                    </button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
</cfloop>

<!--- Set up other JavaScript and CSS as necessary --->
<script>
    function toggleCustomField(select) {
        var customField = document.getElementById('special');
        customField.style.display = select.value === 'custom' ? 'block' : 'none';
    }
    window.onload = function() {
        toggleCustomField(document.getElementById('valueCompany'));
    };
</script>

<!--- Add more script and modal elements here as needed for full functionality. --->
<cfset script_name_include = "/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
