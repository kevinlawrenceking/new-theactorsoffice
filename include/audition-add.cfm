<!--- This ColdFusion page handles the audition submission form, including various fields and dynamic visibility of elements based on user input. --->

<cfparam name="rcontactid" default="0"/> <!--- Set default value for rcontactid --->
<cfparam name="isdirect" default="0"/> <!--- Set default value for isdirect --->

<style>
  /* Styles for hidden divs */
  #hidden_divs {
    display: none;
  }

  #hidden_divss {
    display: none;
  }

  #hidden_divsss {
    display: none;
  }

  #hidden_divssss {
    display: none;
  }

  /* Output text style */
  .output {
    font: 1rem 'Fira Sans', sans-serif;
  }

  /* Fieldset styling */
  fieldset {
    display: block;
    margin-inline-start: 1px;
    margin-inline-end: 1px;
    padding-block-start: 0.35em;
    padding-inline-start: 0.75em;
    padding-inline-end: 0.75em;
    padding-block-end: 0.625em;
    min-inline-size: min-content;
    border-width: 2px;
    border-style: groove;
    border-color: #ced4da;
    border-style: solid;
    border-image: initial;
  }
</style>

<cfset dbug="N"/> <!--- Initialize debug variable --->

<cfinclude template="/include/fetchLocationService.cfm" /> <!--- Include location service --->
<cfinclude template="/include/qry/audplatforms_user_sel.cfm"/> <!--- Include user selected audition platforms --->
<cfinclude template="/include/fetchLocationService.cfm" /> <!--- Include location service again --->
<cfinclude template="/include/qry/cities_448_1.cfm"/> <!--- Include cities query --->
<cfinclude template="/include/qry/cat_27_1.cfm" />

<cfset new_audcatid = cat.audcatid/> <!--- Set new_audcatid from query result --->

<cfinclude template="/include/qry/audroletypes_sel_27_2.cfm" />
<cfinclude template="/include/qry/audtypes_sel_27_3.cfm" />
<cfinclude template="/include/qry/casting_types_27_4.cfm" />
<cfinclude template="/include/qry/castingdirectors_sel.cfm"> <!--- Include casting directors selection --->

<cfif #isdirect# is "1"> <!--- Check if isdirect is 1 --->
  <style>
    #hidedirectbooking {
      display: none;
    }

    .input {
      margin: 0 auto;
    }
  </style>
</cfif>

<style>
  #hidden_div {
    display: none;
  }

  .input {
    margin: 0 auto;
  }
</style>

<div class="row">
  <div class="col-xl-6 col-lg-8 col-md-12">
    <div class="card">
      <div class="card-body">
        <form method="post" action="/include/audition-add2.cfm" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate="data-parsley-validate">
          <cfoutput>
            <input type="hidden" name="new_audStepID" value="1"/>
            <input type="hidden" name="new_audcatid" value="#cat.audcatid#"/>
            <input type="hidden" name="new_audsubcatid" value="#cat.audsubcatid#"/>
            <input type="hidden" name="new_userid" value="#session.userid#"/>
            <input type="hidden" name="isdirect" value="#isdirect#"/>
          </cfoutput>

          <cfif #isdirect# is "1"> <!--- Display Direct Booking header if isdirect is 1 --->
            <h4 class="col-md-12">Direct Booking</h4>
          </cfif>

          <h4 class="col-md-12">
            <cfoutput>Category: #cat.audcatname# - #cat.audsubcatname#</cfoutput>
          </h4>

          <div class="row">
            <div class="form-group col-md-12">
              <label for="new_projname">Project Name (Title)<span class="text-danger">*</span></label>
              <input class="form-control" type="text" id="new_projname" autocomplete="off" required="required" data-parsley-required="data-parsley-required" data-parsley-error-message="Project Name is required" name="new_projname" placeholder="Project Name">
            </div>

            <div class="form-group col-md-12">
              <label for="new_projDescription">Project Description/Logline<span class="text-danger">*</span></label>
              <input class="form-control" type="text" id="new_projDescription" data-parsley-required="data-parsley-required" data-parsley-="data-parsley-" name="new_projDescription" error-message="Project Description is required" placeholder="Project Description">
            </div>

            <script>
              function showDivss(divId, element) {
                document.getElementById(divId).style.display = element.value == 1 ? 'block' : 'none';
              }
            </script>

            <script>
              function showDivs(divId, element) {
                document.getElementById(divId).style.display = element.value == 2 ? 'block' : 'none';
              }
            </script>

            <script>
              function showDivsss(divId, element) {
                document.getElementById(divId).style.display = element.value == 0 ? 'block' : 'none';
              }
            </script>

            <script>
              function showDivssss(divId, element) {
                console.log("Value: ", element.value, "Type: ", typeof element.value); 
                document.getElementById(divId).style.display = element.value == '0' ? 'none' : 'block';
              }
            </script>

            <script>
              function showdirectbooking(divId, element) {
                document.getElementById(divId).style.display = element.value == 23 ? 'none' : 'block';
              }
            </script>

            <div class="form-group col-md-6 col-sm-12">
              <label for="new_audrolename">Role Name<span class="text-danger">*</span></label>
              <input class="form-control" type="text" id="new_audrolename" autocomplete="off" required="required" data-parsley-required="data-parsley-required" data-parsley-error-message="Role Name is required" name="new_audrolename" placeholder="Role Name">
            </div>

            <cfif #new_audcatid# IS "5"> <!--- Check if new_audcatid is 5 --->
              <input type="hidden" name="new_audroletypeid" value="33"/>
            <cfelse>
              <div class="form-group col-md-6 col-sm-12">
                <label for="new_audroletypeid">Role Type</label>
                <select id="new_audroletypeid" name="new_audroletypeid" class="form-control" data-parsley-required="data-parsley-required" data-parsley-error-message="Role Type is required">
                  <option value="">--</option>
                  <cfoutput query="audroletypes_sel">
                    <option value="#audroletypes_sel.id#">#audroletypes_sel.name#</option>
                  </cfoutput>
                </select>
              </cfif>
            </div>

            <div class="form-group col-md-12">
              <label for="new_contactid">Casting Director</label>
              <select id="new_contactid" class="form-control" name="new_contactid" onChange="showDivssss('hidden_divssss', this);">
                <option value="">--</option>
                <option value="0">***ADD NEW***</option>
                <cfoutput query="castingdirectors_sel">
                  <option value="#castingdirectors_sel.id#">#castingdirectors_sel.name#</option>
                </cfoutput>
              </select>
            </div>

            <div id="hidden_divssss">
              <div class="row">
                <fieldset>
                  <legend>Add New Casting</legend>
                  <div class="form-group col-md-10">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="casting_info" id="casting_director_known" value="casting_director_known" checked="checked">
                      <label class="form-check-label" for="casting_director_known">Casting Director known</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="casting_info" id="only_company_known" value="only_company_known">
                      <label class="form-check-label" for="only_company_known">Only company known</label>
                    </div>
                  </div>

                  <div id="CD">
                    <div class="form-group col-md-6">
                      <label for="cdfirstname">Casting Director</label>
                      <input class="form-control" type="text" id="cdfullname" name="cdfullname" autocomplete="off" placeholder="Casting Director">
                      <div id="nameResults"></div>
                      <div class="invalid-feedback">Please enter a Casting Director.</div>
                    </div>

                    <div class="form-group col-md-6">
                      <div id="cdrole">
                        <label for="cdtype">Casting Director Role<span class="text-danger">*</span></label>
                        <select id="cdtype" name="cdtype" class="form-control" data-parsley-required="data-parsley-required" data-parsley-error-message="Casting Director Role is required">
                          <option value="">--</option>
                          <cfoutput query="casting_types">
                            <option value="#casting_types.name#">#casting_types.name#</option>
                          </cfoutput>
                        </select>
                      </div>
                    </div>
                  </div>

                  <div id="co_only">
                    <div class="form-group col-md-6">
                      <label for="cdco">Casting Company</label>
                      <input class="form-control" type="text" id="companySearch" name="cdco" autocomplete="off" placeholder="Casting Company">
                      <div id="results"></div>
                      <div class="invalid-feedback">Please enter a Casting Company.</div>
                    </div>
                  </div>
                </fieldset>
              </div>
            </div>

            <style>
              .field_set {
                border-color: #ced4da;
                border-width: 1px;
              }
            </style>

            <fieldset class="answer" id="hidedirectbooking">
              <legend>Appointment details</legend>
              <div class="row">
                <div class="form-group col-md-6">
                  <cfif #audtypes_sel.recordcount# is "1">
                    <input type="hidden" name="" value=""/>
                  <cfelse>
                    <label for="audtypeid">Type<span class="text-danger">*</span></label>
                    <select id="audtypeid" name="new_audtypeid" class="form-control" data-parsley-required="data-parsley-required" data-parsley-error-message="Type is required" onChange="showDivs('hidden_divs', this); showDivss('hidden_divss', this); showdirectbooking('hidedirectbooking', this);">
                      <option value="">--</option>
                      <cfoutput query="audtypes_sel">
                        <option value="#audtypes_sel.id#">#audtypes_sel.name#</option>
                      </cfoutput>
                    </select>
                  </cfif>
                </div>

                <div class="form-group col-md-6">
                  <label for="new_eventStart">Start Date / Due Date<span class="text-danger">*</span></label>
                  <input id="new_eventStart" class="form-control" autocomplete="off" name="new_eventStart" type="date" data-parsley-required="data-parsley-required" data-parsley-error-message="Start Date is required">
                </div>

                <div class="form-group col-md-6">
                  <label for="new_eventStartTime">Start Time / Due Time<span class="text-danger">*</span></label>
                  <select class="form-control" name="new_eventStartTime" autocomplete="off" id="new_eventStartTime" data-parsley-required="data-parsley-required" data-parsley-error-message="Start Time is required">
                    <option value="">Select a Start Time</option>
                    <cfoutput>
                      <option value="07:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "07:00 AM">Selected</cfif>>07:00 AM</option>
                      <option value="07:15" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "07:15 AM">Selected</cfif>>07:15 AM</option>
                      <option value="07:30" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "07:30 AM">Selected</cfif>>07:30 AM</option>
                      <option value="07:45" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "07:45 AM">Selected</cfif>>07:45 AM</option>
                      <option value="08:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "08:00 AM">Selected</cfif>>08:00 AM</option>
                      <option value="08:15" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "08:15 AM">Selected</cfif>>08:15 AM</option>
                      <option value="08:30" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "08:30 AM">Selected</cfif>>08:30 AM</option>
                      <option value="08:45" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "08:45 AM">Selected</cfif>>08:45 AM</option>
                      <option value="09:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "09:00 AM">Selected</cfif>>09:00 AM</option>
                      <option value="09:15" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "09:15 AM">Selected</cfif>>09:15 AM</option>
                      <option value="09:30" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "09:30 AM">Selected</cfif>>09:30 AM</option>
                      <option value="09:45" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "09:45 AM">Selected</cfif>>09:45 AM</option>
                      <option value="10:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "10:00 AM">Selected</cfif>>10:00 AM</option>
                      <option value="10:15" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "10:15 AM">Selected</cfif>>10:15 AM</option>
                      <option value="10:30" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "10:30 AM">Selected</cfif>>10:30 AM</option>
                      <option value="10:45" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "10:45 AM">Selected</cfif>>10:45 AM</option>
                      <option value="11:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "11:00 AM">Selected</cfif>>11:00 AM</option>
                      <option value="11:15" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "11:15 AM">Selected</cfif>>11:15 AM</option>
                      <option value="11:30" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "11:30 AM">Selected</cfif>>11:30 AM</option>
                      <option value="11:45" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "11:45 AM">Selected</cfif>>11:45 AM</option>
                      <option value="12:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "12:00 PM">Selected</cfif>>12:00 PM</option>
                      <option value="12:15" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "12:15 PM">Selected</cfif>>12:15 PM</option>
                      <option value="12:30" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "12:30 PM">Selected</cfif>>12:30 PM</option>
                      <option value="12:45" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "12:45 PM">Selected</cfif>>12:45 PM</option>
                      <option value="13:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "01:00 PM">Selected</cfif>>01:00 PM</option>
                      <option value="13:15" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "01:15 PM">Selected</cfif>>01:15 PM</option>
                      <option value="13:30" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "01:30 PM">Selected</cfif>>01:30 PM</option>
                      <option value="13:45" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "01:45 PM">Selected</cfif>>01:45 PM</option>
                      <option value="14:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "02:00 PM">Selected</cfif>>02:00 PM</option>
                      <option value="14:15" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "02:15 PM">Selected</cfif>>02:15 PM</option>
                      <option value="14:30" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "02:30 PM">Selected</cfif>>02:30 PM</option>
                      <option value="14:45" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "02:45 PM">Selected</cfif>>02:45 PM</option>
                      <option value="15:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "03:00 PM">Selected</cfif>>03:00 PM</option>
                      <option value="15:15" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "03:15 PM">Selected</cfif>>03:15 PM</option>
                      <option value="15:30" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "03:30 PM">Selected</cfif>>03:30 PM</option>
                      <option value="15:45" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "03:45 PM">Selected</cfif>>03:45 PM</option>
                      <option value="16:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "04:00 PM">Selected</cfif>>04:00 PM</option>
                      <option value="16:15" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "04:15 PM">Selected</cfif>>04:15 PM</option>
                      <option value="16:30" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "04:30 PM">Selected</cfif>>04:30 PM</option>
                      <option value="16:45" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "04:45 PM">Selected</cfif>>04:45 PM</option>
                      <option value="17:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "05:00 PM">Selected</cfif>>05:00 PM</option>
                      <option value="17:15" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "05:15 PM">Selected</cfif>>05:15 PM</option>
                      <option value="17:30" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "05:30 PM">Selected</cfif>>05:30 PM</option>
                      <option value="17:45" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "05:45 PM">Selected</cfif>>05:45 PM</option>
                      <option value="18:00" <cfif #timeformat('#userCalStarttime#','hh:mm TT')# is "06:00 PM">Selected</cfif>>06:00 PM</option>
                    </cfoutput>
                  </select>
                </div>
              </div>
            </fieldset>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
