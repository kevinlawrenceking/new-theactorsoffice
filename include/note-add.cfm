<!--- This ColdFusion page is used to display a form for adding notes related to a contact, including relationships and event connections. --->
<cfparam name="contactID" default="0" />
<cfset currentID = contactID />

<style>
    .hidden-div {
        display: none;
    }
</style>

<cfinclude template="/include/qry/relationships_13_1.cfm" />

<div class="row">
    <div class="col-xl-6 col-lg-8 col-md-12">
        <div class="card">
            <div class="card-body">
                <h4><cfoutput>#details.fullName#</cfoutput></h4>
                <!--- Form for adding notes --->
                <cfform method="post" action="/include/note-add2.cfm" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
                    <input type="hidden" name="returnurl" value="<cfoutput>#returnurl#</cfoutput>">
                    <input type="hidden" name="contactID" value="<cfoutput>#contactID#</cfoutput>">
                    <input type="hidden" name="userID" value="<cfoutput>#session.userID#</cfoutput>">

                    <div class="row">
                        <!--- Initialize selectize for relationships --->
                        <script>
                            $(document).ready(function() {
                                $("#select-relationship").selectize({
                                    persist: false,
                                    createOnBlur: true,
                                    create: true,
                                    plugins: ["remove_button"],
                                    delimiter: ",",
                                    create: function(input) {
                                        return {
                                            value: input,
                                            text: input,
                                        };
                                    },
                                });
                            });
                        </script>

                        <div class="form-group col-md-12">
                            <label for="eventDescription">Note Details<span class="text-danger">*</span></label>
                            <textarea class="form-control" type="text" id="noteDetails" name="noteDetails" placeholder="Write a note..." rows="8" required data-parsley-required data-parsley-error-message="Details are required"></textarea>
                        </div>

                        <!--- Check if relationships are defined --->
                        <cfif isdefined('relationships')>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="select-relationship">Relationships<span class="text-danger">*</span></label>
                                    <select id="select-relationship" name="relationships" autocomplete="off" multiple required data-parsley-required data-parsley-error-message="Relationship is required" class="demo-default selectize-close-btn" style="width: 100%" placeholder="Select a Relationship..." value="">
                                        <option value="">Select a Relationship...</option>
                                        <cfloop query="relationships">
                                            <option value="<cfoutput>#relationships.contactID#</cfoutput>" <cfif relationships.contactID eq contactID>selected</cfif>><cfoutput>#recordName#</cfoutput></option>
                                        </cfloop>
                                    </select>
                                </div>
                            </div>
                        </cfif>

                        <div class="form-group col-md-6">
                            <label for="eventTypeName">Who can see your note?<span class="text-danger">*</span></label>
                            <select class="form-control" name="isPublic" id="isPublic" data-parsley-required data-parsley-error-message="Note type is required">
                                <option value="1" selected>Team</option>
                                <option value="0">Only me</option>
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="eventID">Connect to an event</label>
                            <select class="form-control" name="eventID" id="eventID">
                                <option value="0" selected>No event</option>
                                <cfloop query="events">
                                    <option value="<cfoutput>#eventID#</cfoutput>"><cfoutput>#dateFormat(eventStart)# - #eventTitle#</cfoutput></option>
                                </cfloop>
                            </select>
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-6"></div>
                        <div class="col-6 text-right">
                            <a href="javascript:history.go(-1)">
                                <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button>
                            </a>
                            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Add</button>
                        </div>
                    </div>
                </cfform>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $(".parsley-examples").parsley();
    });
</script>

<cfset scriptNameInclude = "/include/" & ListLast(GetCurrentTemplatePath(), " \") />

<!--- Changes made according to standards: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10. --->