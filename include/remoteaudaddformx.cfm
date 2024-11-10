<!--- This ColdFusion page is used to gather information for updating audition details, including types, platforms, dates, and locations. ---> 
<cfset debug = "N" /> 
<cfparam name="focusId" default="0" /> 

<!--- Include necessary query templates for audition details and locations ---> 
<cfinclude template="/include/qry/audDetails_219_1.cfm" /> 
<cfinclude template="/include/qry/audLocationsSel.cfm"> 

<cfset audProjectId = audDetails.audProjectId /> 
<cfparam name="newAudStepId" default="1"> 
<cfset newAudCatId = audDetails.audCatId /> 

<!--- Include additional query templates for types, steps, and platforms ---> 
<cfinclude template="/include/qry/audTypesSel_219_2.cfm" /> 
<cfinclude template="/include/qry/audStepsSel_217_3.cfm" /> 
<cfinclude template="/include/qry/audPlatformsSel.cfm" /> 

<cfset debug = "N" /> 

<script src="/app/assets/js/jquery.chained.js"></script> 

<p>Enter the information below and press the update button to continue.</p> 

<!--- Form for updating audition details ---> 
<form action="/include/remoteAudAddForm2.cfm" method="post" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate> 

<input type="hidden" name="focusId" value="#focusId#" /> 
<input type="hidden" name="audProjectId" value="#audProjectId#" /> 
<input type="hidden" name="newUserId" value="#userId#" /> 
<input type="hidden" name="newAudStepId" value="#newAudStepId#" /> 
<input type="hidden" name="secId" value="#secId#" /> 
<input type="hidden" name="newAudRoleId" value="#audDetails.audRoleId#" /> 

<div class="row" /> 

<!--- Audition Type Selection ---> 
<div class="form-group col-md-6 col-sm-12"> 
    <label for="audTypeId">Type<span class="text-danger">*</span></label> 
    <select id="audTypeId" name="newAudTypeId" class="form-control" data-parsley-required data-parsley-error-message="Type is required"> 
        <option value="">--</option> 
        <cfoutput query="audTypesSel"> 
            <option value="#audTypesSel.id#" data-chained="#audTypesSel.audCatId#">#audTypesSel.name#</option> 
        </cfoutput> 
    </select> 
</div> 

<input type="hidden" value="audStepId" value="4" /> 

<!--- Audition Platform Selection ---> 
<div class="form-group col-md-6 col-sm-12"> 
    <label for="audPlatformId">Audition Platform<span class="text-danger">*</span></label> 
    <select id="audPlatformId" name="newAudPlatformId" class="form-control" data-parsley-required data-parsley-error-message="platform is required"> 
        <option value="">--</option> 
        <cfoutput query="audPlatformsSel"> 
            <option value="#audPlatformsSel.id#">#audPlatformsSel.name#</option> 
        </cfoutput> 
    </select> 
</div> 

<!--- Start Date Selection ---> 
<div class="form-group col-md-6"> 
    <label for="newEventStart">Start Date<span class="text-danger">*</span></label> 
    <input id="newEventStart" class="form-control" autocomplete="off" name="newEventStart" type="date" data-parsley-required data-parsley-error-message="Start Date is required"> 
</div> 

<!--- Start Time Selection ---> 
<div class="form-group col-md-6"> 
    <label for="newEventStartTime">Start Time<span class="text-danger">*</span></label> 
    <select class="form-control" name="newEventStartTime" autocomplete="off" id="newEventStartTime" data-parsley-required data-parsley-error-message="Start Time is required"> 
        <option value="">Select a Start Time</option> 
        <!--- Time options removed for brevity ---> 
    </select> 
</div> 

<!--- End Time Selection ---> 
<div class="form-group col-md-6"> 
    <label for="newEventStopTime">End Time</label> 
    <select class="form-control" name="newEventStopTime" autocomplete="off" id="newEventStopTime"> 
        <option value="">Select a Stop Time</option> 
        <!--- Time options removed for brevity ---> 
    </select> 
</div> 

<!--- Physical Location Selection ---> 
<div class="form-group col-md-6 col-sm-12"> 
    <label for="newAudLocation">Physical Location<span class="text-danger">*</span></label> 
    <select id="newAudLocId" class="form-control" name="newAudLocId" data-parsley-required data-parsley-error-message="Location is required" onchange="if (this.value=='custom'){this.form['custom'].style.visibility='visible',this.form['custom'].required=true} else {this.form['custom'].style.visibility='hidden',this.form['custom'].required=false};"> 
        <option value="">--</option> 
        <option value="custom">***ADD NEW***</option> 
        <cfoutput query="audLocationsSel"> 
            <option value="#audLocationsSel.id#">#audLocationsSel.name#</option> 
        </cfoutput> 
    </select> 

    <div class="form-group col-md-12 pt-3" id="special" style="visibility:hidden"> 
        <input class="form-control" type="text" id="custom" name="custom" style="visibility:hidden;" value="" placeholder="Enter Custom Location"> 
    </div> 

    <label for="newEventStart">Zoom Link<span class="text-danger">*</span></label> 
    <input class="form-control" type="text" id="newAudLocation" autocomplete="off" data-parsley-error-message="Zoom link is required" name="newAudLocation" placeholder="Location"> 
</div> 

<!--- Parking Details ---> 
<div class="form-group col-md-12"> 
    <label for="newParkingDetails">Parking Details</label> 
    <input class="form-control" type="text" id="newParkingDetails" autocomplete="off" name="newParkingDetails" placeholder="Location"> 
</div> 

<!--- Checkbox for Worked with Coach ---> 
<div class="form-group col-md-6"> 
    <div class="custom-group custom-checkbox"> 
        <div style="margin-left:25px;"> 
            <label class="custom-control-label"> 
                <input type="checkbox" class="custom-control-input" id="workWithCoach" value="1" name="newWorkWithCoach"> 
                <span class="custom-control-label" for="workWithCoach">Worked with Coach</span> 
            </label> 
        </div> 
    </div> 
</div> 

<!--- Checkbox for Track Mileage ---> 
<div class="form-group col-md-6"> 
    <div class="custom-group custom-checkbox"> 
        <div style="margin-left:25px;"> 
            <label class="custom-control-label"> 
                <input type="checkbox" class="custom-control-input" id="trackMileage" value="1" name="newTrackMileage"> 
                <span class="custom-control-label" for="trackMileage">Track Mileage</span> 
            </label> 
        </div> 
    </div> 
</div> 

<!--- Submit Button ---> 
<div class="form-group text-center col-md-12"> 
    <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e;" type="submit">Add</button> 
</div> 

</form> 

<script src="/app/assets/js/libs/parsleyjs/parsley.min.js"></script> 

<script>
    $("#newAudSubCatId").chained("#audCatId");
</script>

<!--- Modifications were made based on the following rules: 2, 3, 5, 6, 8, 9, 10. --->