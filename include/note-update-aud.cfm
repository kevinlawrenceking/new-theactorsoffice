<!--- This ColdFusion page handles the display and submission of notes related to a contact, including options for visibility and additional details. --->

<cfparam name="rcontactid" default="0" />
<cfset currentid = rcontactid />

<cfinclude template="/include/qry/relationships_13_1.cfm" />

<div class="row">
    <div class="col-xl-6 col-lg-8 col-md-12">
        <div class="card">
            <div class="card-body">
                <cfoutput>
                    <h4>#details.fullName#</h4>
                </cfoutput>

                <!--- Form for submitting notes --->
                <cfform method="post" action="/include/note-update-aud2.cfm" class="parsley-examples" name="aud-form" id="form-aud" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
                    <cfoutput>
                        <input type="hidden" name="audprojectid" value="#audprojectid#">
                        <input type="hidden" name="returnurl" value="#returnurl#">
                        <input type="hidden" name="rcontactid" value="#rcontactid#">
                        <input type="hidden" name="userid" value="#userid#">
                        <input type="hidden" name="noteid" value="#noteid#">
                    </cfoutput>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="audDescription">Note<span class="text-danger">*</span></label>
                            <textarea class="form-control" type="text" id="noteDetails" name="noteDetails" placeholder="Write a note..." rows="1" required data-parsley-required data-parsley-error-message="Details are required"><cfoutput>#trim(note.notedetails)#</cfoutput>
                            </textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <p>For more detailed notes, use the built-in text editor below:</p>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="snow-editor">Details (Optional)</label>
                            <div id="snow-editor" style="height: 200px;">
                                <cfoutput>#note.notedetailshtml#</cfoutput>
                            </div>
                        </div>

                        <!--- Conditional display for public/private note visibility --->
                        <cfif "#returnurl#" is "contact">
                            <div class="form-group col-md-12">
                                <label for="audTypeName">Who can see your note?<span class="text-danger">*</span>
                                    &nbsp;
                                    <a class="primary" href="" data-bs-toggle="modal" data-bs-target="#helpmodal">
                                        <i class="mdi mdi-help-circle fa-1x" style="color:black;"></i>
                                    </a>
                                </label>
                                <select class="form-control" style="max-width:300px;" name="isPublic" id="isPublic" data-parsley-required data-parsley-error-message="Note type is required">
                                    <option value="1" <cfif #note.ispublic# is "1"> selected</cfif>>Public</option>
                                    <option value="0" <cfif #note.ispublic# is "0"> selected</cfif>>Private</option>
                                </select>
                            </div>
                        <cfelse>
                            <input type="hidden" name="isPublic" value="0" />
                        </cfif>
                    </div>

                    <div class="col-12">
                        <textarea name="notetext" style="display:none" id="hiddenArea"></textarea>
                    </div>
                    <div class="row mt-2">
                        <div class="col-6"></div>
                        <div class="col-6 text-right">
                            <a href="javascript:history.go(-1)">
                                <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button>
                            </a>
                            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-aud">Update</button>
                        </div>
                    </div>
                </cfform>
            </div>
        </div>
    </div>
</div>

<!--- Modal for help regarding note visibility --->
<div class="modal" id="helpmodal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Who can see your note?</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span >
&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Notes with a status of <strong>Public</strong> will appear for your team to view</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $(".parsley-examples").parsley();
    });
</script>

<script>
    $("#form-aud").on("submit", function() {
        $("#hiddenArea").val($("#snow-editor").html());
    });
</script>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />

