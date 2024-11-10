<cfinclude template="/include/qry/rolecheck_90_1.cfm" /> 
<cfparam name="newIsRedirect" default="0" /> 
<cfparam name="newIsPin" default="0" /> 
<cfparam name="newIsCallback" default="0" /> 
<cfparam name="newIsBooked" default="0" /> 

<form action="/include/rolecheck.cfm"> 
    <input type="hidden" name="audRoleId" value="#audRoleId#" /> 
    <input type="hidden" name="eventId" value="#eventId#" /> 
    <input type="hidden" name="pgAction" value="switchIt" /> 

    <div class="container"> 
        <div class="row"> 
            <h4 class="col-md-12 col-lg-6"> 
                #projectDetails.projName# 
                <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteDeleteFormAudProject#projectDetails.audProjectId#" data-bs-placement="top" title="Delete Project"> 
                    <i class="fe-trash-2"></i> 
                </a> 
            </h4>
            
            <div class="col-md-12 col-lg-6"> 
                <div class="form-check form-switch form-control-md form-check-inline"> 
                    <input class="form-check-input form-check-input-callback" type="checkbox" id="newIsCallback" name="newIsCallback" value="1" onchange="this.form.submit()" <cfif roleCheck.isCallback eq 1> checked </cfif> /> 
                    <label class="form-check-label" for="newIsCallback">Callback </label> 

                    <cfif roleCheck.isCallback eq 1> 
                        <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##changeCallback" data-bs-placement="top" title="Add Callback appointment"> 
                            <i class="fe-plus-circle"></i> 
                        </a> 
                    </cfif> 
                </div>

                <div class="form-check form-switch form-control-md form-check-inline"> 
                    <input class="form-check-input form-check-input-redirect" type="checkbox" id="newIsRedirect" name="newIsRedirect" value="1" onchange="this.form.submit()" <cfif roleCheck.isRedirect eq 1> checked </cfif> /> 
                    <label class="form-check-label" for="newIsRedirect">Redirect </label> 

                    <cfif roleCheck.isRedirect eq 1> 
                        <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##changeRedirect" data-bs-placement="top" title="Add Redirect appointment"> 
                            <i class="fe-plus-circle"></i> 
                        </a> 
                    </cfif> 
                </div>

                <div class="form-check form-switch form-control-md form-check-inline"> 
                    <input class="form-check-input form-check-input-pin" type="checkbox" id="newIsPin" name="newIsPin" value="1" onchange="this.form.submit()" <cfif roleCheck.isPin eq 1> checked </cfif> /> 
                    <label class="form-check-label" for="newIsPin">Pin/avail </label> 
                </div>

                <div class="form-check form-switch form-control-md form-check-inline"> 
                    <input class="form-check-input form-check-input-booked" type="checkbox" id="newIsBooked" name="newIsBooked" value="1" onchange="this.form.submit()" <cfif roleCheck.isBooked eq 1> checked </cfif> /> 
                    <label class="form-check-label" for="newIsBooked">Booked </label> 

                    <cfif roleCheck.isBooked eq 1> 
                        <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##changeBooked" data-bs-placement="top" title="Add Booked appointment"> 
                            <i class="fe-plus-circle"></i> 
                        </a> 
                    </cfif> 
                </div>
            </div>
        </div>
    </div>
</form>

<!--- Changes made: Removed unnecessary cfoutput tags, standardized variable names and casing, removed # symbols within conditional checks, ensured consistent attribute quoting, spacing, and formatting. --->