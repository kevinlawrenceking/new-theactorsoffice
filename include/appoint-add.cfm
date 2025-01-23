<!--- This ColdFusion page handles the creation of an appointment with various input fields and validation. --->

<cfparam name="rcontactid" default="0" />
<cfinclude template="/include/qry/relationships_13_1.cfm" />
<cfinclude template="/include/qry/durations.cfm" />
<cfinclude template="/include/qry/eventtypes_user_443_2.cfm" />

<script>
  $(document).ready(function () {
    $("#select-relationship").selectize({
      persist: false,
      createOnBlur: true,
      create: true,
      plugins: ["remove_button"],
      delimiter: ",",
      create: function (input) {
        return {
          value: input,
          text: input,
        };
      },
    });
  });
</script>

<div class="col-xl-6 col-lg-8 col-md-12">
  <div class="card mb-3">
    <div class="card-body">
      <form 
        method="post" 
        action="/include/appoint-add2.cfm" 
        class="parsley-examples" 
        name="event-form" 
        id="form-event" 
        data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" 
        data-parsley-trigger="keyup" 
        data-parsley-validate="data-parsley-validate"
      >
        <cfoutput>
          <input type="hidden" name="returnurl" value="#returnurl#" />
          <input type="hidden" name="rcontactid" value="#rcontactid#" />
          <input type="hidden" name="userid" value="#userid#" />
        </cfoutput>

        <div class="row">
          <!--- Title --->
          <div class="col-12">
            <div class="form-group">
              <label class="control-label">Title <span class="text-danger">*</span></label>
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
                data-parsley-required="true" 
                data-parsley-error-message="Title is required" 
              />
            </div>
          </div>

          <!--- Relationships --->
          <div class="col-lg-12">
            <div class="form-group mb-3">
              <label for="select-relationship" class="form-label">
                Relationships <span class="text-danger" aria-hidden="true">*</span>
                <span class="visually-hidden">(required)</span>
              </label>
              <select 
                id="select-relationship" 
                name="relationships" 
                autocomplete="off" 
                multiple 
                data-parsley-required="true" 
                data-parsley-error-message="Relationship is required" 
                class="demo-default selectize-close-btn w-100" 
                placeholder="Select one or more Relationships..."
              >
                <option value="">Select one or more Relationships...</option>
                <cfloop query="relationships">
                  <cfoutput>
                    <option value="#relationships.contactid#" <cfif "#relationships.contactid#" is "#rcontactid#">selected</cfif>>#recordname#</option>
                  </cfoutput>
                </cfloop>
              </select>
            </div>
          </div>

          <!--- Description --->
          <div class="form-group col-md-12">
            <label for="eventDescription">Description</label>
            <textarea 
              class="form-control" 
              id="eventDescription" 
              name="eventDescription" 
              placeholder="Description" 
              rows="4"
            ></textarea>
          </div>

          <!--- Location --->
          <div class="form-group col-md-12">
            <label for="eventLocation">Location</label>
            <input 
              class="form-control" 
              type="text" 
              id="eventLocation" 
              autocomplete="off" 
              name="eventLocation" 
              placeholder="Location" 
            />
          </div>

                    <!--- Start Date --->
          <div class="form-group col-md-6 col-sm-12">
            <label for="eventStart">Start Date <span class="text-danger">*</span></label>
            <input 
              id="eventStart" 
              class="form-control" 
              autocomplete="off" 
              name="eventStart" 
              type="date" 
              data-parsley-required="true" 
              data-parsley-error-message="Start Date is required" 
            />
          </div>

          <!--- Type --->
          <div class="form-group col-md-6 col-sm-12">
            <label for="eventTypeName">Type <span class="text-danger">*</span></label>
            <select 
              class="form-control" 
              name="eventTypeName" 
              id="eventTypeName" 
              data-parsley-required="true" 
              data-parsley-error-message="Type is required"
            >
              <option value=""></option>
              <cfoutput query="eventtypes_user">
                <cfif eventtypes_user.eventtypename neq "audition">
                  <option value="#eventtypes_user.eventtypename#">#eventtypes_user.eventtypename#</option>
                </cfif>
              </cfoutput>
            </select>
          </div>

          <!--- Start Time --->
          <div class="form-group col-md-6 col-sm-12">
            <label for="eventStartTime">Start Time <span class="text-danger">*</span></label>
            <select 
              class="form-control" 
              name="eventStartTime" 
              autocomplete="off" 
              id="eventStartTime" 
              data-parsley-required="true" 
              data-parsley-error-message="Start Time is required"
            >
              <option value="">Select a Start Time</option>
              <cfloop condition="startTime LTE endTime">
                <cfoutput>
                  <option value="#timeString#" <cfif timeString EQ new_calstarttime>selected</cfif>>#displayTime#</option>
                </cfoutput>
                <cfset startTime = dateAdd("n", 15, startTime) />
              </cfloop>
            </select>
          </div>

          <!--- Recurring Checkboxes --->
          <div class="form-group col-md-12">
            <label for="eventStopTime" class="mb-3 d-block">Recurring every:</label>
            <div id="checkboxes" class="row">
              <div class="col-12 col-sm-6 col-lg-5 col-xl-4 mb-2">
                <input type="checkbox" id="dow1" name="dow" value="1" autocomplete="off" onchange="showDiv('hidden_div', this)" />
                <label for="dow1">Monday</label>
              </div>
              <!--- Repeat for other days --->
            </div>
          </div>

          <!--- Submit Buttons --->
          <div class="row mt-4">
            <div class="col-12 d-flex justify-content-end">
              <a href="javascript:history.go(-1)" class="btn btn-secondary btn-sm me-2">Back</a>
              <button type="submit" class="btn btn-primary btn-sm" id="btn-save-event">Add</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

