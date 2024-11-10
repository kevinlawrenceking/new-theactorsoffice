<div class="d-flex justify-content-between"> 
    <div class="float-left"> 
        <!--- Check if there are no notes and display a message if true ---> 
        <cfif NotesEvent.recordcount is 0> No notes. </cfif> 
        <!--- Output the count of notes ---> 
        You have <strong>#NotesEvent.recordcount#</strong> note<cfif NotesEvent.recordcount is not 1>s</cfif>. 
    </div> 
    <div class="float-end"> 
        <!--- Link to add a new note ---> 
        <a href="/app/note-add-event/?returnurl=appoint&reventid=#eventid#&rcontactid=0" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e;"> Add </a> 
    </div> 
</div> 

<div class="nomobile"> 
    <div class="table-responsive" id="NotesContact_container"> 
        <table id="notes-datatable" class="table display dt-responsive nowrap w-100 table-striped table-hover"> 
            <thead> 
                <!--- Output the header row for the notes table ---> 
                <cfoutput query="NotesEvent" maxrows="1"> 
                    <cfif (NotesEvent.CurrentRow MOD 2)> 
                        <Cfset rowType="Odd" /> 
                    </cfif> 
                    <cfif (NotesEvent.CurrentRow MOD 1)> 
                        <Cfset rowType="Even" /> 
                    </cfif> 

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
                <!--- Loop through each note in NotesEvent ---> 
                <cfloop query="NotesEvent"> 
                    <cfset newNoteId=NotesEvent.noteid /> 

                    <!--- Include templates for links and attachments ---> 
                    <cfinclude template="/include/qry/links_182_1.cfm" /> 
                    <cfinclude template="/include/qry/attachments_181_2.cfm" /> 

                    <cfoutput> 
                        <!--- JavaScript to handle modal for adding links ---> 
                        <script> 
                            $(document).ready(function() { 
                                $("##remoteaddlink#NotesEvent.noteid#").on("show.bs.modal", function(event) { 
                                    // Place the returned HTML into the selected element 
                                    $(this).find(".modal-body").load("/include/linkadd.cfm?contactid=0&noteid=#newNoteId#&returnurl=appoint"); 
                                }); 
                            }); 
                        </script> 

                        <div id="remoteaddlink#NotesEvent.noteid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true"> 
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

                        <!--- JavaScript to handle modal for note details ---> 
                        <script> 
                            $(document).ready(function() { 
                                $("##remotenotedetails#NotesEvent.noteid#").on("show.bs.modal", function(event) { 
                                    // Place the returned HTML into the selected element 
                                    $(this).find(".modal-body").load("/include/remotenotedetails.cfm?contactid=0&noteid=#newNoteId#&returnurl=appoint"); 
                                }); 
                            }); 
                        </script> 

                        <div id="remotenotedetails#NotesEvent.noteid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true"> 
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

                        <!--- JavaScript to handle modal for adding attachments ---> 
                        <script> 
                            $(document).ready(function() { 
                                $("##remoteaddattachment#NotesEvent.noteid#").on("show.bs.modal", function(event) { 
                                    // Place the returned HTML into the selected element 
                                    $(this).find(".modal-body").load("/include/attachmentadd.cfm?contactid=0&noteid=#newNoteId#&returnurl=appoint"); 
                                }); 
                            }); 
                        </script> 

                        <div id="remoteaddattachment#NotesEvent.noteid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true"> 
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
                                <a title="Edit" href="/app/note-update-event/?noteid=#NotesEvent.noteid#&returnurl=appoint&reventid=#eventid#&eventid=#eventid#&rcontactid=0"> 
                                    <i class="mdi mdi-square-edit-outline"></i> 
                                </a> 
                            </td> 

                            <td class="text-nowrap">#dateformat(NotesEvent.col1,'m-d-YYYY')#<BR />#timeformat(NotesEvent.col2,'medium')#</td> 

                            <td class="text-nowrap"> 
                                <cfif NotesEvent.col4 is 1>
                                    Public
                                <cfelse>
                                    Private
                                </cfif> 
                            </td> 

                            <TD class="text-nowrap"> 
                                <!--- Link to add a new link ---> 
                                <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteaddlink#NotesEvent.noteid#" data-bs-placement="top" title="Add Link" data-bs-original-title="Add Link"> 
                                    <i class="fe-plus-circle"></i> Add link 
                                </a> 

                                <cfif links.recordcount is not 0> 
                                    <cfloop query="links"> 
                                        <BR /> 
                                        <a href="#linkurl#" target="#newNoteId#">#linkname#</a> 
                                        <a href="/include/linkdel.cfm?linkid=#links.linkid#&eventid=#eventid#&reventid=#eventid#&returnurl=appoint" title="delete link"> 
                                            <i class="mdi mdi-trash-can-outline mr-1"></i> 
                                        </a> 
                                    </cfloop> 
                                </cfif> 
                            </TD> 

                            <TD class="text-nowrap"> 
                                <!--- Link to add a new attachment ---> 
                                <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteaddattachment#NotesEvent.noteid#" data-bs-placement="top" title="Add attachment" data-bs-original-title="Add attachment"> 
                                    <i class="fe-plus-circle"></i> Add attachment 
                                </a> 

                                <cfif attachments.recordcount is not 0> 
                                    <cfloop query="attachments"> 
                                        <BR /> 
                                        <a href="/include/download.cfm?attachid=#attachid#">#attachname#</a> 
                                        <a href="/include/attachmentdel.cfm?contactid=0&rcontactid=0&attachid=#attachments.attachid#&eventid=#eventid#&returnurl=appoint" title="delete attachment"> 
                                            <i class="mdi mdi-trash-can-outline mr-1"></i> 
                                        </a> 
                                    </cfloop> 
                                </cfif>