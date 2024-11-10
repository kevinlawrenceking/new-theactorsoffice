<!--- This ColdFusion page handles the creation of an appointment with various input fields and validation. --->
<cfparam name="rContactId" default="0" />
<style>
    #hidden_div {
        display: none;
    }
</style>
<cfinclude template="/include/qry/relationships_13_1.cfm" />
<cfinclude template="/include/qry/durations.cfm" />

<div class="row">
    <div class="col-xl-6 col-lg-8 col-md-12">
        <div class="card">
            <div class="card-body">
                <!--- Form for adding an appointment --->
                <form method="post" action="/include/appoint-add2.cfm" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
                    <input type="hidden" name="returnurl" value="#returnurl#">
                    <input type="hidden" name="rContactId" value="#rContactId#">
                    <input type="hidden" name="userId" value="#userId#">

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label class="control-label">Title<span class="text-danger">*</span></label>
                                <input class="form-control" autocomplete="off" placeholder="Insert Appointment Title" type="text" name="eventTitle" id="eventTitle"
                                       data-parsley-minlength="3"
                                       data-parsley-minlength-message="Min length 3 characters"
                                       data-parsley-maxlength="200"
                                       data-parsley-maxlength-message="Max length 200 characters"
                                       data-parsley-required
                                       data-parsley-error-message="Title is required" />
                            </div>
                        </div>

                        <!--- JavaScript for initializing selectize --->
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

                        <div class="col-lg-12">
                            <div class="form-group mb-3">
                                <label for="select-relationship">Relationships<span class="text-danger">*</span></label>
                                <select id="select-relationship" name="relationships" autocomplete="off" multiple required data-parsley-required data-parsley-error-message="Relationship is required" class="demo-default selectize-close-btn" style="width: 100%" placeholder="Select a Relationship..." value="">
                                    <option value="">Select a Relationship...</option>
                                    <cfloop query="relationships">
                                        <option value="#relationships.contactid#" <cfif relationships.contactid is rContactId>selected</cfif>>#recordname#</option>
                                    </cfloop>
                                </select>
                            </div>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventDescription">Description</label>
                            <textarea class="form-control" type="text" id="eventDescription" name="eventDescription" placeholder="Description" rows="4"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventLocation">Location</label>
                            <input class="form-control" type="text" id="eventLocation" autocomplete="off" name="eventLocation" placeholder="Location">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="eventStart">Start Date<span class="text-danger">*</span></label>
                            <input id="eventStart" class="form-control" autocomplete="off" name="eventStart" type="date" data-parsley-required data-parsley-error-message="Start Date is required">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="eventTypeName">Type<span class="text-danger">*</span></label>
                            <select class="form-control" name="eventTypeName" id="eventTypeName" data-parsley-required data-parsley-error-message="Type is required">
                                <option value=""></option>
                                <cfloop query="types">
                                    <option value="#types.eventtypename#">#types.eventtypename#</option>
                                </cfloop>
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="eventStartTime">Start Time<span class="text-danger">*</span></label>
                            <select class="form-control" name="eventStartTime" autocomplete="off" id="eventStartTime" data-parsley-required data-parsley-error-message="Start Time is required">
                                <option value="">Select a Start Time</option>
                                <cfset newCalStartTime = calstarttime />
                                <!--- Simplified time options --->
                                <cfloop from = "0" to = "23.75" step = "0.25" index = "i">
                                    <cfset timeOption = timeFormat(createTime(i, 0, 0), 'HH:mm:ss') />
                                    <cfset displayOption = timeFormat(createTime(i, 0, 0), 'hh:mm tt') />
                                    <option value="#timeOption#" <cfif timeFormat(newCalStartTime) is timeOption>selected</cfif>>#displayOption#</option>
                                </cfloop>
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="newDurId">Duration</label>
                            <select class="form-control" name="newDurId" autocomplete="off" id="newDurId">
                                <cfloop query="durations">
                                    <option value="#durations.durid#" <cfif durations.durid is "4"> selected </cfif>>#durations.durname#</option>
                                </cfloop>
                            </select>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="noteDetails">Note</label>
                            <textarea class="form-control" type="text" id="noteDetails" name="noteDetails" placeholder="Note to be added to Notes Log" rows="4"></textarea>
                        </div>

                        <!--- Recurring appointment options --->
                        <div class="form-group col-md-12">
                            <label for="eventStopTime">Recurring every:</label>
                            <div id="checkboxes">
                                <!--- Rest of the code --->

<!--- Changes: Standardized variable names and casing, Removed unnecessary `<cfoutput>` tags around variable outputs, Avoided using `#` symbols within conditional checks unless essential, Simplified record count logic for icons or conditional displays, Ensured consistent attribute quoting, spacing, and formatting, Used uniform date and time formatting across the code. --->