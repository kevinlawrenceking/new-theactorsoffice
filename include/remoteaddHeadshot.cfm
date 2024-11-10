<script>
    $(document).keypress(function (e) {
        if (e.which == 13 && e.target.nodeName != "TEXTAREA") {
            event.preventDefault();
            return false;
        }
    });
</script>

<script>
    function unlock() {
        document.getElementById('buttonSubmit').removeAttribute("disabled");
    }
</script>

<cfparam name="placeholder" default="" />
<cfparam name="eventId" default="" />

<cfinclude template="/include/qry/types_45_1.cfm" />

<form action="/include/remoteaddHeadshot2.cfm" method="post" class="parsley-examples" enctype="multipart/form-data" id="upload" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <input type="hidden" name="new_mediaTypeId" value="1">
    <div class="row"></div>

    <cfset placeholder = "https://" />
    <cfset minLength = "3" />

    <cfif isDefined('gfdgf')>
        <div class="form-group col-md-6 col-sm-12">
            <label for="new_mediaTypeId">Media Type<span class="text-danger">*</span></label>
            <select id="new_mediaTypeId" name="new_mediaTypeId" class="form-control" data-parsley-required data-parsley-error-message="Media Type is required">
                <cfloop query="type">
                    <option value="#type.mediaTypeId#">#type.mediaType#</option>
                </cfloop>
            </select>
        </div>
    </cfif>

    <div class="form-group col-md-12">
        <label for="attachmentUrl">Upload File <span class="text-danger">*</span></label>
        <p>
            <input name="file" onchange="unlock();" type="file" />
        </p>
    </div>

    <div class="form-group text-center col-md-12">
        <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" id="buttonSubmit" disabled style="background-color: ##406e8e; border: ##406e8e;">Upload</button>
    </div>

    <div class="form-group col-md-12">
        <label for="attachName">Name (Optional)</label>
        <input class="form-control" type="text" id="new_mediaName" name="new_mediaName" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters" placeholder="Add a name/brief description">
    </div>
</form>

<script>
    $(document).ready(function() {
        $(".parsley-examples").parsley();
    });
</script>

<!--- Changes made: 
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Used double pound signs `##` for hex color codes to avoid interpretation as variables.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->