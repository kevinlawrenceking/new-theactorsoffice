```ColdFusion
<cfparam name="eventId" default="0" />
<style>
    #hiddenDiv { display: none; }
</style>
<cfinclude template="/include/qry/relationships_13_1.cfm" />

<div class="row">
    <div class="col-xl-6 col-lg-8 col-md-12">
        <div class="card">
            <div class="card-body">
                <h4><cfoutput>#details.fullName#</cfoutput></h4>
                <cfform method="post" action="/include/note-add-event2.cfm" class="parsley-examples" name="eventForm" id="formEvent" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
                    <input type="hidden" name="returnUrl" value="<cfoutput>#returnUrl#</cfoutput>">
                    <input type="hidden" name="contactId" value="<cfoutput>#contactId#</cfoutput>">
                    <input type="hidden" name="eventId" value="<cfoutput>#eventId#</cfoutput>">
                    <input type="hidden" name="userId" value="<cfoutput>#session.userId#</cfoutput>">

                    <div class="row">
                        <cfif isDefined('selectize')>
                            <script>
                                $(document).ready(function() {
                                    $("#selectRelationship").selectize({
                                        persist: false,
                                        createOnBlur: true,
                                        create: true,
                                        plugins: ["remove_button"],
                                        delimiter: ",",
                                        create: function(input) {
                                            return { value: input, text: input };
                                        },
                                    });
                                });
                            </script>
                        </cfif>

                        <div class="form-group col-md-12">
                            <label for="noteDetails">Note Title<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" name="noteDetails" id="noteDetails" data-parsley-required />
                        </div>

                        <div class="form-group col-md-12">
                            <p>For more detailed notes, use the built-in text editor below:</p>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="snowEditor">Details (Optional)</label>
                            <div id="snowEditor" style="height: 200px;"></div>
                        </div>

                        <cfif returnurl is "contact">
                            <div class="form-group col-md-12">
                                <label for="eventTypeName">Who can see your note?<span class="text-danger">*</span> &nbsp;
                                    <a class="primary" href="" data-bs-toggle="modal" data-bs-target="#helpModal">
                                        <i class="mdi mdi-help-circle fa-1x" style="color:black;"></i>
                                    </a>
                                </label>
                                <select class="form-control" style="max-width:300px;" name="isPublic" id="isPublic" data-parsley-required data-parsley-error-message="Note type is required">
                                    <option value="1" selected>Public</option>
                                    <option value="0">Private</option>
                                </select>
                            </div>
                        <cfelse>
                            <input type="hidden" name="isPublic" value="0" />
                        </cfif>

                        <input type="hidden" name="eventId" value="<cfoutput>#eventId#</cfoutput>" />
                    </div>

                    <div class="row mt-2">
                        <textarea name="noteText" style="display:none" id="hiddenArea"></textarea>
                        <div class="col-md-12">
                            <a href="javascript:history.go(-1)">
                                <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button>
                            </a>
                            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btnSaveEvent">Add</button>
                        </div>
                    </div>
                </cfform>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="helpModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Who can see your note?</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Notes with a status of <strong>Public</strong> will appear in the Team Share link for your team to view as well.</p>
                <p>Notes with a status of <strong>Private</strong> will be for your eyes only.</p>
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

    $("#formEvent").on("submit", function() {
        $("#hiddenArea").val($("#snowEditor").html());
    });
</script>

<cfset scriptNameInclude="/include/##ListLast(GetCurrentTemplatePath(), " \")##" />

<!--- Changes: Standardized variable names and casing, removed unnecessary cfoutput tags, ensured consistent attribute quoting, spacing, and formatting, simplified record count logic for icons or conditional displays, maintained consistent and efficient conditional logic. --->