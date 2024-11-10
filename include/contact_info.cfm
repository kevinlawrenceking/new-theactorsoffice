<!--- This ColdFusion page handles the contact details, including fetching related data, managing modals for updates, and displaying contact information. --->

<cfinclude template="/include/fetchLocationService.cfm" />

<cfparam name="recid" default="0" />
<cfparam name="t2" default="0" />
<cfset dbugz = "N" />
<cfparam name="t1" default="1" />
<cfparam name="t2" default="0" />
<cfparam name="t3" default="0" />
<cfparam name="t4" default="0" />

<!--- Check if t1 is not zero and adjust t1 accordingly --->
<cfif #t1# is not "0">
    <cfif t1 + t2 + t3 + t4 eq 2>
        <cfset t1 = 0 />
    </cfif>
</cfif>

<cfparam name="contact_expand" default="true" />
<cfparam name="appointments_expand" default="false" />
<cfparam name="notes_expand" default="false" />
<cfparam name="relationship_expand" default="false" />

<cfset contact_expand = "false" />
<cfset appointments_expand = "false" />
<cfset notes_expand = "false" />
<cfset relationship_expand = "false" />

<!--- Save content for debugging purposes --->
<cfsavecontent variable="varcheck">
    <cfoutput>
        T1: #t1#<BR>
        T2: #t2#<BR>
        T3: #t3#<BR>
        T4: #t4#<BR>
    </cfoutput>
</cfsavecontent>

<cfif #dbugz# is "Y">
    <cfoutput>varcheck:#varcheck#<BR></cfoutput>
    <cfoutput>t1:#t1#<BR></cfoutput>
</cfif>

<!--- Determine which sections to expand based on t1, t2, t3, and t4 values --->
<cfif t1 eq 1>
    <cfif #dbugz# is "Y">
        <cfoutput>t1:#t1#<BR></cfoutput>
    </cfif>
    <cfset contact_expand = "true" />
<cfelseif t2 eq 1>
    <cfset appointments_expand = "true" />
<cfelseif t3 eq 1>
    <cfset notes_expand = "true" />
<cfelseif t4 eq 1>
    <cfset relationship_expand = "true" />
</cfif>

<cfif t1 + t2 + t3 + t4 eq 0>
    <cfset t1 = 1 />
</cfif>

<cfsavecontent variable="varif">
    <cfoutput>
        IF: if #t1# is "0" and #t2# is "0" and #t3# is "0" and #t4# is "0"<BR>
    </cfoutput>
</cfsavecontent>

<cfoutput>
    <cfif #t1# is "0" and #t2# is "0" and #t3# is "0" and #t4# is "0">
        <cfset contact_expand = "true" />
    </cfif>
</cfoutput>

<cfsavecontent variable="varafter">
    <cfoutput>
        T1: #t1#<BR>
        T2: #t2#<BR>
        T3: #t3#<BR>
        T4: #t4#<BR>
    </cfoutput>
</cfsavecontent>

<cfif #dbugz# is "Y">
    <cfoutput> varif:#varif#<BR>varafter:#varafter#</cfoutput>
    <cfoutput>
        <p>notes_expand: #notes_expand#</p>
        <p>contact_expand: #contact_expand#</p>
    </cfoutput>
</cfif>

<!--- Handle mobile device redirection based on t2, t3, and t4 values --->
<cfif #devicetype# is "mobile">
    <cfif #t2# is "1">
        <Cflocation url="/app/contact/?contactid=#contactid#&new_pgid=119" />
    </cfif>
    <cfparam name="t3" default="0" />
    <cfif #t3# is "1">
        <Cflocation url="/app/contact/?contactid=#contactid#&new_pgid=118" />
    </cfif>
    <cfparam name="t4" default="0" />
    <cfif #t4# is "1">
        <Cflocation url="/app/contact/?contactid=#contactid#&new_pgid=120" />
    </cfif>
</cfif>

<cfparam name="dbug" default="N" />
<cfparam name="newendlink" default="" />
<cfparam name="contact_expand" default="true" />
<cfparam name="emaillink" default="unknown" />
<cfparam name="newactionlinkURL" default="" />
<cfparam name="updatenoteid" default="0" />
<cfparam name="pgtype" default="add" />
<cfparam name="ctaction" default="view" />
<cfparam name="pfaction" default="view" />
<cfparam name="status_active" default="Y" />
<cfparam name="status_completed" default="N" />
<cfparam name="status_future" default="N" />

<cfset currentid = contactid />
<cfset session.currentpage = "/app/contact/?contactid=#currentid#" />

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

<cfset rpgid = 36 />

<cfinclude template="/include/modalRemoteNewForm.cfm" />
<cfinclude template="/include/qry/contacts.cfm" />
<cfinclude template="/include/qry/categories.cfm" />
<cfinclude template="/include/qry/items.cfm" />
<cfinclude template="/include/qry/notesContact.cfm" />
<cfinclude template="/include/qry/SystemsContact.cfm" />
<cfinclude template="/include/qry/tagsContact.cfm" />
<cfinclude template="/include/qry/profiles.cfm" />
<cfinclude template="/include/qry/sysactive.cfm" />
<cfinclude template="/include/qry/notsall.cfm" />
<cfinclude template="/include/qry/events.cfm" />
<cfinclude template="/include/qry/systemNotificationsActive.cfm" />
<cfinclude template="/include/qry/SystemsActiveContact.cfm" />
<cfinclude template="/include/qry/ru.cfm" />
<cfinclude template="/include/qry/emailcheck.cfm" />
<cfinclude template="/include/qry/phonecheck.cfm" />
<cfinclude template="/include/qry/rels.cfm" />
<cfinclude template="/include/fetchContactItems.cfm" />
<cfinclude template="/include/qry/findcompany.cfm" />

<cfif #details.contactphoto# is not "">
    <cfset browser_contact_avatar_filename = details.contactphoto />
</cfif>

<cfparam name="status_active_check" default="" />
<cfparam name="status_completed_check" default="" />
<cfparam name="status_future_check" default="" />
<cfparam name="relationship_expand_check" default="" />

<!--- Set status checks based on details --->
<cfif #status_active# is "Y">
    <cfset status_active_check = "checked" />
</cfif>
<cfif #status_completed# is "Y">
    <cfset status_completed_check = "checked" />
</cfif>
<cfif #status_future# is "Y">
    <cfset status_future_check = "checked" />
</cfif>
<cfif #relationship_expand# is "true">
    <cfset relationship_expand_check = "show active" />
</cfif>

<script>
    $(document).ready(function() {
        $("#remoteUpdateSUID0").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/remoteUpdateSUID.cfm?suid=0&contactid=#currentid#</cfoutput>");
        });
    });
</script>

<div id="remoteUpdateSUID0" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    <cfoutput>Relationship System</cfoutput>
                </h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<cfloop query="ru">
    <script>
        $(document).ready(function() {
            $("#remoteUpdate<cfoutput>SUID#ru.suid#</cfoutput>").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("<cfoutput>/include/remoteUpdateSUID.cfm?suid=#ru.suid#&contactid=#currentid#</cfoutput>");
            });
        });
    </script>

    <div id="remoteUpdate<cfoutput>SUID#ru.suid#</cfoutput>" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Update <cfoutput>Relationship System</cfoutput></h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
</cfloop>

<cfinclude template="/include/qry/cu_83_1.cfm" />

<cfloop query="cu">
    <script>
        $(document).ready(function() {
            $("#remoteUpdate<cfoutput>C#cu.itemid#</cfoutput>").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("<cfoutput>/include/remoteupdatec.cfm?userid=#userid#&itemid=#cu.itemid#</cfoutput>");
            });
        });
    </script>

    <div id="remoteUpdate<cfoutput>C#cu.itemid#</cfoutput>" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        Update <cfoutput>#cu.valueCategory# Form</cfoutput>
                    </h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                        <i class="mdi mdi-close-thick"></i>
                    </button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
</cfloop>

<cfloop query="sysactive">
    <cfoutput>
        <div id="action#sysactive.suid#-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">#sysactive.recordname#</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">x</button>
                    </div>
                    <div class="modal-body">
                        <h5>Description</h5>
                        <p>#sysactive.systemdescript#</p>
                        <p><strong>Start Date:</strong> #dateformat(sysactive.sustartdate)#</p>
                        <cfif #sysactive.suenddate# is not "">
                            <p><strong>Completed:</strong> #dateformat(sysactive.suenddate)#</p>
                        </cfif>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function() {
                $("##remoteDeleteForm#sysActive.suid#").on("show.bs.modal", function(event) {
                    // Place the returned HTML into the selected element
                    $(this).find(".modal-body").load("/include/remoteDeleteForm.cfm?recid=#sysActive.suid#&rpgid=40&pgaction=update&contactid=#currentid#&pgdir=contact&t4=1");
                });
            });
        </script>

        <div id="remoteDeleteForm#sysActive.suid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: red;">
                        <h4 class="modal-title">Follow Up System</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                    </div>
                    <div class="modal-body"></div>
                </div>
            </div>
        </div>
    </cfoutput>
</cfloop>

<cfinclude template="/include/qry/c_83_2.cfm" />

<cfloop query="c">
    <script>
        $(document).ready(function() {
            $("#remoteAdd<cfoutput>C#c.catid#</cfoutput>").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("<cfoutput>/include/remoteAddC.cfm?catid=#c.catid#&userid=#session.userid#&contactid=#currentid#</cfoutput>");
            });
        });
    </script>

    <div id="remoteAdd<cfoutput>C#c.catid#</cfoutput>" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">New <cfoutput>#c.valueCategory# Form</cfoutput></h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
</cfloop>

<script>
    $(document).ready(function() {
        $("#remoteUpdateTag").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/remoteUpdateTag.cfm?contactid=#currentid#</cfoutput>");
        });
    });
</script>

<div id="remoteUpdateTag" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Update Tags</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $("#remoteNewForm").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/RemoteNewForm.cfm?rpgid=36&pgid=3&t2=1&pgdir=#pgdir#&contactid=#contactid#</cfoutput>");
        });
    });
</script>

<div id="showmaint" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-success">
            <div class="modal-body p-4">
                <div class="text-center">
                    <i class="dripicons-checkmark h1 text-white"></i>
                    <h4 class="mt-2 text-white">Follow-up System Completed!</h4>
                    <p class="mt-3 text-white">
                        <cfoutput>#details.recordname#</cfoutput> has been automatically placed into a maintenance list system.
                    </p>
                    <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">Continue</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $("#remoteUploadForm").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/remoteUploadForm.cfm");
        });
    });
</script>

<Cfoutput>
    <script>
        $(document).ready(function() {
            $("##remoteDeleteForm#currentid#").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remoteDeleteForm.cfm?recid=#currentid#&rpgid=#pgid#&pgaction=update&pgdir=#pgdir#");
            });
        });
    </script>

    <div id="remoteDeleteForm#currentid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: red;">
                    <h4 class="modal-title">#compname#</h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
</Cfoutput>

<script>
    $(document).ready(function() {
        $("#remoteUpdateName").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/remoteUpdateName.cfm?contactid=#currentid#&userid=#session.userid#</cfoutput>");
        });
    });
</script>

<div id="remoteUpdateName" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Contact Details</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<cfloop query="sysactive">
    <cfinclude template="/include/qry/notsActive.cfm" />
    <cfloop query="notsactive">
        <cfoutput>
            <div id="action#notsActive.actionid#-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">#notsActive.actiontitle#</h4>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">x</button>
                        </div>
                        <div class="modal-body">
                            <h5>#notsActive.actiondetails#</h5>
                            <p>#notsActive.actionInfo#</p>
                            <cfif #notsActive.actionLinkID# is "2">
                                <cfset newactionlinkURL="mailto:#emaillink#" />
                                <cfif #emailcheck.recordcount# is "1">
                                    <cfset emaillink="#emailcheck.email#" />
                                </cfif>
                            </cfif>
                            <cfif #notsActive.actionLinkID# is "6">
                                <cfset newendlink="#details.contactfullname#" />
                                <cfset newactionlinkURL="#notsactive.ActionLinkURL##newendlink#+acting" />
                            </cfif>
                            <cfif #notsActive.actionLinkID# is not "6" and #notsActive.actionLinkID# is not "2" and #notsActive.actionLinkID# is not "0">
                                <cfset newendlink="#notsactive.endlink#" />
                                <cfset newactionlinkURL="#notsactive.ActionLinkURL#?contactid=#currentid##newendlink#" />
                            </cfif>
                            <p>
                                <center>
                                    <a href="#newActionLinkURL#" target="#notsactive.targetlink#" class="btn btn-xs btn-primary" style="background-color: ##406e8e; border: ##406e8e;">#notsactive.BtnName#</a>
                                </center>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div id="actionconfirm#notsActive.actionid#-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">#notsActive.actiontitle# Completed</h4>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">x</button>
                        </div>
                        <div class="modal-body">
                            <center>
                                <h5>Looks like you completed this reminder. Congratulations!</h5>
                            </center>
                            <p>&nbsp;</p>
                            <center>
                                <h5>Click confirm and we'll close it out and add the next reminder</h
