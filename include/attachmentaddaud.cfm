<script>
    function unlock() {
        document.getElementById('buttonSubmit').removeAttribute("disabled");
    }
</script>

<cfparam name="placeholder" default="" />

<cfinclude template="/include/qry/notes_21_1.cfm" />

<form 
    action="/include/attachmentadd2aud.cfm" 
    method="post" 
    class="parsley-examples" 
    enctype="multipart/form-data" 
    id="upload" 
    data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" 
    data-parsley-trigger="keyup" 
    data-parsley-validate
>
    <input type="hidden" name="returnurl" value="<cfoutput>#returnurl#</cfoutput>">
    <input type="hidden" name="noteid" value="<cfoutput>#noteid#</cfoutput>">
    <input type="hidden" name="audprojectid" value="<cfoutput>#audprojectid#</cfoutput>">
    <input type="hidden" name="rcontactid" value="<cfoutput>#contactid#</cfoutput>">

    <div class="row"></div>

    <cfset placeholder = "https://" />
    <cfset minlength = "3" />

    <div class="form-group col-md-12">
        <label for="attachmenturl">Upload File <span class="text-danger">*</span></label>
        <p>
            <input name="file" onchange="unlock();" type="file">
        </p>
    </div>

    <div class="form-group text-center col-md-12">
        <button 
            class="btn btn-primary editable-submit btn-sm waves-effect waves-light" 
            type="submit"
            style="background-color: ##406e8e; border: ##406e8e;" 
            id="buttonSubmit" 
            disabled
        >
            Upload
        </button>
    </div>

    <div class="form-group col-md-12">
        <label for="attachname">Name (Optional)</label>
        <input 
            class="form-control" 
            type="text" 
            id="attachname" 
            name="attachname" 
            data-parsley-maxlength="800" 
            data-parsley-maxlength-message="Max length 800 characters" 
            placeholder="Add a name/brief description"
        >
    </div>
</form>

<script>
    $(document).ready(function() {
        $(".parsley-examples").parsley();
    });
</script>

<!--- Changes: Removed unnecessary cfoutput tags around variable outputs, used double pound signs for hex color codes, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting. --->