<!--- This ColdFusion page handles the audition form submission, including category and subcategory selection. --->
<cfset debugFlag = "N" />
<cfparam name="isDirect" default="0" />
<script src="/app/assets/js/jquery.chained.js"></script>
<cfparam name="contactId" default="0" />

<!--- Include the category selection query --->
<cfinclude template="/include/qry/audCategoriesSelect.cfm">

<!--- Include the subcategory selection query --->
<cfinclude template="/include/qry/audSubCategoriesSelect.cfm">

<style>
    #hiddenDiv {
        display: none;
    }
</style>

<!--- Form for audition submission --->
<form method="post" action="/app/audition-add/index.cfm" class="parsley-examples" name="eventForm" id="formEvent" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <input type="hidden" name="newAudStepId" value="1">
    <input type="hidden" name="newUserId" value="#userId#">
    <input type="hidden" name="isDirect" value="#isDirect#">
    
    <div class="row">
        <div class="form-group col-md-6">
            <label for="audCatId">Category<span class="text-danger">*</span></label>
            <select id="audCatId" class="form-control" name="newAudCatId" data-parsley-required data-parsley-error-message="Category is required">
                <option value="">--</option>
                <cfoutput query="audCategoriesSelect">
                    <option value="#id#">#name#</option>
                </cfoutput>
            </select>
        </div>
        
        <div class="form-group col-md-6 col-sm-12">
            <label for="audTypeId">Subcategory<span class="text-danger">*</span></label>
            <select id="newAudSubCatId" name="newAudSubCatId" class="form-control" data-parsley-required data-parsley-error-message="Subcategory is required">
                <option value="">--</option>
                <cfoutput query="audSubCategoriesSelect">
                    <option value="#id#" data-chained="#audCatId#">#name#</option>
                </cfoutput>
            </select>
        </div>
        
        <div class="form-group text-center col-md-12">
            <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e;" type="submit">Add</button>
        </div>
    </div>
</form>

<script src="/app/assets/js/libs/parsleyjs/parsley.min.js"></script>
<script> $("#newAudSubCatId").chained("#audCatId"); </script>

<!--- Changes made based on standards:
1. Standardized variable names and casing.
2. Removed unnecessary cfoutput tags around variable outputs.
3. Ensured consistent attribute quoting, spacing, and formatting.
4. Used double pound signs for hex color codes to avoid interpretation as variables.
--->