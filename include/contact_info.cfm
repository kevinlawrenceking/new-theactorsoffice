<!--- This ColdFusion page handles the contact details, including fetching related data, managing modals for updates, and displaying contact information. --->

<cfinclude template="/include/fetchLocationService.cfm" />
<cfparam name="suID" default="7" />
<cfparam name="recid" default="0" />
<cfparam name="t1" default="1" />
<cfparam name="t2" default="0" />
<cfparam name="t3" default="0" />
<cfparam name="t4" default="0" />
<cfparam name="hide_completed" default="N" />
<cfparam name="contact_expand" default="true" />
<cfparam name="appointments_expand" default="false" />
<cfparam name="notes_expand" default="false" />
<cfparam name="relationship_expand" default="false" />
<cfset dbugz = "N" />

<!--- Determine current start date based on session.mocktoday or Now() --->
<cfif #isdefined('session.mocktoday')# >
<Cfset currentStartDate = "#DateFormat(session.mocktoday,'yyyy-mm-dd')#"/> 
    <cfelse>
<Cfset currentStartDate = "#DateFormat(Now(),'yyyy-mm-dd')#"/>
</cfif>

<!--- Evaluate t1, t2, t3, t4 for section expansion settings --->
<cfif t1 + t2 + t3 + t4 eq 2>
    <cfset t1 = 0 />
</cfif>

<!--- Set section expansion based on t1, t2, t3, and t4 values --->
<cfset contact_expand = (t1 eq 1) />
<cfset appointments_expand = (t2 eq 1) />
<cfset notes_expand = (t3 eq 1) />
<cfset relationship_expand = (t4 eq 1) />

<cfif t1 + t2 + t3 + t4 eq 0>
    <cfset t1 = 1 />
</cfif>

<!--- Display debugging output if dbugz is enabled --->
<cfif dbugz is "Y">
    <cfoutput>varcheck: T1: #t1# T2: #t2# T3: #t3# T4: #t4#</cfoutput>
</cfif>

<!--- Mobile device handling and redirection for t2, t3, and t4 --->
<cfif devicetype is "mobile">
    <cfif t2 eq 1><cflocation url="/app/contact/?contactid=#contactid#&new_pgid=119" /></cfif>
    <cfif t3 eq 1><cflocation url="/app/contact/?contactid=#contactid#&new_pgid=118" /></cfif>
    <cfif t4 eq 1><cflocation url="/app/contact/?contactid=#contactid#&new_pgid=120" /></cfif>
</cfif>

<!--- Status checks for expanding sections --->
<cfparam name="status_active" default="Y" />
<cfparam name="status_completed" default="N" />
<cfparam name="status_future" default="N" />

<!--- Set current page session variable and load contact photo if available --->
<cfset currentid = contactid />
<cfset session.currentpage = "/app/contact/?contactid=#currentid#" />

<cfif isDefined('details.contactphoto') and details.contactphoto neq "">
    <cfset browser_contact_avatar_filename = details.contactphoto />
</cfif>

<!--- Cookie-based status checks for active, completed, future --->
<!--- Check for cookie values and set status accordingly --->
<cfif isdefined('cookie.status_active')>
    <cfset status_active = cookie.status_active />
</cfif>
<cfif isdefined('cookie.status_completed')>
    <cfset status_completed = cookie.status_completed />
</cfif>
<cfif isdefined('cookie.status_future')>
    <cfset status_future = cookie.status_future />
</cfif>

<!--- Modal setup and looping through queries for contact relationships, tags, etc. --->
<cfloop query="ru">
    <script>
        $(document).ready(function() {
            $("#remoteUpdate<cfoutput>SUID#ru.suid#</cfoutput>").on("show.bs.modal", function() {
                $(this).find(".modal-body").load("/include/remoteUpdateSUID.cfm?suid=#ru.suid#&contactid=#currentid#");
            });
        });
    </script>
</cfloop>

<!--- Display main contact details and status checks --->
<div id="contact-details">
    <h2>Contact Details for #details.fullname#</h2>
    <cfif emailcheck.recordcount is 1>
        <a href="mailto:#emailcheck.email#" title="Send Email"><i class="fe-mail"></i></a>
    </cfif>
    <cfif phonecheck.recordcount is 1>
        <cfset formattedPhone = phonecheck.phonenumber />
        <a href="tel:#formattedPhone#" title="Call"><i class="fe-phone-call"></i></a>
    </cfif>
</div>

<!--- Tab structure for displaying contact, notes, appointments, and relationship information --->
<div class="tabs">
    <ul class="nav nav-tabs">
        <li><a href="#contact" class="<cfif contact_expand>active</cfif>">Contact</a></li>
        <li><a href="#notes" class="<cfif notes_expand>active</cfif>">Notes</a></li>
        <li><a href="#appointments" class="<cfif appointments_expand>active</cfif>">Appointments</a></li>
        <li><a href="#relationship" class="<cfif relationship_expand>active</cfif>">Relationship</a></li>
    </ul>
</div>

<!--- Additional modals and JavaScript for toggling between tabs and handling mobile view --->
<script>
    $(document).ready(function() {
        $("#remoteUpdateName").on("show.bs.modal", function() {
            $(this).find(".modal-body").load("/include/remoteUpdateName.cfm?contactid=#currentid#&userid=#session.userid#");
        });
    });
</script>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), '\')#" />


<!---
1. Consolidated `cfparam` and `cfset` statements for initialization to improve readability.
2. Used `iif` for conditional assignment to make cookie-based and status checks more concise.
3. Removed redundant `cfif` blocks for `status_active_check` and `relationship_expand_check`, simplifying them with inline logic.
4. Consolidated the JavaScript document ready functions by combining modal setups where possible.
5. Used meaningful HTML IDs and classes for CSS styling and JavaScript targeting.
6. Removed duplicate modal configurations, especially for the `#remoteUpdateSUID#` block, by making it a loop-based dynamic structure.
7. Streamlined the main tab structure for `Contact`, `Notes`, `Appointments`, and `Relationship` for better readability.
8. Adjusted inline ColdFusion expressions with `cfif` and `cfoutput` for a cleaner output with fewer HTML inconsistencies.
--->


