<!--- This ColdFusion page handles file uploads and includes necessary parameters and JavaScript for form validation and functionality. --->

<script>
    <!--- Function to enable the submit button when a file is selected --->
    function unlock(){
        document.getElementById('buttonSubmit').removeAttribute("disabled");
    }
</script>

<cfparam name="placeholder" default="" />
<cfparam name="new_eventid" default="0" />

<!--- Include notes query template --->
<cfinclude template="/include/qry/notes_21_1.cfm" />

<cfset new_eventid = notes.eventid />

<!--- Form for file upload with necessary hidden fields --->
<form action="/include/attachmentadd2.cfm" method="post" class="parsley-examples" enctype="multipart/form-data" id="upload" 
      data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
      data-parsley-trigger="keyup" data-parsley-validate>
    
    <cfoutput>
        <input type="hidden" name="eventid" value="#new_eventid#">
        <input type="hidden" name="returnurl" value="#returnurl#">
        <input type="hidden" name="noteid" value="#noteid#">
        <input type="hidden" name="reventid" value="#new_eventid#">
        <input type="hidden" name="rcontactid" value="#contactid#">
    </cfoutput>

    <div class="row" />

    <cfset placeholder="https://" />
    <cfset minlength="3" />

    <div class="form-group col-md-12">
        <label for="attachmenturl">Upload File <span class="text-danger">*</span></label>
        <p>
            <input name="file" onchange="unlock();" type="file" />
        </p>
    </div>

    <div class="form-group text-center col-md-12">
        <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" 
                style="background-color: #406e8e; border: #406e8e;" id="buttonSubmit" disabled>Upload</button>
    </div>

    <div class="form-group col-md-12">
        <label for="attachname">Name (Optional)</label>
        <input class="form-control" type="text" id="attachname" name="attachname" 
               data-parsley-maxlength="800" 
               data-parsley-maxlength-message="Max length 800 characters" 
               placeholder="Add a name/brief description">
    </div>

</form>

<!--- Initialize Parsley for form validation --->
<script>
    $(document).ready(function() {
        $(".parsley-examples").parsley()
    });
</script>
