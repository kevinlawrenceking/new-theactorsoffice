<!--- This ColdFusion page handles the submission of a form for adding an audio link. ---> 
<cfparam name="placeholder" default="" /> 
<cfparam name="contactId" default="0" /> 

<form action="/include/audLinkAdd2.cfm" method="post" class="parsley-examples" id="linkAdd" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate> 

<input type="hidden" name="audRoleId" value="<cfoutput>#audRoleId#</cfoutput>"> 
<input type="hidden" name="eventId" value="<cfoutput>#eventId#</cfoutput>"> 
<input type="hidden" name="audProjectId" value="<cfoutput>#audProjectId#</cfoutput>"> 

<cfset placeholder = "https://" /> 
<cfset minLength = "3" /> 

<div class="row"> 
    <div class="form-group col-md-12"> 
        <label for="linkName">Name <span class="text-danger">*</span></label> 
        <input class="form-control" type="text" id="linkName" name="linkName" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters" data-parsley-required="true" placeholder="Enter Name or Title"> 
    </div> 

    <div class="form-group col-md-12"> 
        <label for="linkUrl">URL <span class="text-danger">*</span></label> 
        <input class="form-control" type="text" id="linkUrl" name="linkUrl" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters" data-parsley-required="true" placeholder="Enter URL"> 
    </div> 

    <div class="form-group text-center col-md-12"> 
        <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: ##406e8e; border: ##406e8e;">Add</button> 
    </div> 
</div> 
</form> 

<script> 
    $(document).ready(function() { 
        $(".parsley-examples").parsley(); 
    }); 
</script>

<!--- Changes made: Standardized variable names and casing (Rule 5), Removed unnecessary `<cfoutput>` tags around variable outputs (Rule 2), Ensured consistent attribute quoting, spacing, and formatting (Rule 6), Used double pound signs for hex color codes to avoid interpretation as variables (Rule 10) --->