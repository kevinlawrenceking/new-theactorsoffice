<!--- This ColdFusion page handles the submission of media materials, including file uploads and form validation. --->
<cfparam name="audProjectId" default="0" />
<script>
    $(document).keypress(function (e) {
        <!--- Prevent form submission on Enter key press if not in a textarea --->
        if (e.which == 13 && e.target.nodeName != "TEXTAREA") {
            event.preventDefault();
            return false;
        }
    });
</script>
<script>
    function unlock() {
        <!--- Enable the submit button when called --->
        document.getElementById('buttonSubmit').removeAttribute("disabled");
    }
</script>
<cfparam name="placeholder" default="" />
<cfparam name="eventId" default="" />
<cfinclude template="/include/qry/Type_208_1.cfm" />
<form action="/include/remoteaddMaterial2.cfm" method="post" class="parsley-examples" enctype="multipart/form-data" id="upload" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <input type="hidden" name="src" value="#src#" />
    <input type="hidden" name="audProjectId" value="#audProjectId#" />
    <div class="row"></div>
    <cfset placeholder = "https://" />
    <cfset minLength = "3" />
    <div class="form-group col-md-6 col-sm-12">
        <label for="new_mediaTypeId">Media Type<span class="text-danger">*</span></label>
        <select id="new_mediaTypeId" name="new_mediaTypeId" class="form-control" data-parsley-required data-parsley-error-message="Media Type is required">
            <option value="">SELECT A TYPE</option>
            <cfoutput query="type">
                <option value="#type.mediaTypeId#">#type.mediaType#</option>
            </cfoutput>
        </select>
    </div>
    <div class="form-group col-md-12">
        <label for="new_mediaName">Name<span class="text-danger">*</span></label>
        <input class="form-control" type="text" id="new_mediaName" name="new_mediaName" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters" data-parsley-required data-parsley-error-message="Media Name is required" placeholder="Add a name/brief description">
    </div>
    <div class="form-group col-md-12">
        <label for="new_mediaUrl">URL</label>
        <input class="form-control" type="text" id="new_mediaUrl" name="new_mediaUrl" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters" placeholder="#placeholder#">
    </div>
    <cfif src is "account">
        <input type="hidden" name="new_isShare" value="#new_isShare#" />
    <cfelse>
        <div class="form-group col-md-6 col-sm-12">
            <label for="new_isShare">Save to My Materials?<span class="text-danger">*</span></label>
            <select id="new_isShare" name="new_isShare" class="form-control" data-parsley-required data-parsley-error-message="Shareable is required">
                <option value="1">Yes</option>
                <option value="0" selected>No</option>
            </select>
        </div>
    </cfif>
    <div class="form-group col-md-12">
        <label for="attachmentUrl">Upload File (optional)</label>
        <p>
            <input name="file" type="file" />
        </p>
    </div>
    <div class="form-group text-center col-md-12">
        <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" id="buttonSubmit" style="background-color: ##406e8e; border: ##406e8e;">Add</button>
    </div>
</form>
<script>
    $(document).ready(function() {
        <!--- Initialize Parsley for form validation --->
        $(".parsley-examples").parsley();
    });
</script>

<!--- Changes made based on standards: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used double pound signs for hex color codes to avoid interpretation as variables. --->