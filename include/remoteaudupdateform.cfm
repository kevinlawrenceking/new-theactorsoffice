<!--- This ColdFusion page handles the audition event form, including fetching data, processing inputs, and rendering the form for user interaction. --->

<cfparam name="pgaction" default="view" />
<cfparam name="old_callbacktypeid" default="0" />
<cfparam name="isdirect" default="0" />
<cfinclude template="/include/qry/durations.cfm" />
<cfinclude template="/include/qry/fetchLocationService.cfm" />
<cfinclude template="/include/qry/fetchusers.cfm" />
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
<cfset eventid = result />
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
    <Cfif #aud_det.audtypeid# is not "1">#hiddenLocation {
        display: none;
    }
    </cfif>

    <Cfif #aud_det.audtypeid# is not "2">#hiddenSelfTape {
        display: none;
    }
    </cfif>


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
        </cfoutput>

        <!-- Category -->
        <div class="form-group col-md-12">
            <label for="audplatformid">
                <cfoutput>Category: #cat.audcatname# - #cat.audsubcatname#</cfoutput>
            </label>
        </div>

        <!-- Start Date -->
        <cfoutput>
            <div class="form-group col-md-6">
                <label for="new_eventStart">Start Date / Due Date<span class="text-danger">*</span></label>
                <input id="new_eventStart" class="form-control" autocomplete="off" name="new_eventStart" type="date" data-parsley-required data-parsley-error-message="Start Date is required" value="#aud_det.eventStart#">
            </div>
        </cfoutput>

        <!-- Start Time -->
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

        <!-- Duration -->
        <div class="form-group col-md-6">
            <label for="new_eventStopTime">Duration</label>
            <select class="form-control" name="new_durid" autocomplete="off" id="new_durid">
                <cfoutput query="durations">
                    <option value="#durations.durid#" <cfif #durations.durid# is "#new_durid#"> selected </cfif>>#durations.durname#</option>
                </cfoutput>
            </select>
        </div>

        <!-- Country and Region -->
        <div class="row">
            <div class="form-group col-md-6">
                <label for="region_id">State/Region<span class="text-danger">*</span></label>
                <select id="region_id" name="new_region_id" class="form-control">
                    <option value="">--</option>
                    <cfoutput query="regions">
                        <option value="#regions.region_id#" data-chained="#regions.countryid#" <cfif #regions.region_id# is "#new_region_id#">selected</cfif>>#regions.regionname#</option>
                    </cfoutput>
                </select>
            </div>

            <div class="form-group col-md-6">
                <label for="countryid">Country<span class="text-danger">*</span></label>
                <select id="countryid" class="form-control" name="countryid" data-parsley-required data-parsley-error-message="Country is required">
                    <option value="">--</option>
                    <cfoutput query="countries">
                        <option value="#countries.countryid#" <cfif #countries.countryid# is "#new_countryid#">selected</cfif>>#countries.countryname#</option>
                    </cfoutput>
                </select>
            </div>
        </div>

        <!-- Hidden Self Tape -->
        <div id="hiddenSelfTape" style="display:none;">
            <div class="form-group col-md-12">
                <label for="new_audLocation">Platform URL (optional)</label>
                <input class="form-control" type="text" id="new_audLocation" name="new_audLocation" value="#aud_det.audLocation#" placeholder="Zoom link">
            </div>
        </div>
        
        <!-- Hidden Location -->
        <div id="hiddenLocation" style="display:none;">
            <div class="form-group col-md-12">
                <label for="eventLocation">Location Name<span class="text-danger">*</span></label>
                <input class="form-control" type="text" id="eventLocation" name="new_eventLocation" value="#aud_det.eventLocation#" placeholder="Location Name">
            </div>
        </div>

        <!-- Populate Fields Button -->
        <cfif locationDetails.recordcount NEQ 0>
            <button type="button" class="btn btn-primary btn-xs ml-auto" id="populateFieldsButton">Same</button>
        </cfif>

        <div class="form-group col-md-12">
            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Update</button>
        </div>
    </div>
</form>

<!-- Scripts -->
<script>
    // Chained Dropdown
    $(document).ready(function () {
        $("#region_id").chained("#countryid");
    });

    // Populate Fields Button
    document.getElementById('populateFieldsButton').addEventListener('click', function () {
        var locationDetails = {
            same_eventLocation: "<cfoutput>#locationDetails.same_eventLocation#</cfoutput>",
            same_audlocadd1: "<cfoutput>#locationDetails.same_audlocadd1#</cfoutput>",
            same_audlocadd2: "<cfoutput>#locationDetails.same_audlocadd2#</cfoutput>",
            same_audcity: "<cfoutput>#locationDetails.same_audcity#</cfoutput>",
            same_region_id: "<cfoutput>#locationDetails.same_region_id#</cfoutput>",
            same_countryid: "<cfoutput>#locationDetails.same_countryid#</cfoutput>",
            same_audzip: "<cfoutput>#locationDetails.same_audzip#</cfoutput>"
        };

        document.getElementById('eventLocation').value = locationDetails.same_eventLocation;
        document.getElementById('audlocadd1').value = locationDetails.same_audlocadd1;
        document.getElementById('audlocadd2').value = locationDetails.same_audlocadd2;
        document.getElementById('audcity').value = locationDetails.same_audcity;
        document.getElementById('region_id').value = locationDetails.same_region_id;
        document.getElementById('countryid').value = locationDetails.same_countryid;
        document.getElementById('audzip').value = locationDetails.same_audzip;
    });

    // Handle Select Change
    function handleSelectChange(element) {
        const hiddenSelfTape = document.getElementById('hiddenSelfTape');
        const hiddenLocation = document.getElementById('hiddenLocation');
        const locationInput = document.getElementById('eventLocation');

        if (hiddenSelfTape) {
            hiddenSelfTape.style.display = element.value == "2" ? 'block' : 'none';
        }
        if (hiddenLocation) {
            hiddenLocation.style.display = element.value == "1" ? 'block' : 'none';
        }
        if (locationInput) {
            locationInput.setAttribute('required', element.value == "1" ? 'true' : null);
        }
    }
</script>
