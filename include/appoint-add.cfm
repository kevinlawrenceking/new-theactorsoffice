<!--- This ColdFusion page handles the creation of an appointment with various input fields and validation. --->

<cfparam name="rcontactid" default="0"/>

<style>
  #hidden_div {
    display: none;
  }
</style>

<cfinclude template="/include/qry/relationships_13_1.cfm"/>
<cfinclude template="/include/qry/durations.cfm"/>
<cfinclude template="/include/qry/eventtypes_user_443_2.cfm"/>



    <div class="col-xl-6 col-lg-8 col-md-12">
      <div class="card">
    

        <div class="card-body">






            
                <!--- Form for adding an appointment --->
                <form 
                    method="post" 
                    action="/include/appoint-add2.cfm" 
                    class="parsley-examples" 
                    name="event-form" 
                    id="form-event" 
                    data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" 
                    data-parsley-trigger="keyup" 
                    data-parsley-validate>
                    <cfoutput>
                        <input type="hidden" name="returnurl" value="#returnurl#">
                        <input type="hidden" name="rcontactid" value="#rcontactid#">
                        <input type="hidden" name="userid" value="#userid#">
                    </cfoutput>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label class="control-label">Title<span class="text-danger">*</span></label>
                                <input 
                                    class="form-control" 
                                    autocomplete="off" 
                                    placeholder="Insert Appointment Title" 
                                    type="text" 
                                    name="eventTitle" 
                                    id="eventTitle" 
                                    data-parsley-minlength="3" 
                                    data-parsley-minlength-message="Min length 3 characters" 
                                    data-parsley-maxlength="200" 
                                    data-parsley-maxlength-message="Max length 200 characters" 
                                    data-parsley-required 
                                    data-parsley-error-message="Title is required" />
                            </div>
                        </div>

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
                                <select 
                                    id="select-relationship" 
                                    name="relationships" 
                                    autocomplete="off" 
                                    multiple 
                                    required 
                                    data-parsley-required 
                                    data-parsley-error-message="Relationship is required" 
                                    class="demo-default selectize-close-btn" 
                                    style="width: 100%" 
                                    placeholder="Select a Relationship..." 
                                    value="">
                                    <option value="">Select a Relationship...</option>
                                    <cfloop query="relationships">
                                        <cfoutput>
                                            <option 
                                                value="#relationships.contactid#" 
                                                <cfif "#relationships.contactid#" is "#rcontactid#">selected</cfif>>
                                                #recordname#
                                            </option>
                                        </cfoutput>
                                    </cfloop>
                                </select>
                            </div>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventDescription">Description</label>
                            <textarea 
                                class="form-control" 
                                type="text" 
                                id="eventDescription" 
                                name="eventDescription" 
                                placeholder="Description" 
                                rows="4"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventLocation">Location</label>
                            <input 
                                class="form-control" 
                                type="text" 
                                id="eventLocation" 
                                autocomplete="off" 
                                name="eventLocation" 
                                placeholder="Location">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="eventStart">Start Date<span class="text-danger">*</span></label>
                            <input 
                                id="eventStart" 
                                class="form-control" 
                                autocomplete="off" 
                                name="eventStart" 
                                type="date" 
                                data-parsley-required 
                                data-parsley-error-message="Start Date is required">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="eventTypeName">Type<span class="text-danger">*</span></label>
                            <select 
                                class="form-control" 
                                name="eventTypeName" 
                                id="eventTypeName" 
                                data-parsley-required 
                                data-parsley-error-message="Type is required">
                                <option value=""></option>
                                <cfoutput query="eventtypes_user">
                                    <option value="#eventtypes_user.eventtypename#">#eventtypes_user.eventtypename#</option>
                                </cfoutput>
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="eventStartTime">Start Time<span class="text-danger">*</span></label>
                            <select 
                                class="form-control" 
                                name="eventStartTime" 
                                autocomplete="off" 
                                id="eventStartTime" 
                                data-parsley-required 
                                data-parsley-error-message="Start Time is required">
                                <option value="">Select a Start Time</option>
                                <cfset new_calstarttime = timeformat(calstarttime, "HH:mm:ss")>
                                <cfset startTime = createDateTime(year(now()), month(now()), day(now()), 5, 0, 0)>
                                <cfset endTime = createDateTime(year(now()), month(now()), day(now()), 23, 45, 0)>
                                <cfloop condition="startTime LTE endTime">
                                    <cfset timeString = timeFormat(startTime, "HH:mm:ss")>
                                    <cfset displayTime = timeFormat(startTime, "h:mm tt")>
                                    <cfoutput>
                                        <option 
                                            value="#timeString#" 
                                            <cfif timeString EQ new_calstarttime>selected</cfif>>
                                            #displayTime#
                                        </option>
                                    </cfoutput>
                                    <cfset startTime = dateAdd("n", 15, startTime)>
                                </cfloop>
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="new_durid">Duration</label>
                            <select class="form-control" name="new_durid" autocomplete="off" id="new_durid">
                                <cfoutput query="durations">
                                    <option 
                                        value="#durations.durid#" 
                                        <cfif #durations.durid# is "4">selected</cfif>>
                                        #durations.durname#
                                    </option>
                                </cfoutput>
                            </select>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="noteDetails">Note</label>
                            <textarea 
                                class="form-control" 
                                type="text" 
                                id="noteDetails" 
                                name="noteDetails" 
                                placeholder="Note to be added to Notes Log" 
                                rows="4"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventStopTime">Recurring every:</label>
                            <div id="checkboxes">
                                <input type="checkbox" name="dow" value="1" autocomplete="off" onchange="showDiv('hidden_div', this)"> Monday
                                <input type="checkbox" name="dow" value="2" onchange="showDiv('hidden_div', this)"> Tuesday
                                <input type="checkbox" name="dow" value="3" onchange="showDiv('hidden_div', this)"> Wednesday
                                <input type="checkbox" name="dow" value="4" onchange="showDiv('hidden_div', this)"> Thursday
                                <input type="checkbox" name="dow" value="5" onchange="showDiv('hidden_div', this)"> Friday
                                <input type="checkbox" name="dow" value="6" onchange="showDiv('hidden_div', this)"> Saturday
                                <input type="checkbox" name="dow" value="0" onchange="showDiv('hidden_div', this)"> Sunday
                            </div>
                        </div>

                        <div class="form-group col-md-6" id="hidden_div">
                            <label for="eventStart">Recurring Until:</label>
                            <input class="form-control" id="endRecur" name="endRecur" type="date">
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
                </div>
                </form>



</div>
        
        </div>
      </div>
    </div>
  

<style>
  .card-body {
    padding-bottom: 300px !important;
  }
</style>
<script>
  $(document).ready(function () {
    $(".parsley-examples").parsley();
  });
</script>

<script>
  function showDiv(divId, element) {
    var checked = document.querySelectorAll('input[name="dow"]:checked');
    var hiddenDiv = document.getElementById(divId);

    if (checked.length === 0) {
      hiddenDiv.style.display = 'none';
      document
        .getElementById("endRecur")
        .value = "";
      $("#endRecur").prop('required', false);
    } else {
      hiddenDiv.style.display = 'block';
      $("#endRecur").prop('required', true);
    }
  }
</script>

<script>
  $('select[name=eventStartTime]').on("change", function () {
    var theSelectedIndex = $(this)[0].selectedIndex;
    $.each($('select[name=eventStopTime] option'), function () {
      var endOptionIndex = $(this).index();
      if (endOptionIndex < theSelectedIndex) {
        $(this).attr('disabled', 'disabled');
      } else {
        $(this)
          .removeAttr('disabled')
          .prop('selected', true);
        return false;
      }
    });
  });
</script>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), '\')#"/>
<cfinclude template="/include/bigbrotherinclude.cfm"/>
