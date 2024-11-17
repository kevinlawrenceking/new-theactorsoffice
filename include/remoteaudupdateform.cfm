<!--- This ColdFusion page handles the audition event form, including fetching data, processing inputs, and rendering the form for user interaction. --->

<cfparam name="pgaction" default="view" />
<cfparam name="old_callbacktypeid" default="0" />

<cfinclude template="/include/qry/durations.cfm" />
<cfinclude template="/include/fetchLocationService.cfm" />
<cfinclude template="/include/fetchUsers.cfm" />
<cfset usercalstarttime = calstarttime />
<cfset dbug = "N" />

<cfinclude template="/include/qry/audplatforms_user_sel.cfm" />
<cfinclude template="/include/qry/projectDetails_221_1.cfm" />
<cfset audroleid = projectDetails.audroleid />
<cfinclude template="/include/qry/roleDetails_221_2.cfm" />
<cfinclude template="/include/qry/locationDetails_492_1.cfm" />
<Cfoutput>
    <cfset NEW_AUDSUBCATID = "#projectDetails.audsubcatid#" />
</Cfoutput>

<!--- Check if new_audsubcatid is empty and set default value --->
<cfif #new_audsubcatid# is "">
    <cfset new_audsubcatid = "0" />
</cfif>

<cfinclude template="/include/qry/cat_221_3.cfm" />

<!--- Ensure new_audsubcatid is set --->
<cfif #new_audsubcatid# is "">
    <cfset new_audsubcatid = 0 />
</cfif>

<cfinclude template="/include/qry/cat_221_4.cfm" />
<cfinclude template="/include/qry/audroletypes_sel_221_5.cfm" />
<cfinclude template="/include/qry/audtypes_sel_221_6.cfm" />
<cfinclude template="/include/qry/casting_types_221_7.cfm" />
<cfinclude template="/include/qry/castingdirectors_sel.cfm" />

<!--- Check if the action is to add a new audition --->
<cfif #pgaction# is "add">
    <cfset new_audroleid = roleDetails.audroleid />
    <cfset new_userid = userid />
    <cfset new_audstepid = audstepid />

    <cfparam name="new_durid" default="0" />
    <cfparam name="new_userid" default="" />
    <cfparam name="new_audRoleID" default="" />
    <cfparam name="new_audTypeID" default="" />
    <cfparam name="new_audLocation" default="" />
    <cfparam name="new_audlocid" default="" />
    <cfparam name="new_eventStart" default="" />
    <cfparam name="new_eventStartTime" default="" />
    <cfparam name="new_eventStopTime" default="" />
    <cfparam name="new_audplatformid" default="4" />
    <cfparam name="new_audStepID" default="1" />
    <cfparam name="new_parkingDetails" default="" />
    <cfparam name="new_workwithcoach" default="0" />
    <cfparam name="new_isDeleted" default="0" />
    <cfparam name="new_trackmileage" default="0" />

    <cfinclude template="/include/qry/auditions_ins_221_8.cfm" />
    <cfset eventid = rez.GENERATEDKEY />
</cfif>

<cfset dbug = "N" />
<cfinclude template="/include/qry/aud_det_221_9.cfm" />

<Cfoutput>
    <cfparam name="new_region_id" default="#aud_det.region_id#">
    <cfparam name="new_countryid" default="#aud_det.countryid#">
</Cfoutput>

<cfparam name="valuetext" default="">
<cfinclude template="/include/qry/cities_448_1.cfm" />

<!--- Set default duration hours if not provided --->
<cfif #aud_det.new_durhours# is "">
    <cfset new_durhours = 1 />
<cfelse>
    <cfset new_durhours = aud_det.new_durhours />
</cfif>

<cfinclude template="/include/qry/findd_221_10.cfm" />

<!--- Check if a record was found in findd --->
<cfif #findd.recordcount# is "1">
    <cfset new_durid = findd.new_durid />
<cfelse>
    <cfset new_durid = 0 />
</cfif>

<style>
    <Cfif #aud_det.audtypeid# is not "1">#hiddenDiv_1 {
        display: none;
    }
    </cfif>

    <Cfif #aud_det.audtypeid# is not "2">#hiddenDiv_2 {
        display: none;
    }
    </cfif>

    .output {
        font: 1rem 'Fira Sans', sans-serif;
    }

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
        border-style: solid border-image: initial;
    }
</style>

<cfset new_audcatid = aud_det.audcatid />
<cfinclude template="/include/qry/audtypes_sel_221_11.cfm" />
<cfinclude template="/include/qry/audsteps_sel_217_3.cfm" />
<cfinclude template="/include/qry/audplatforms_sel.cfm" />
<cfset dbug = "N" />

<script src="/app/assets/js/jquery.chained.js"></script>

<h4>
    <cfoutput>#aud_det.audstep# appointment</cfoutput>
</h4>

<!--- Set default country and region if not provided --->
<cfif #new_countryid# is "">
    <cfset new_countryid = "US" />
</cfif>

<cfif #new_region_id# is "">
    <cfset new_region_id = "3911" />
</cfif>

<form method="post" 
      action="/include/remoteaudupdateform2.cfm" 
      class="parsley-examples" 
      name="event-form" 
      id="form-event" 
      data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" 
      data-parsley-trigger="keyup" 
      data-parsley-validate>
    <div class="row">
        <cfoutput>
            <input type="hidden" name="audprojectid" value="#audprojectid#">
            <input type="hidden" name="new_eventid" value="#eventid#">
            <input type="hidden" name="eventid" value="#eventid#">
            <input type="hidden" name="new_audStepID" value="#aud_det.audstepid#">
            <input type="hidden" name="new_audcatid" value="#aud_det.audcatid#">
            <input type="hidden" name="new_audsubcatid" value="#aud_det.audsubcatid#">
            <input type="hidden" name="new_userid" value="#userid#">
            <input type="hidden" name="secid" value="#secid#">
            <input type="hidden" name="new_audRoleID" value="#aud_det.audroleid#">
        </cfoutput>

        <div class="form-group col-md-12">
            <label for="audplatformid">
                <cfoutput>Category: #cat.audcatname# - #cat.audsubcatname#</cfoutput>
            </label>
        </div>

        <cfoutput>
            <div class="form-group col-md-6">
                <label for="new_eventStart">Start Date / Due Date<span class="text-danger">*</span></label>
                <input id="new_eventStart" class="form-control" autocomplete="off" name="new_eventStart" type="date" data-parsley-required data-parsley-error-message="Start Date is required" value="#aud_det.eventStart#">
            </div>
        </cfoutput>

        <div class="form-group col-md-6">
            <label for="new_eventStartTime">Start Time / Due Time<span class="text-danger">*</span></label>
            <select class="form-control" name="new_eventStartTime" autocomplete="off" id="new_eventStartTime" data-parsley-required data-parsley-error-message="Start Time is required">
                <option value="">Select a Start/Due Time</option>
                <cfset selectedTime = timeformat(aud_det.eventStartTime, 'HH:mm')>
                <cfloop from="0" to="23" index="hour">
                    <cfloop from="0" to="45" step="15" index="minute">
                        <cfset hourStr = right("0" & hour, 2)>
                        <cfset minuteStr = right("0" & minute, 2)>
                        <cfset timeValue = hourStr & ":" & minuteStr>
                        <cfset displayTime = timeformat(createDateTime(2000, 1, 1, hour, minute, 0), "hh:mm tt")>
                        <cfoutput>
                            <option value="#timeValue#" <cfif timeValue eq selectedTime>selected</cfif>>#displayTime#</option>
                        </cfoutput>
                    </cfloop>
                </cfloop>
            </select>
        </div>

        <div class="form-group col-md-6">
            <label for="new_eventStopTime">Duration</label>
            <select class="form-control" name="new_durid" autocomplete="off" id="new_durid">
                <cfoutput query="durations">
                    <option value="#durations.durid#" <cfif #durations.durid# is "#new_durid#"> selected </cfif>>#durations.durname#</option>
                </cfoutput>
            </select>
        </div>

        <!--- Check if the audition step ID is 2 to include callback types --->
        <cfif #aud_det.audstepid# is "2">
            <cfinclude template="/include/qry/audcallbacktypes_sel.cfm" />
            <div class="form-group col-md-6">
                <label for="audtypeid">Callback Type<span class="text-danger">*</span>.</label>
                <select id="NEW_CALLBACKTYPEID" name="NEW_CALLBACKTYPEID" class="form-control" data-parsley-required data-parsley-error-message="Callback Type is required">
                    <cfoutput query="audcallbacktypes_sel_def">
                        <option value="#audcallbacktypes_sel_def.id#">#audcallbacktypes_sel_def.name#</option>
                    </cfoutput>
                    <cfoutput query="audcallbacktypes_sel">
                        <cfif #audcallbacktypes_sel.id# is "#old_callbacktypeid#">
                            <option value="#audcallbacktypes_sel.id#" Selected>#audcallbacktypes_sel.name#</option>
                        </cfif>
                        <cfif #audcallbacktypes_sel.id# is not "#old_callbacktypeid#">
                            <option value="#audcallbacktypes_sel.id#">#audcallbacktypes_sel.name#</option>
                        </cfif>
                    </cfoutput>
                </select>
            </div>
        <cfelse>
            <cfoutput>
                <input type="hidden" name="new_callbacktypeid" value="#old_callbacktypeid#" />
            </cfoutput>
        </cfif>

        <div class="form-group col-md-6">
            <label for="audtypeid">Type<span class="text-danger">*</span></label>
            <select id="audtypeid" name="new_audtypeid" class="form-control" data-parsley-required data-parsley-error-message="Type is required">
                <option value="">--</option>
                <cfoutput query="audtypes_sel">
                    <option value="#audtypes_sel.id#" <cfif #audtypes_sel.id# is "#aud_det.audtypeid#"> selected </cfif>>#audtypes_sel.name#</option>
                </cfoutput>
            </select>
        </div>

        <!--- Check if the audition step ID is 5 to include booking types --->
        <cfif #aud_det.audstepid# is "5">
            <cfinclude template="/include/qry/audbooktypes_sel_221_13.cfm" />
            <div class="form-group col-md-6 col-sm-12">
                <label for="audtypeid">Booking Type<span class="text-danger">*</span></label>
                <select id="audbooktypeid" name="new_audbooktypeid" class="form-control" data-parsley-required data-parsley-error-message="Booking Type is required">
                    <option value="0">--</option>
                    <cfoutput query="audbooktypes_sel">
                        <option value="#audbooktypes_sel.id#" <cfif #audbooktypes_sel.id# is "#aud_det.audbooktypeid#"> selected </cfif>>#audbooktypes_sel.name#</option>
                    </cfoutput>
                </select>
            </div>
        </cfif>

        <div id="hiddenDiv_1">
            <cfoutput>
                <div class="form-group col-md-12">
                    <label for="new_parkingDetails">Parking Details</label>
                    <input class="form-control" type="text" id="new_parkingDetails" autocomplete="off" value="#aud_det.parkingDetails#" name="new_parkingDetails" placeholder="Parking details">
                </div>

                <div class="form-group col-md-12">
                    <div class="custom-group custom-checkbox">
                        <div style="margin-left:25px;">
                            <label class="custom-control-label">
                                <input type="checkbox" name="new_trackmileage" class="custom-control-input" id="trackmileage" value="1" <cfif #aud_det.trackmileage# is "1"> checked </cfif>>
                                <span class="custom-control-label" for="trackmileage">Track Mileage</span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group col-md-12 d-flex align-items-center">
                    <label for="projName" class="flex-grow-1">Location Name<span class="text-danger">*</span></label>
                    <cfif locationDetails.recordcount NEQ 0>
                        <button type="button" class="btn btn-primary btn-xs ml-auto" id="populateFieldsButton">Same</button>
                    </cfif>
                </div>

                <div class="form-group col-md-12">
                    <input class="form-control" type="text" id="eventLocation" name="new_eventLocation" value="#aud_det.eventLocation#" placeholder="Location Name" required data-parsley-required data-parsley-error-message="Location Name is required">
                    <div class="invalid-feedback">Please enter a Location Name.</div>
                </div>

                <div class="form-group col-md-12">
                    <label for="projName">Address</label>
                    <input class="form-control" type="text" id="audlocadd1" name="new_audlocadd1" value="#aud_det.audlocadd1#" placeholder="Address">
                    <div class="invalid-feedback">Please enter an address.</div>
                </div>

                <div class="form-group col-md-12">
                    <label for="projName">Extended Address</label>
                    <input class="form-control" type="text" id="audlocadd2" name="new_audlocadd2" value="#aud_det.audlocadd2#" placeholder="APT 101">
                    <div class="invalid-feedback">Please enter an extended address.</div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="valuetext">Town/City</label>
                        <input class="form-control" type="text" id="audcity" name="new_audcity" value="#aud_det.audcity#" placeholder="Enter City">
                    </div>

                    <div class="form-group col-md-6">
                        <label for="valuetext">Postal Code</label>
                        <input class="form-control" type="text" id="audzip" name="new_audzip" value="#aud_det.audzip#" placeholder="Enter Postal Code">
                    </div>
                </div>
            </cfoutput>
        </div>

        <div class="row">
            <div class="form-group col-md-6">
                <label for="region_id">State/Region<span class="text-danger">*</span></label>
                <select id="region_id" name="new_region_id" class="form-control">
                    <option value="">--</option>
                    <cfoutput query="regions">
                        <option value="#regions.region_id#" data-chained="#regions.countryid#" <cfif #regions.region_id# is "#new_region_id#">selected </cfif>>#regions.regionname#</option>
                    </cfoutput>
                </select>
            </div>

            <div class="form-group col-md-6">
                <label for="countryid">Country<span class="text-danger">*</span></label>
                <select id="countryid" class="form-control" name="countryid" data-parsley-required data-parsley-error-message="Country is required">
                    <option value="">--</option>
                    <cfoutput query="countries">
                        <option value="#countries.countryid#" <cfif #countries.countryid# is "#new_countryid#">selected </cfif>>#countries.countryname#</option>
                    </cfoutput>
                </select>
            </div>
        </div>

        <script>
            document.getElementById('populateFieldsButton').addEventListener('click', function() {
                // Sample data fetched from the query (This will be dynamic)
                var locationDetails = {
                    same_eventLocation: "<cfoutput>#locationDetails.same_eventLocation#</cfoutput>",
                    same_audlocadd1: "<cfoutput>#locationDetails.same_audlocadd1#</cfoutput>",
                    same_audlocadd2: "<cfoutput>#locationDetails.same_audlocadd2#</cfoutput>",
                    same_audcity: "<cfoutput>#locationDetails.same_audcity#</cfoutput>",
                    same_region_id: "<cfoutput>#locationDetails.same_region_id#</cfoutput>",
                    same_countryid: "<cfoutput>#locationDetails.same_countryid#</cfoutput>",
                    same_audzip: "<cfoutput>#locationDetails.same_audzip#</cfoutput>"
                };

                // Populate the form fields
                document.getElementById('eventLocation').value = locationDetails.same_eventLocation;
                document.getElementById('audlocadd1').value = locationDetails.same_audlocadd1;
                document.getElementById('audlocadd2').value = locationDetails.same_audlocadd2;
                document.getElementById('audcity').value = locationDetails.same_audcity;
                document.getElementById('region_id').value = locationDetails.same_region_id;
                document.getElementById('countryid').value = locationDetails.same_countryid;
                document.getElementById('audzip').value = locationDetails.same_audzip;
            });
        </script>

        <div id="hiddenDiv_2">
            <cfoutput>
                <div class="form-group col-md-12">
                    <label for="new_eventStart">Platform URL (optional)</label>
                    <input class="form-control" type="text" id="new_audLocation" autocomplete="off" name="new_audLocation" placeholder="Zoom link">
                </div>
                <input type="hidden" name="old_audPlatformid" value="#aud_det.audplatformid#" />
            </cfoutput>

            <div class="form-group col-md-12">
                <label for="audplatformid">Audition Platform</label>
                <select id="audplatformid" name="new_audplatformid" class="form-control" onchange="if (this.value=='CustomPlatform'){this.form['CustomPlatform'].style.visibility='visible',this.form['CustomPlatform'].required=true} else {this.form['CustomPlatform'].style.visibility='hidden',this.form['CustomPlatform'].required=false};">
                    <option value="">--</option>
                    <option value="CustomPlatform">***ADD CUSTOM</option>
                    <cfoutput query="audplatforms_user_sel">
                        <option value="#audplatforms_user_sel.id#" <cfif #audplatforms_user_sel.id# is "#aud_det.audplatformid#"> selected </cfif>>#audplatforms_user_sel.name#</option>
                    </cfoutput>
                </select>
            </div>

            <div class="form-group col-md-6" id="CustomPlatforms" style="visibility:hidden;">
                <label for="CustomPlatform">Custom Platform</label>
                <input class="form-control" type="text" id="CustomPlatform" name="CustomPlatform" value="" placeholder="Enter a Custom Platform">
            </div>
        </div>

        <cfoutput>
            <div class="form-group col-md-12">
                <div class="custom-group custom-checkbox">
                    <div style="margin-left:25px;">
                        <label class="custom-control-label">
                            <input type="checkbox" class="custom-control-input" id="workwithcoach" value="1" <cfif #aud_det.workwithcoach# is "1"> checked </cfif> name="new_workwithcoach">
                            <span class="custom-control-label" for="workwithcoach">Worked with Coach</span>
                        </label>
                    </div>
                </div>
            </div>
        </cfoutput>

        <div class="form-group col-md-12">
            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Update</button>
        </div>

        <script>
            $("#region_idx").chained("#countryidx");
        </script>

        <script>
            $(document).ready(function() {
                $(".parsley-examples").parsley()
            });
        </script>

        <script>
            function showDiv(divId, element) {
                var checked = document.querySelectorAll('input:checked');
                if (checked.length === 0) {
                    document.getElementById(divId).style.display = 'none';
                } else {
                    document.getElementById(divId).style.display = 'block';
                    $("#divId").prop('required', true);
                }
            }
        </script>

        <script>
            $('select[name=new_eventStartTime]').on("change", function() {
                var

