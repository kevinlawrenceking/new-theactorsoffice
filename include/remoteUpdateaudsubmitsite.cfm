<cfinclude template="/include/qry/details_259_1.cfm" />
<cfset oldCatList = details.catlist />

<form method="post" action="/include/remoteupdateaudsubmitsite2.cfm" class="parsley-examples" name="version-form" id="form-version" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>

    <input type="hidden" name="userid" value="#userid#">
    <input type="hidden" name="submitsiteid" value="#submitsiteid#">

    <div class="row">
        <div class="form-group col-md-12">
            <label class="control-label">Submission Site</label>
            <input class="form-control" required type="text" value="#details.submitsitename#" name="new_submitsitename" id="new_submitsitename">
        </div>
        <div class="invalid-feedback"> Please enter a Submission Site. </div>

        <cfinclude template="/include/qry/getCategories_196_1.cfm" />

        <div class="form-group col-md-12">
            <label class="control-label">Valid Audition Categories:</label>
            <div class="custom-group custom-checkbox">
                <cfloop query="getCategories">
                    <div class="form-check" style="margin-left:25px;">
                        <input class="form-check-input" type="checkbox" value="#audcatid#" id="catlist#audcatid#" name="catlist"<cfif listFind(oldCatList, audcatid)>checked</cfif>>
                        <label class="form-check-label" for="catlist#audcatid#">#audcatname#</label>
                    </div>
                </cfloop>
            </div>
        </div>

        <cfinclude template="/include/qry/findsubs_259_3.cfm" />

        <cfif findsubs.recordcount eq 0>
            <cfset disableTag = "">
        <cfelse>
            <cfset disableTag = "disabled">
        </cfif>

        <div class="custom-group custom-checkbox">
            <div style="margin-left:25px;">
                <label class="custom-control-label">
                    <input type="checkbox" #disableTag# class="custom-control-input" id="IsDeleted" value="1" name="IsDeleted">
                    <span class="custom-control-label" style="color:##disableTag##red;" for="deleteitem">Delete<cfif disableTag eq "disabled">*</cfif></span>
                </label>
                <cfif disableTag eq "disabled">
                    <p style="margin-left:25px;"><i>*Submission sites in use cannot be deleted.</i></p>
                </cfif>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-6"></div>
        <div class="col-6 text-right">
            <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Update</button>
        </div>
    </div>

</form>

<!--- 
Modifications were made based on the following rules:
1. Maintain consistent and efficient conditional logic, especially for styling or control structures.
2. Remove unnecessary `<cfoutput>` tags around variable outputs.
3. Avoid using `#` symbols within conditional checks unless essential.
4. Simplify record count logic for icons or conditional displays.
5. Standardize variable names and casing.
6. Ensure consistent attribute quoting, spacing, and formatting.
10. For any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), use double pound signs `##` to avoid interpretation as variables.
--->