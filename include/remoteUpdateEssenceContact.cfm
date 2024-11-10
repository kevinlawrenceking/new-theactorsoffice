<!--- This ColdFusion page handles the update of essence contact details through a form submission. --->
<cfinclude template="/include/qry/details_263_1.cfm" />

<form method="post" action="/include/remoteupdateessenceContact2.cfm" class="parsley-examples" name="versionForm" id="formVersion" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>

    <!--- Output hidden fields for user and essence IDs --->
    <input type="hidden" name="userId" value="#userid#">
    <input type="hidden" name="essenceId" value="#essenceid#">

    <div class="row">
        <!--- Output form group for essence name input --->
        <div class="form-group col-md-12">
            <label class="control-label">Essence</label>
            <input class="form-control" required type="text" value="#details.essenceName#" name="newEssenceName" id="newEssenceName">
        </div>

        <div class="invalid-feedback"> Please enter an essence. </div>

        <!--- Custom checkbox for deletion option --->
        <div class="custom-group custom-checkbox">
            <div style="margin-left:25px;">
                <label class="custom-control-label">
                    <input type="checkbox" class="custom-control-input" id="isDeleted" value="1" name="isDeleted">
                    <span class="custom-control-label" for="deleteItem">Delete</span>
                </label>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-6">
            <!--- Placeholder for additional content if needed --->
        </div>

        <div class="col-6 text-right">
            <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btnSaveEvent">Update</button>
        </div>
    </div>

</form>

<!--- Modifications: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Standardized variable names and casing.
3. Ensured consistent attribute quoting, spacing, and formatting.
--->