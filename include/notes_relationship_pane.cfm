<cfinclude template="/include/qry/notesRelationship.cfm" />

<div class="d-flex justify-content-between">
    <div class="float-left">
        <cfif notesRelationship.recordcount eq 0>
            No notes.
        </cfif>
        You have <strong>#notesRelationship.recordcount#</strong> note<cfif notesRelationship.recordcount neq 1>s</cfif>.
    </div>
    <div class="float-end">
        <a href="/app/note-add-event/?returnurl=contact&contactid=#currentid#&rcontactid=#currentid#" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e;"> Add </a>
    </div>
</div>

<div class="nomobile">
    <div class="table-responsive" id="notes_datatable_container">
        <table id="notes-datatable" class="table display dt-responsive nowrap w-100 table-striped table-hover">
            <thead>
                <cfoutput query="notesRelationship" maxrows="1">
                    <cfset rowType = (notesRelationship.CurrentRow MOD 2) ? "Odd" : "Even" />
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
                <!--- Loop through the notes relationship query to display each note --->
                <cfloop query="notesRelationship">
                    <cfset newNoteId = notesRelationship.noteid />
                    <!--- Include links and attachments for each note --->
                    <cfinclude template="/include/qry/links_183_1.cfm" />
                    <cfinclude template="/include/qry/attachments_181_2.cfm" />
                    <cfoutput>
                        <!--- Modal for deleting a note --->
                        <script>
                            $(document).ready(function() {
                                $("##remoteDeleteFormNote#newNoteId#").on("show.bs.modal", function(event) {
                                    $(this).find(".modal-body").load("/include/remoteDeleteFormNote.cfm?recid=#newNoteId#&contactid=#currentid#&pgdir=contact&t3=1");
                                });
                            });
                        </script>
                        <div id="remoteDeleteFormNote#newNoteId#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
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

                        <!--- Modal for adding a link to a note --->
                        <script>
                            $(document).ready(function() {
                                $("##remoteaddlink#notesRelationship.noteid#").on("show.bs.modal", function(event) {
                                    $(this).find(".modal-body").load("/include/linkadd.cfm?noteid=#newNoteId#&contactid=#currentid#&returnurl=contact");
                                });
                            });
                        </script>

                        <!--- Modal for viewing note details --->
                        <script>
                            $(document).ready(function() {
                                $("##remotenotedetails#NotesRelationship.noteid#").on("show.bs.modal", function(event) {
                                    $(this).find(".modal-body").load("/include/remotenotedetails.cfm?contactid=0&noteid=#newNoteId#&returnurl=appoint");
                                });
                            });
                        </script>

                        <!--- Modal for adding an attachment to a note --->
                        <script>
                            $(document).ready(function() {
                                $("##remoteaddattachment#notesRelationship.noteid#").on("show.bs.modal", function(event) {
                                    $(this).find(".modal-body").load("/include/attachmentadd.cfm?noteid=#newNoteId#&reventid=0&eventid=0&contactid=#currentid#&returnurl=contact");
                                });
                            });
                        </script>

                        <!--- Table rows --->
                        <tr role="row">
                            <td>
                                <a title="Edit" href="/app/note-update-event/?noteid=#notesRelationship.noteid#&returnurl=contact&rcontactid=#currentid#">
                                    <i class="mdi mdi-square-edit-outline"></i>
                                </a>
                            </td>
                            <td class="text-nowrap">#dateformat(notesRelationship.col1,'m-d-YYYY')#<BR />#timeformat(notesRelationship.col2,'medium')#</td>
                            <td class="text-nowrap">
                                <cfif notesRelationship.col4 eq 1>Public<cfelse>Private</cfif>
                            </td>

                            <!--- Links and Attachments --->
                            <cfinclude template="/include/qry/linksAndAttachments.cfm" />

                            <!--- Note Details --->
                            <td>#notesRelationship.col5# <cfif len(notedetailshtml)><BR>
                                <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remotenotedetails#NotesRelationship.noteid#" data-bs-placement="top" title="View Details" data-bs-original-title="View Details">
                                    <i class="mdi mdi-eye-outline"></i> Details
                                </a>
                            </cfif></td>

                            <!--- Delete Note --->
                            <td>
                                <a title="Delete Note" href="" data-bs-toggle="modal" data-bs-target="##remoteDeleteFormNote#notesRelationship.noteid#">
                                    <i class="mdi mdi-trash-can-outline mr-1"></i>
                                </a>
                            </td>
                        </tr>
                    </cfoutput>
                </cfloop>
            </tbody>
        </table>
    </div>
</div>

<!--- Mobile Layout --->
<cfinclude template="/include/qry/mobileLayout.cfm" />

<!--- Modifications: 1, 2, 3, 4, 5, 6, 7, 9, 10 --->