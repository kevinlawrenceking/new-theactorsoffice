<!--- This ColdFusion page handles the form submission for adding new categories and regions, including dynamic fields based on user selection. --->

<cfparam name="placeholder" default="" />
<cfparam name="userid" default="0" type="integer">
<cfparam name="new_catid" default="0" type="integer">
<cfparam name="new_region_id" default="3911" type="integer">
<cfparam name="region_id" default="3911" type="integer" />
<cfparam name="valuetext" default="" >
<cfparam name="def_countryid" default="US" />
<cfparam name="new_countryid" default="US" />

<cfset new_catid = catid />

<!--- Include fetchLocationService.cfm to get the countries and regions --->
<cfinclude template="/include/fetchLocationService.cfm" />

<cfinclude template="/include/qry/details_198_1.cfm" />

<!--- Include types based on new_catid value --->
<cfif new_catid eq "4">
    <cfinclude template="/include/qry/types_198_2.cfm" />
<cfelse>
    <cfinclude template="/include/qry/types_198_3.cfm" />
</cfif>

<cfoutput>
    <cfset formid = "remoteAddC#new_catid#" />
</cfoutput>

<form action="/include/remoteAddCAdd.cfm" method="post" class="parsley-examples" id="#formid#" 
      data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
      data-parsley-trigger="keyup" data-parsley-validate>
    
    <cfoutput>
        <input type="hidden" name="catid" value="#new_catid#">
        <input type="hidden" name="valueCategory" value="#details.valueCategory#">
        <input type="hidden" name="contactid" value="#contactid#">
        <input type="hidden" name="userid" value="#userid#">
    </cfoutput>

    <div class="row">
        <!--- Check if there is only one type available --->
        <cfif types.recordcount eq 1>
            <cfoutput>
                <input type="hidden" name="valuetype" value="#types.valuetype#" />
            </cfoutput>
        <cfelse>
            <div class="form-group col-md-6">
                <label for="valuetext">Type<span class="text-danger">*</span></label>
                <select id="valueType" name="valueType" class="form-control" data-parsley-required 
                        data-parsley-error-message="Type is required" onchange="showDiv('hidden_div', this)">
                    <option value=""></option>
                    <cfoutput query="types">
                        <option value="#types.valuetype#" <cfif types.valuetype eq details.valuetypedef>selected</cfif>>
                            <cfif types.valuetype eq "Custom">*Add New Type<cfelse>#types.valuetype#</cfif>
                        </option>
                    </cfoutput>
                </select>
            </div>
        </cfif>

        <div id="hidden_div" class="form-group col-md-6">
            <label for="customtype">Custom Type</label>
            <input class="form-control" type="text" id="customtype" name="customtype" value="Custom">
        </div>

        <cfset valuefieldtype = "text">

        <!--- Determine the field type based on new_catid --->
        <cfif new_catid eq "4">
            <cfset valuefieldtype = "text">
        </cfif>
        <cfif new_catid eq "10">
            <cfset valuefieldtype = "email">
        </cfif>
        <cfif new_catid eq "13">
            <cfset valuefieldtype = "date">
        </cfif>

        <!--- Check if new_catid is not equal to certain values --->
        <cfif new_catid neq "9" and new_catid neq "2" and new_catid neq "13" and new_catid neq "1">
            <cfoutput>
                <cfif new_catid eq "4">
                    <cfset placeholder = "https://www.yourwebsite.com">
                </cfif>
                <cfif new_catid eq "12">
                    <cfset placeholder = "https://">
                </cfif>
                <cfif new_catid eq "5">
                    <cfset placeholder = "https://">
                </cfif>
                <cfset minlength = "3">
                <div class="form-group col-md-12">
                    <label for="valuetext">#details.recordname#<span class="text-danger">*</span></label>
                    <input class="form-control" type="#valuefieldtype#" placeholder="#placeholder#" id="valuetext" 
                           value="#valuetext#" name="valuetext"
                           data-parsley-maxlength="800" 
                           data-parsley-maxlength-message="Max length 800 characters"
                           <cfif new_catid neq "4">placeholder="Enter #details.recordname#"</cfif>
                    >
                </div>
            </cfoutput>
        </cfif>

        <!--- Handle specific new_catid cases --->
        <cfif new_catid eq "1">
            <cfoutput>
                <div class="form-group col-md-12">
                    <label for="valuetext">#details.recordname#<span class="text-danger">*</span></label>
                    <input class="form-control" type="text" id="valuetext" name="valuetext" placeholder="Enter #details.recordname#">
                </div>
            </cfoutput>
        </cfif>

        <cfif new_catid eq "2">
            <cfoutput>
                <div class="form-group col-md-12">
                    <label for="valueStreetAddress">Address<span class="text-danger">*</span></label>
                    <input class="form-control" type="text" id="valueStreetAddress" name="valueStreetAddress"
                           data-parsley-minlength="5" 
                           data-parsley-minlength-message="Min length 5 characters"
                           data-parsley-maxlength="800" 
                           data-parsley-maxlength-message="Max length 800 characters"
                           data-parsley-required 
                           data-parsley-error-message="Street is required"
                           placeholder="Enter Street">
                </div>

                <div class="form-group col-md-12">
                    <label for="valueExtendedAddress">Extended Address</label>
                    <input class="form-control" type="text" id="valueExtendedAddress" name="valueExtendedAddress" placeholder="Enter Street">
                </div>

                <div class="form-group col-md-6">
                    <label for="valuetext">Town/City</label>
                    <input class="form-control" type="text" id="valueCity" name="valueCity" placeholder="Enter City">
                </div>
            </cfoutput>

            <div class="form-group col-md-6">
                <label for="valuetext">Postal Code</label>
                <input class="form-control" type="text" id="valuePostalCode" name="valuePostalCode" placeholder="Enter Postal Code">
            </div>

            <!--- Now, use the countries and regions queries in your form --->
            <div class="form-group col-md-6">
                <label for="countryid">Country<span class="text-danger">*</span></label>
                <select id="countryid" class="form-control" name="countryid" data-parsley-required 
                        data-parsley-error-message="Country is required">
                    <option value="">--</option>
                    <cfoutput query="countries">
                        <option value="#countries.countryid#" <cfif countries.countryid eq new_countryid>selected</cfif>>#countries.countryname#</option>
                    </cfoutput>
                </select>
            </div>

            <div class="form-group col-md-6">
                <label for="region_id">State/Region<span class="text-danger">*</span></label>
                <select id="region_id" name="region_id" class="form-control" size="1">
                    <option value="">--</option>
                    <cfoutput query="regions">
                        <option value="#regions.region_id#" data-chained="#regions.countryid#" <cfif regions.region_id eq new_region_id>selected</cfif>>#regions.regionname#</option>
                    </cfoutput>
                </select>
            </div>
        </cfif>

        <cfif new_catid eq "13">
            <div class="form-group col-md-12">
                <label for="itemDate">Important Date<span class="text-danger">*</span></label>
                <input class="form-control" id="itemDate" type="date" name="itemDate" 
                       data-parsley-required data-parsley-error-message="Date is required">
            </div>
        </cfif>

        <cfif new_catid eq "9">
            <cfinclude template="/include/qry/companies_198_4.cfm" />

            <div class="form-group col-md-12">
                <cfoutput>
                    <label for="valueCompany">#details.recordname# Name<span class="text-danger">*</span></label>
                </cfoutput>
                <select id="valueCompany" name="valueCompany" class="form-control" 
                        data-parsley-required data-parsley-error-message="Name is required." 
                        onchange="toggleCustomField(this)">
                    <option value="" selected></option>
                    <option value="custom">***ADD NEW***</option>
                    <cfoutput query="companies">
                        <option value="#companies.new_valuecompany#">#companies.new_valuecompany#</option>
                    </cfoutput>
                </select>
            </div>

            <cfoutput>
                <div class="form-group col-md-12" id="special" style="display: none;">
                    <label for="custom">Custom Name</label>
                    <input class="form-control" type="text" id="custom" name="custom" value="" placeholder="Enter Custom #details.recordname#">
                </div>
            </cfoutput>

            <div class="form-group col-md-12">
                <label for="valuetext">Department</label>
                <input class="form-control" type="text" id="valueDepartment" name="valueDepartment" placeholder="Enter Department">
            </div>

            <div class="form-group col-md-12">
                <label for="valuetext">Title</label>
                <input class="form-control" type="text" id="valuetitle" name="valuetitle" placeholder="Enter Title">
            </div>
        </cfif>

        <div class="form-group text-center col-md-12">
            <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" 
                    style="background-color: #406e8e; border: #406e8e;">Add</button>
        </div>
    </div>
</form>

<script>
    $("#region_id").chained("#countryid");
</script>
