<!--- This ColdFusion page handles the submission of a new audition site along with its categories. --->
<cfset oldCatList = "" />
<form method="post" action="/include/remoteaddaudsubmitsite2.cfm" class="parsley-examples" name="versionForm" id="formVersion" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <!--- Hidden input for user ID --->
    <input type="hidden" name="userId" value="#userId#">
    <div class="row">
        <!--- Submission Site Input --->
        <div class="form-group col-md-12">
            <label class="control-label">Submission Site</label>
            <input class="form-control" required type="text" name="newSubmitSiteName" id="newSubmitSiteName" />
        </div>
        <div class="invalid-feedback">
            Please enter a Submission Site.
        </div>
        <!--- Include categories query --->
        <cfinclude template="/include/qry/getCategories_196_1.cfm" />
        <div class="form-group col-md-12">
            <label class="control-label">Valid Audition Categories:</label>
            <div class="custom-group custom-checkbox">
                <!--- Loop through categories --->
                <cfloop query="getCategories">
                    <div class="form-check" style="margin-left:25px;">
                        <input class="form-check-input" type="checkbox" value="#audCatId#" id="catList#audCatId#" name="catList"<cfif listFind(oldCatList, audCatId)>checked</cfif>>
                        <label class="form-check-label" for="catList#audCatId#"> #audCatName# </label>
                    </div>
                </cfloop>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-6">
                <!--- Empty column for spacing --->
            </div>
            <div class="col-6 text-right">
                <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btnSaveEvent">Add</button>
            </div>
        </div>
    </div>
</form>

<!--- Changes made: 
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Standardized variable names and casing.
3. Ensured consistent attribute quoting, spacing, and formatting.
--->