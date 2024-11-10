<style> 
    #hidden_div { 
        display: none; 
    } 
</style> 

<cfinclude template="/include/fetchLocationService.cfm" /> 
<cfinclude template="/include/qry/details_261_1.cfm" /> 

<cfparam name="newCountryId" default="" /> <!--- Standardize variable names and casing --->
<cfparam name="newRegionId" default="" /> <!--- Standardize variable names and casing --->

<cfinclude template="/include/qry/findcountry_261_2.cfm" /> 

<!--- Check if a country is found and set the new_countryid accordingly --->
<cfif findcountry.recordcount eq 1> <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. --->
    <cfset newCountryId = findcountry.countryid /> <!--- Standardize variable names and casing --->
</cfif>

<cfinclude template="/include/qry/findregion_261_3.cfm" /> 

<!--- Check if a region is found and set the new_region_id accordingly --->
<cfif findregion.recordcount eq 1> <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. --->
    <cfset newRegionId = findregion.region_id /> <!--- Standardize variable names and casing --->
</cfif>

<cfset newCatId = details.catid /> <!--- Standardize variable names and casing --->

<!--- Include different query templates based on the category id --->
<cfif newCatId eq "4"> <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. --->
    <cfinclude template="/include/qry/types_261_4.cfm" /> 
<cfelse> 
    <cfinclude template="/include/qry/types_261_5.cfm" /> 
</cfif>

<cfset formId = "remoteupdate#itemid#" /> <!--- Standardize variable names and casing --->

<form action="/include/remoteUpdateCUpdate.cfm" method="post" class="parsley-examples" id="#formId#" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate> 

    <input type="hidden" name="catid" value="#newCatId#"> <!--- Remove unnecessary <cfoutput> tags around variable outputs. --->
    <input type="hidden" name="itemid" value="#details.itemid#"> <!--- Remove unnecessary <cfoutput> tags around variable outputs. --->
    <input type="hidden" name="contactid" value="#details.contactid#"> <!--- Remove unnecessary <cfoutput> tags around variable outputs. --->
    <input type="hidden" name="userid" value="#userid#"> <!--- Remove unnecessary <cfoutput> tags around variable outputs. --->

    <div class="row"> 
        <!--- Check if there is only one type and set the valuetype accordingly --->
        <cfif types.recordcount eq 1> <!--- Simplify record count logic for icons or conditional displays. --->
            <input type="hidden" name="valuetype" value="#types.valuetype#" /> <!--- Remove unnecessary <cfoutput> tags around variable outputs. --->
        <cfelse> 
            <div class="form-group col-md-6"> 
                <label for="valuetext">Type <span class="text-danger">*</span></label> 
                <select id="valueType" name="valueType" class="form-control" data-parsley-required data-parsley-error-message="Type is required" onchange="showDiv('hidden_div', this)"> 
                    <option value=""></option> 
                    <cfoutput query="types"> 
                        <option value="#types.valuetype#" <cfif types.valuetype eq details.valueType>selected</cfif>>#types.valuetype#</option> 
                    </cfoutput> 
                </select> 
            </div> 
        </cfif>

        <div id="hidden_div" class="form-group col-md-6"> 
            <label for="customtype">Custom Type</label> 
            <input class="form-control" type="text" id="customtype" name="customtype" placeholder="Add a custom type"> 
        </div>

        <cfset valueFieldType = "text"> <!--- Standardize variable names and casing --->

        <!--- Determine the field type based on the category id --->
        <cfif newCatId eq "10"> <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. --->
            <cfset valueFieldType = "email"> <!--- Standardize variable names and casing --->
        </cfif>

        <cfif newCatId eq "13"> <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. --->
            <cfset valueFieldType = "date"> <!--- Standardize variable names and casing --->
        </cfif>

        <!--- Check if the category id is not one of the specified values and render the input field accordingly --->
        <cfif NOT ListFind("9,2,13,1", newCatId)> <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. --->
            <cfset minLength = (newCatId eq "4" OR newCatId eq "5") ? 3 : 14> <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. --->
            <div class="form-group col-md-12"> 
                <label for="valuetext">#details.recordname#<span class="text-danger">*</span></label> 
                <input class="form-control" type="#valueFieldType#" id="valuetext" name="valuetext" value="#details.valuetext#" data-parsley-minlength="#minLength#" data-parsley-minlength-message="Min length #minLength# characters" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters" data-parsley-required data-parsley-error-message="Valid #details.recordname# is required" placeholder="Enter #details.recordname#"> 
            </div>
        </cfif>

        <!--- Handle specific category id for additional input fields --->
        <cfif newCatId eq "1"> <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. --->
            <div class="form-group col-md-12"> 
                <label for="valuetext">#details.recordname#<span class="text-danger">*</span></label> 
                <input class="form-control" type="text" id="valuetext" name="valuetext" value="#details.valuetext#" data-parsley-required placeholder="Enter #details.recordname#"> 
            </div>
        </cfif>

        <cfif newCatId eq "2"> <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. --->
            <div class="form-group col-md-12"> 
                <label for="valueStreetAddress">Address<span class="text-danger">*</span></label> 
                <input class="form-control" type="text" id="valueStreetAddress" value="#details.valueStreetAddress#" name="valueStreetAddress" data-parsley-minlength="2" data-parsley-minlength-message="Min length 3 characters" data-parsley-maxlength="100" data-parsley-maxlength-message="Max length 100 characters" data-parsley-required data-parsley-error-message="Street is required" placeholder="Enter Street"> 
            </div>

            <div class="form-group col-md-12"> 
                <label for="valueExtendedAddress">Extended Address</label> 
                <input class="form-control" type="text" id="valueExtendedAddress" value="#details.valueExtendedAddress#" name="valueExtendedAddress" placeholder="Enter Street"> 
            </div>

            <div class="form-group col-md-6"> 
                <label for="valuetext">Town/City</label> 
                <input class="form-control" type="text" id="valueCity" value="#details.valueCity#" name="valueCity" placeholder="Enter City"> 
            </div>

            <div class="form-group col-md-6"> 
                <label for="valuetext">Postal Code</label> 
                <input class="form-control" type="text" id="valuePostalCode" value="#details.valuePostalCode#" name="valuePostalCode" placeholder="Enter Postal Code"> 
            </div>

            <div class="form-group col-md-6"> 
                <label for="countryid">Country<span class="text-danger">*</span></label> 
                <select id="countryid" class="form-control" name="countryid" data-parsley-required data-parsley-error-message="Country is required"> 
                    <option value="">--</option> 
                    <cfoutput query="countries"> 
                        <option value="#countries.countryid#" <cfif countries.countryid eq newCountryId>selected</cfif>>#countries.countryname#</option> 
                    </cfoutput> 
                </select> 
            </div>

            <div class="form-group col-md-6"> 
                <label