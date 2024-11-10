<h4>Notes</h4>
<cfset returnURL = "audition" />
<div class="d-flex justify-content-between">
    <div class="float-left">
        <!--- Check if there are no notes --->
        <cfif notesAud.recordCount eq 0>
            No notes.
        </cfif>
        <!--- Output the count of notes --->
        You have <strong>#notesAud.recordCount#</strong> note<cfif notesAud.recordCount neq 1>s</cfif>.
    </div>
    <div class="float-end">
        <!--- Link to add a new note --->
        <a href="/app/note-add-aud/?returnurl=audition&audProjectID=#audProjectID#&rContactID=0" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e;"> Add </a>
    </div>
</div>
<div class="noMobile">
    <div class="table-responsive" id="NotesContact_container">
        <table id="notes-datatable" class="table display dt-responsive nowrap w-100 table-striped table-hover">
            <thead>
                <!--- Output the header row for the notes table --->
                <cfoutput query="notesAud" maxrows="1">
                    <cfset rowType = (notesAud.CurrentRow MOD 2) ? "Odd" : "Even" />
                    <tr class="#rowType#">
                        <th>Action</th>
                        <th>#head1#</th>
                        <th>#head4#</th>
                        <th>Links</th>
                        <th>Attachments</th>
                        <th>#head5#</th>
                        <th></th>
                    </tr>
                </cfoutput>
            </thead>
            <tbody>
                <!--- Loop through each note in the query --->
                <cfloop query="notesAud">
                    <cfset newNoteID = notesAud.noteID />
                    <!--- Include links and attachments templates --->
                    <cfinclude template="/include/qry/links_181_1.cfm" />
                    <cfinclude template="/include/qry/attachments_181_2.cfm" />
                    <cfoutput>
                        <!--- JavaScript for modal handling for delete confirmation --->
                        <script>
                            $(document).ready(function() {
                                $("##remoteDeleteFormNoteAud#notesAud.noteID#").on("show.bs.modal", function(event) {
                                    // Place the returned HTML into the selected element
                                    $(this).find(".modal-body").load("/include/remoteDeleteFormNoteAud.cfm?recID=#notesAud.noteID#&audProjectID=#audProjectID#&returnurl=audition");
                                });
                            });
                        </script>
                        <!--- Modal for delete confirmation --->
                        <div id="remoteDeleteFormNoteAud#notesAud.noteID#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header" style="background-color: red;">
                                        <h4 class="modal-title">Delete Note Confirmation</h4>
                                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                                    </div>
                                    <div class="modal-body"></div>
                                </div>
                            </div>
                        </div>
                        <!--- JavaScript for modal handling for adding links --->
                        <script>
                            $(document).ready(function() {
                                $("##remoteAddLink#notesAud.noteID#").on("show.bs.modal", function(event) {
                                    // Place the returned HTML into the selected element
                                    $(this).find(".modal-body").load("/include/linkAdd.cfm?audProjectID=#audProjectID#&contactID=0&noteID=#newNoteID#&returnurl=audition");
                                });
                            });
                        </script>
                        <!--- Modal for adding links --->
                        <div id="remoteAddLink#notesAud.noteID#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header" style="background-color: ##f3f7f9;">
                                        <h4 class="modal-title" id="standard-modalLabel">Note Links</h4>
                                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                                    </div>
                                    <div class="modal-body"></div>
                                </div>
                            </div>
                        </div>
                        <!--- JavaScript for modal handling for note details --->
                        <script>
                            $(document).ready(function() {
                                $("##remoteNoteDetails#notesAud.noteID#").on("show.bs.modal", function(event) {
                                    // Place the returned HTML into the selected element
                                    $(this).find(".modal-body").load("/include/remoteNoteDetails.cfm?contactID=0&noteID=#newNoteID#&returnurl=audition");
                                });
                            });
                        </script>
                        <!--- Modal for viewing note details --->
                        <div id="remoteNoteDetails#notesAud.noteID#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
                                <div class="modal-content">
                                    <div class="modal-header" style="background-color: ##f3f7f9;">
                                        <h4 class="modal-title" id="standard-modalLabel">Note</h4>
                                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                                    </div>
                                    <div class="modal-body"></div>
                                </div>
                            </div>
                        </div>
                        <!--- JavaScript for modal handling for adding attachments --->
                        <script>
                            $(document).ready(function() {
                                $("##remoteAddAttachment#notesAud.noteID#").on("show.bs.modal", function(event) {
                                    // Place the returned HTML into the selected element
                                    $(this).find(".modal-body").load("/include/attachmentAddAud.cfm?audProjectID=#audProjectID#&contactID=0&noteID=#newNoteID#&returnurl=audition");
                                });
                            });
                        </script>
                        <!--- Modal for uploading attachments --->
                        <div id="remoteAddAttachment#notesAud.noteID#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header" style="background-color: ##f3f7f9;">
                                        <h4 class="modal-title" id="standard-modalLabel">Upload an Attachment</h4>
                                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                                    </div>
                                    <div class="modal-body"></div>
                                </div>
                            </div>
                        </div>
                        <tr role="row">
                            <td>
                                <!--- Link to edit the note --->
                                <a title="Edit" href="/app/note-update-aud/?noteID=#notesAud.noteID#&returnurl=audition&audProjectID=#audProjectID#&rContactID=0">
                                    <i class="mdi mdi-square-edit-outline"></i>
                                </a>
                            </td>
                            <td class="text-nowrap">#dateFormat(notesAud.col1, 'm-d-yyyy')#<br />#timeFormat(notesAud.col2, 'medium')#</td>
                            <td class="text-nowrap">
                                <cfif notesAud.col4 eq 1>Public<cfelse>Private</cfif>
                            </td>
                            <td class="text-nowrap">
                                <!--- Link to add a new link --->
                                <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteAddLink#notesAud.noteID#" data-bs-placement="top" title="Add Link" data-bs-original-title="Add Link">
                                    <i class="fe-plus-circle"></i> Add link
                                </a>
                                <cfif links.recordCount neq 0>
                                    <cfloop query="links">
                                        <br />
                                        <a href="#linkURL#" target="#newNoteID#">#linkName#</a>
                                        <a href="/include/linkDel.cfm?linkID=#links.linkID#&audProjectID=#audProjectID#&returnurl=audition" title="delete link">
                                            <i class="mdi mdi-trash-can-outline mr-1"></i>
                                        </a>
                                    </cfloop>
                                </cfif>
                            </td>
                            <td class="text-nowrap">
                                <!--- Link to add a new attachment --->
                                <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteAddAttachment#notesAud.noteID#" data-bs-placement="