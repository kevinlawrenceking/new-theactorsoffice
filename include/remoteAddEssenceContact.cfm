<form method="post" action="/include/remoteaddessenceContact2.cfm" class="parsley-examples" name="versionForm" id="formVersion" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <input type="hidden" name="userId" value="#userId#">
    <div class="row">
        <div class="form-group col-md-12">
            <label class="control-label">Essence</label>
            <input class="form-control" required type="text" name="newEssenceName" id="newEssenceName" />
        </div>
        <div class="invalid-feedback">
            Please enter an essence.
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-6"></div>
        <div class="col-6 text-right">
            <cfif isDefined('sdfsdf')>
                <a href="javascript:history.go(-1)">
                    <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button>
                </a>
            </cfif>
            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btnSaveEvent">Add</button>
        </div>
    </div>
</form>

<!--- Changes made:
1. Removed unnecessary cfoutput tags around variable outputs.
2. Standardized variable names and casing.
3. Ensured consistent attribute quoting, spacing, and formatting.
--->