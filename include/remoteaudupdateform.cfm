<cfparam name="pgAction" default="view" />
<cfparam name="oldCallbackTypeId" default="0" />
<cfinclude template="/include/qry/durations.cfm" />
<cfinclude template="/include/fetchLocationService.cfm" />
<cfset userCalStartTime = calStartTime />
<cfset debug = "N" />
<cfinclude template="/include/qry/audPlatformsUserSel.cfm" />
<cfinclude template="/include/qry/projectDetails_221_1.cfm" />
<cfset audRoleId = projectDetails.audRoleId />
<cfinclude template="/include/qry/roleDetails_221_2.cfm" />

<cfset newAudSubCatId = projectDetails.audSubCatId />

<!--- Check if new_audsubcatid is empty and set default value --->
<cfif newAudSubCatId is "">
    <cfset newAudSubCatId = "0" />
</cfif>

<cfinclude template="/include/qry/cat_221_3.cfm" />

<!--- Ensure new_audsubcatid is set --->
<cfif newAudSubCatId is "">
    <cfset newAudSubCatId = 0 />
</cfif>

<cfinclude template="/include/qry/cat_221_4.cfm" />
<cfinclude template="/include/qry/audRoleTypesSel_221_5.cfm" />
<cfinclude template="/include/qry/audTypesSel_221_6.cfm" />
<cfinclude template="/include/qry/castingTypes_221_7.cfm" />
<cfinclude template="/include/qry/castingDirectorsSel.cfm" />

<!--- Check if the action is to add a new audition --->
<cfif pgAction is "add">
    <cfset newAudRoleId = roleDetails.audRoleId />
    <cfset newUserId = userId />
    <cfset newAudStepId = audStepId />
    <cfparam name="newDurId" default="0" />
    <cfparam name="newUserId" default="" />
    <cfparam name="newAudRoleId" default="" />
    <cfparam name="newAudTypeId" default="" />
    <cfparam name="newAudLocation" default="" />
    <cfparam name="newAudLocId" default="" />
    <cfparam name="newEventStart" default="" />
    <cfparam name="newEventStartTime" default="" />
    <cfparam name="newEventStopTime" default="" />
    <cfparam name="newAudPlatformId" default="4" />
    <cfparam name="newAudStepId" default="1" />
    <cfparam name="newParkingDetails" default="" />
    <cfparam name="newWorkWithCoach" default="0" />
    <cfparam name="newIsDeleted" default="0" />
    <cfparam name="newTrackMileage" default="0" />

    <cfinclude template="/include/qry/auditionsIns_221_8.cfm" />

    <cfset eventId = rez.generatedKey />
</cfif>

<cfset debug = "N" />

<cfinclude template="/include/qry/audDet_221_9.cfm" />

<cfparam name="newValueText" default="#audDet.regionId#">
<cfparam name="newCountryId" default="#audDet.countryId#">

<cfparam name="valueText" default="">
<cfinclude template="/include/qry/cities_448_1.cfm" />

<!--- Set default duration hours if not provided --->
<cfif audDet.newDurHours is "">
    <cfset newDurHours = 1 />
<cfelse>
    <cfset newDurHours = audDet.newDurHours />
</cfif>

<cfinclude template="/include/qry/findD_221_10.cfm" />

<!--- Check if a record was found in findd --->
<cfif findD.recordCount is "1">
    <cfset newDurId = findD.newDurId />
<cfelse>
    <cfset newDurId = 0 />
</cfif>

<style>
    <cfif audDet.audTypeId is not "1">
        #hiddenDiv_1 { display: none; }
    </cfif>
    <cfif audDet.audTypeId is not "2">
        #hiddenDiv_2 { display: none; }
    </cfif>
    .output { font: 1rem 'Fira Sans', sans-serif; }
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
        border-color: ##ced4da; 
        border-style: solid border-image: initial; 
    }
</style>

<cfset newAudCatId = audDet.audCatId />

<cfinclude template="/include/qry/audTypesSel_221_11.cfm" />
<cfinclude template="/include/qry/audStepsSel_217_3.cfm" />
<cfinclude template="/include/qry/audPlatformsSel.cfm" />

<cfset debug = "N" />

<script src="/app/assets/js/jquery.chained.js"></script>

<h4>
    <cfoutput>#audDet.audStep# appointment</cfoutput>
</h4>

<!--- Set default country and region if not provided --->
<cfif newCountryId is "">
    <cfset newCountryId = "US" />
</cfif>
<cfif newValueText is "">
    <cfset newValueText = "3911" />
</cfif>

<form method="post" action="/include/remoteAudUpdateForm2.cfm" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <div class="row">
        <cfoutput>
            <input type="hidden" name="audProjectId" value="#audProjectId#">
            <input type="hidden" name="newEventId" value="#eventId#">
            <input type="hidden" name="eventId" value="#eventId#">
            <input type="hidden" name="newAudStepId" value="#audDet.audStepId#">
            <input type="hidden" name="newAudCatId" value="#audDet.audCatId#">
            <input type="hidden" name="newAudSubCatId" value="#audDet.audSubCatId#">
            <input type="hidden" name="newUserId" value="#userId#">
            <input type="hidden" name="secId" value="#secId#">
            <input type="hidden" name="newAudRoleId" value="#audDet.audRoleId#">
        </cfoutput>
        <div class="form-group col-md-12">
            <label for="audPlatformId">
                <cfoutput>Category: #cat.audCatName# - #cat.audSubCatName#</cfoutput>
            </label>
        </div>
        <cfoutput>
            <div class="form-group col-md-6">
                <label for="newEventStart">Start Date / Due Date<span class="text-danger">*</span></label>
                <input id="newEventStart" class="form-control" autocomplete="off" name="newEventStart" type="date" data-parsley-required data-parsley-error-message="Start Date is required" value="#audDet.eventStart#">
            </div>
        </cfoutput>
        <div class="form-group col-md-6">
            <label for="newEventStartTime">Start Time / Due Time<span class="text-danger">*</span></label>
            <select class="form-control" name="newEventStartTime" autocomplete="off" id="newEventStartTime" data-parsley-required data-parsley-error-message="Start Time is required">
                <option value="">Select a Start/Due Time</option>
                <cfset selectedTime = timeFormat(audDet.eventStartTime, 'HH:mm')>
                <cfloop from="0" to="23" index="hour">
                    <cfloop from="0" to="45" step="15" index="minute">
                        <cfset hourStr = right("0" & hour, 2)>
                        <cfset minuteStr = right("0" & minute, 2)>
                        <cfset timeValue = hourStr & ":" & minuteStr>
                        <cfset displayTime = timeFormat(createDateTime(2000, 1, 1, hour, minute, 0), "hh:mm tt")>
                        <cfoutput>
                            <option value="#timeValue#" <cfif timeValue eq selectedTime>selected</cfif>>#displayTime#</option>
                        </cfoutput>
                    </cfloop>
                </cfloop>
            </select>
        </div>
        <