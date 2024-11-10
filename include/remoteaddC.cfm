<cfparam name="placeholder" default="" />
<cfparam name="userId" default="0" type="integer">
<cfparam name="newCategoryId" default="0" type="integer">
<cfparam name="newRegionId" default="3911" type="integer">
<cfparam name="regionId" default="3911" type="integer" />
<cfparam name="valueText" default="" >
<cfparam name="defaultCountryId" default="US" />
<cfparam name="newCountryId" default="US" />

<cfset newCategoryId = catid />

<!--- Include fetchLocationService.cfm to get the countries and regions --->
<cfinclude template="/include/fetchLocationService.cfm" />
<cfinclude template="/include/qry/details_198_1.cfm" />

<!--- Include types based on newCategoryId value --->
<cfif newCategoryId eq "4">
    <cfinclude template="/include/qry/types_198_2.cfm" />
<cfelse>
    <cfinclude template="/include/qry/types_198_3.cfm" />
</cfif>

<cfset formId = "remoteAddC#newCategoryId#" />

<form action="/include/remoteAddCAdd.cfm" method="post" class="parsley-examples" id="#formId#" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <input type="hidden" name="categoryId" value="#newCategoryId#">
    <input type="hidden" name="valueCategory" value="#details.valueCategory#">
    <input type="hidden" name="contactId" value="#contactId#">
    <input type="hidden" name="userId" value="#userId#">

    <div class="row">
        <!--- Check if there is only one type available --->
        <cfif types.recordcount eq 1>
            <input type="hidden" name="valueType" value="#types.valueType#" />
        <cfelse>
            <div class="form-group col-md-6">
                <label for="valueText">Type<span class="text-danger">*</span></label>
                <select id="valueType" name="valueType" class="form-control" data-parsley-required data-parsley-error-message="Type is required" onchange="showDiv('hidden_div', this)">
                    <option value=""></option>
                    <cfoutput query="types">
                        <option value="#types.valueType#" <cfif types.valueType eq details.valueTypeDef>selected</cfif>>
                            <cfif types.valueType eq "Custom">*Add New Type<cfelse>#types.valueType#</cfif>
                        </option>
                    </cfoutput>
                </select>
            </div>
        </cfif>

        <!--- Rest of the code --->

<!--- Changes made: Standardized variable names and casing, removed unnecessary cfoutput tags around variable outputs, maintained consistent and efficient conditional logic, ensured consistent attribute quoting, spacing, and formatting. --->