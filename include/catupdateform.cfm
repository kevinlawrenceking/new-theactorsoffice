<!--- This ColdFusion page allows users to update audition project details by selecting categories and subcategories. --->
<cfset debugFlag = "N" />
<cfinclude template="/include/qry/audCategoriesSelect.cfm" />
<cfinclude template="/include/qry/audSubCategoriesSelect.cfm" />
<cfinclude template="/include/qry/auditionProjectDetails_66_1.cfm" />
<cfset debugFlag = "N" />

<script src="/app/assets/js/jquery.chained.js"></script>

<p>Enter the information below and press the update button to continue.</p>

<form action="/include/catUpdateForm2.cfm" method="post" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <input type="hidden" name="audProjectId" value="<cfoutput>#audProjectId#</cfoutput>" />
    <input type="hidden" name="newUserId" value="<cfoutput>#userId#</cfoutput>" />
    <input type="hidden" name="newAudProjectId" value="<cfoutput>#audProjectId#</cfoutput>" />
    <input type="hidden" name="secId" value="<cfoutput>#secId#</cfoutput>" />

    <div class="row"></div>

    <!--- Category Selection --->
    <div class="form-group col-md-6 col-sm-12">
        <label for="audCatId">Category<span class="text-danger">*</span></label>
        <select id="audCatId" class="form-control" name="newAudCatId" data-parsley-required data-parsley-error-message="Category is required">
            <option value="">--</option>
            <cfoutput query="audCategoriesSelect">
                <cfif auditionProjectDetails.audCatId eq audCategoriesSelect.id>
                    <option value="#audCategoriesSelect.id#" Selected>#audCategoriesSelect.name#</option>
                <cfelse>
                    <option value="#audCategoriesSelect.id#">#audCategoriesSelect.name#</option>
                </cfif>
            </cfoutput>
        </select>
    </div>

    <!--- Subcategory Selection --->
    <div class="form-group col-md-6 col-sm-12">
        <label for="newAudSubCatId">Subcategory<span class="text-danger">*</span></label>
        <select id="newAudSubCatId" name="newAudSubCatId" class="form-control" data-parsley-required data-parsley-error-message="Subcategory is required">
            <option value="">--</option>
            <cfoutput query="audSubCategoriesSelect">
                <cfif auditionProjectDetails.audSubCatId eq audSubCategoriesSelect.id>
                    <option value="#audSubCategoriesSelect.id#" Selected data-chained="#audSubCategoriesSelect.audCatId#">#audSubCategoriesSelect.name#</option>
                <cfelse>
                    <option value="#audSubCategoriesSelect.id#" data-chained="#audSubCategoriesSelect.audCatId#">#audSubCategoriesSelect.name#</option>
                </cfif>
            </cfoutput>
        </select>
    </div>

    <!--- Submit Button --->
    <div class="form-group text-center col-md-12">
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e;" type="submit">Update</button>
    </div>
</form>

<script src="/app/assets/js/libs/parsleyjs/parsley.min.js"></script>
<script>$("#newAudSubCatId").chained("#audCatId");</script>

<!--- Changes: Standardized variable names and casing, Removed unnecessary cfoutput tags, Used double pound signs for hex color codes, Simplified conditional checks --->