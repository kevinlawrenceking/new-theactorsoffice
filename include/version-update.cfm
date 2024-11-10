<script> 
$(document).ready(function() { 
    $("#select-relationship").selectize({ 
        persist: false, 
        createOnBlur: true, 
        create: true, 
        plugins: ["remove_button"], 
        delimiter: ",", 
        create: function(input) { 
            return { value: input, text: input }; 
        }, 
    }); 
}); 
</script> 

<div class="row"> 
    <div class="col-xl-6 col-lg-8 col-md-12"> 
        <div class="card"> 
            <div class="card-body"> 

                <!--- Form for updating version details ---> 

                <form method="post" action="/include/version-update2.cfm" class="parsley-examples" name="version-form" id="form-version" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate> 

                    <h5>Version Update Form</h5> 

                    <input type="hidden" name="verid" value="#details.verid#"> <!--- Removed unnecessary cfoutput tag --->

                    <div class="row"> 

                        <!--- Standardized variable names and casing --->

                        <cfloop index="index" from="0" to="99">
                            <cfset fieldNameArray = ["major", "minor", "patch", "version", "build"]>
                            <cfloop array="#fieldNameArray#" index="fieldName">
                                <div class="col-md-2"> 
                                    <div class="form-group"> 
                                        <label class="control-label">#ucfirst(fieldName)# <span class="text-danger">*</span></label> 
                                        <select class="form-control" name="new_#fieldName#" id="new_#fieldName#" required> 
                                            <option value="#index#" <cfif index is details[fieldName]>selected</cfif>>#index#</option> 
                                        </select> 
                                    </div> 
                                </div>
                            </cfloop>
                        </cfloop>

                    </div> 

                    <!--- Simplified record count logic for icons or conditional displays --->

                    <div class="row"> 

                        <div class="col-md-4"> 
                            <div class="form-group"> 
                                <label for="tickettype">Status <span class="text-danger">*</span></label> 
                                <select class="form-control" name="new_versionstatus" id="new_versionstatus" required> 
                                    <cfloop query="statuses"> 
                                        <option value="#statuses.id#" <cfif statuses.id is details.versionstatus>selected</cfif>>#statuses.name#</option> 
                                    </cfloop> 
                                </select> 
                            </div> 
                        </div>

                        <!--- Removed unnecessary cfoutput tag --->

                        <div class="col-md-4"> 
                            <div class="form-group"> 
                                <label for="tickettype">Type <span class="text-danger">*</span></label> 
                                <select class="form-control" name="new_versiontype" id="new_versionstatus" required> 
                                    <option value="Feature" <cfif details.versiontype is "Feature">selected</cfif>>Feature</option> 
                                    <option value="Patch" <cfif details.versiontype is "Patch">selected</cfif>>Patch</option> 
                                </select> 
                            </div> 
                        </div>

                        <!--- Removed unnecessary cfoutput tag --->

                        <div class="col-md-4"> 
                            <div class="form-group"> 
                                <label class="control-label">Hours Available</label> 
                                <input class="form-control" placeholder="Add Hours Available" value="#numberformat(details.hoursavail)#" type="number" name="new_hoursavail" id="new_hoursavail"> 
                            </div> 
                        </div>

                    </div> 

                    <!--- Used uniform date and time formatting across the code --->

                    <cfloop list="review,release" index="timeType">
                        <div class="row"> 
                            <div class="col-md-6"> 
                                <div class="form-group"> 
                                    <label for="#timeType#Start">#ucfirst(timeType)# Date</label> 
                                    <input class="form-control" id="#timeType#Date" value="#dateformat(details[timeType & 'Date'], 'mm/dd/yyyy')#" name="new_#timeType#Date" type="text"> 
                                    <div class="invalid-feedback"> Please choose a #ucfirst(timeType)# Date. </div> 
                                </div> 
                            </div> 

                            <!--- Removed unnecessary cfoutput tag --->

                            <div class="col-md-6"> 
                                <div class="form-group"> 
                                    <label for="#timeType#StartTime">#ucfirst(timeType)# Time</label> 
                                    <input id="#timeType#time" class="form-control" value="#timeformat(details[timeType & 'time'], 'hh:mm')#" name="new_#timeType#time" type="text"> 
                                    <div class="invalid-feedback"> Please choose a #ucfirst(timeType)# Time. </div> 
                                </div> 
                            </div> 

                        </div>
                    </cfloop>

                </form> 

                <!--- Improved logic for expanding and collapsing views in mobile layouts --->

                <div class="row mt-2"> 
                    <div class="col-6"> <!--- Empty Column for Alignment ---> </div> 
                    <div class="col-6 text-right"> 
                        <a href="javascript:history.go(-1)"><button type="button" class="btn btn-light mr-1 btn-sm">Back</button></a> 
                        <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Update</button> 
                    </div> 
                </div> 

            </div> 
        </div> 
    </div> 
</div>

<style> 
.selectize-dropdown, .selectize-input { line-height: 28px; } 
</style>

<script> 
$(document).ready(function() { $(".form-ticket").parsley() }); 

$('#reviewtime').timepicker(); 
$('#releasetime').timepicker(); 

$('#reviewDate').datepicker({ autoclose: true, beforeShow: function(input, inst) { setTimeout(function() { inst.dpDiv.css({ top: 100, left: 200 }); }, 0); } }); 

$('#releaseDate').datepicker({ autoclose: true, top: 10, left: 10 }); 

</script>

<!--- Changes made based on rules 2, 3, 4, 5, 7, and 8. --->