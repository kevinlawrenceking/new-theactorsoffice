<!--- This ColdFusion page handles the creation of an appointment with various input fields and validation. --->

<cfparam name="rcontactid" default="0"/>

<cfinclude template="/include/qry/relationships_13_1.cfm"/>
<cfinclude template="/include/qry/durations.cfm"/>
<cfinclude template="/include/qry/eventtypes_user_443_2.cfm"/>

<div class="col-xl-6 col-lg-8 col-md-12">
  <div class="card mb-3">

    <div class="card-body">

     <!--- Form for adding an appointment --->
<form method="post" action="/include/appoint-add2.cfm" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
  <cfoutput>
    <input type="hidden" name="returnurl" value="#returnurl#" />
    <input type="hidden" name="rcontactid" value="#rcontactid#" />
    <input type="hidden" name="userid" value="#userid#" />
  </cfoutput>

  <div class="row">
    <!--- Title --->
    <div class="col-md-12">
      <div class="mb-3">
        <label class="form-label">Title <span class="text-danger">*</span></label>
        <input type="text" class="form-control" autocomplete="off" placeholder="Insert Appointment Title" name="eventTitle" id="eventTitle" required data-parsley-minlength="3" data-parsley-minlength-message="Min length 3 characters" data-parsley-maxlength="200" data-parsley-maxlength-message="Max length 200 characters" data-parsley-error-message="Title is required">
      </div>
    </div>

    <!--- Relationships --->
    <div class="col-md-12">
      <div class="mb-3">
        <label class="form-label">Relationships <span class="text-danger">*</span></label>
        <select id="select-relationship" name="relationships" class="form-select" multiple required data-parsley-error-message="Relationship is required">
          <option value="">Select a Relationship...</option>
          <cfloop query="relationships">
            <cfoutput>
              <option value="#relationships.contactid#" <cfif "#relationships.contactid#" is "#rcontactid#">selected</cfif>>
                #recordname#
              </option>
            </cfoutput>
          </cfloop>
        </select>
      </div>
    </div>

    <!--- Description --->
    <div class="col-md-12">
      <div class="mb-3">
        <label for="eventDescription" class="form-label">Description</label>
        <textarea class="form-control" id="eventDescription" name="eventDescription" rows="4" placeholder="Description"></textarea>
      </div>
    </div>

    <!--- Location --->
    <div class="col-md-12">
      <div class="mb-3">
        <label for="eventLocation" class="form-label">Location</label>
        <input type="text" class="form-control" id="eventLocation" name="eventLocation" autocomplete="off" placeholder="Location">
      </div>
    </div>

    <!--- Start Date --->
    <div class="col-md-6 col-sm-12">
      <div class="mb-3">
        <label for="eventStart" class="form-label">Start Date <span class="text-danger">*</span></label>
        <input type="date" class="form-control" id="eventStart" name="eventStart" required data-parsley-error-message="Start Date is required">
      </div>
    </div>

    <!--- Type --->
    <div class="col-md-6 col-sm-12">
      <div class="mb-3">
        <label for="eventTypeName" class="form-label">Type <span class="text-danger">*</span></label>
        <select class="form-select" name="eventTypeName" id="eventTypeName" required data-parsley-error-message="Type is required">
          <option value=""></option>
          <cfoutput query="eventtypes_user">
            <cfif eventtypes_user.eventtypename neq "audition">
              <option value="#eventtypes_user.eventtypename#">#eventtypes_user.eventtypename#</option>
            </cfif>
          </cfoutput>
        </select>
      </div>
    </div>

    <!--- Start Time --->
    <div class="col-md-6 col-sm-12">
      <div class="mb-3">
        <label for="eventStartTime" class="form-label">Start Time <span class="text-danger">*</span></label>
        <select class="form-select" name="eventStartTime" id="eventStartTime" required data-parsley-error-message="Start Time is required">
          <option value="">Select a Start Time</option>
          <cfloop condition="startTime LTE endTime">
            <cfoutput>
              <option value="#timeString#" <cfif timeString EQ new_calstarttime>selected</cfif>>
                #displayTime#
              </option>
            </cfoutput>
            <cfset startTime = dateAdd("n", 15, startTime)>
          </cfloop>
        </select>
      </div>
    </div>

    <!--- Duration --->
    <div class="col-md-6 col-sm-12">
      <div class="mb-3">
        <label for="new_durid" class="form-label">Duration</label>
        <select class="form-select" name="new_durid" id="new_durid">
          <cfoutput query="durations">
            <option value="#durations.durid#" <cfif #durations.durid# is "4">selected</cfif>>
              #durations.durname#
            </option>
          </cfoutput>
        </select>
      </div>
    </div>

    <!--- Note --->
    <div class="col-md-12">
      <div class="mb-3">
        <label for="noteDetails" class="form-label">Note</label>
        <textarea class="form-control" id="noteDetails" name="noteDetails" rows="4" placeholder="Note to be added to Notes Log"></textarea>
      </div>
    </div>

    <!--- Recurring Days --->
    <div class="col-md-12">
      <div class="mb-3">
        <label class="form-label mb-3 d-block">Recurring Every:</label>
        <div class="row">
          <cfloop list="Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday" index="day" delimiters=",">
            <div class="col-6 col-sm-4 col-lg-3 mb-2">
              <input type="checkbox" name="dow" value="#day#" autocomplete="off">
              <label>#day#</label>
            </div>
          </cfloop>
        </div>
      </div>
    </div>

    <!--- Recurring End --->
    <div class="col-md-6 col-sm-12">
      <div class="mb-3">
        <label for="endRecur" class="form-label">Recurring Until:</label>
        <input type="date" class="form-control" id="endRecur" name="endRecur">
      </div>
    </div>
  </div>

  <!--- Submit and Back Buttons --->
  <div class="row mt-4">
    <div class="col-12 d-flex justify-content-end">
      <a href="javascript:history.go(-1)" class="btn btn-secondary btn-sm me-2">Back</a>
      <button type="submit" class="btn btn-primary btn-sm">Add</button>
    </div>
  </div>
</form>


      <div style="margin-bottom:100px;"></div>

    </div>

  </div>

</div>

          <script>
            $(document).ready(function () {
              $("#select-relationship").selectize({
                persist: false,
                createOnBlur: true,
                create: true,
                plugins: ["remove-button"],
                delimiter: ",",
                create: function (input) {
                  return {value: input, text: input};
                }
              });
            });
          </script>

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
