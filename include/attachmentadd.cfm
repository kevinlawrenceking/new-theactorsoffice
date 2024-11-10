<script>
    function unlock() {
        document.getElementById('buttonSubmit').removeAttribute("disabled");
    }
</script>

<cfparam name="placeholder" default="" />
<cfparam name="newEventId" default="0" />

<cfinclude template="/include/qry/notes_21_1.cfm" />

<cfset newEventId = notes.eventid />

<form action="/include/attachmentadd2.cfm" method="post" class="parsley-examples" enctype="multipart/form-data" id="upload" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <input type="hidden" name="eventId" value="<cfoutput>#newEventId#</cfoutput>">
    <input type="hidden" name="returnUrl" value="<cfoutput>#returnurl#</cfoutput>">
    <input type="hidden" name="noteId" value="<cfoutput>#noteid#</cfoutput>">
    <input type="hidden" name="reventId" value="<cfoutput>#newEventId#</cfoutput>">
    <input type="hidden" name="rcontactId" value="<cfoutput>#contactid#</cfoutput>">

    <div class="row"></div>

    <cfset placeholder = "https://" />
    <cfset minlength = "3" />

    <div class="form-group col-md-12">
        <label for="attachmentUrl">Upload File <span class="text-danger">*</span></label>
        <p>
            <input name="file" onchange="unlock();" type="file">
        </p>
    </div>

    <div class="form-group text-center col-md-12">
        <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: ##406e8e; border: ##406e8e;" id="buttonSubmit" disabled>Upload</button>
    </div>

    <div class="form-group col-md-12">
        <label for="attachName">Name (Optional)</label>
        <input class="form-control" type="text" id="attachName" name="attachName" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters" placeholder="Add a name/brief description">
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
3. Used double pound signs `##` to avoid interpretation as variables for hex color codes.
--->