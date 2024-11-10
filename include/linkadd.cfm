<!--- This ColdFusion page handles the submission of a link associated with a contact and an event. --->
<cfparam name="placeholder" default="" />
<cfparam name="contactId" default="0" /> <!--- Standardize variable names and casing --->

<!--- Include notes query template --->
<cfinclude template="/include/qry/notes_21_1.cfm" />

<cfset newEventId = notes.eventid /> <!--- Standardize variable names and casing --->

<!--- Form for adding a link --->
<form action="/include/linkadd2.cfm" method="post" class="parsley-examples" id="linkadd" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>

<input type="hidden" name="rcontactid" value="#contactId#"> <!--- Remove unnecessary <cfoutput> tags around variable outputs --->
<input type="hidden" name="reventid" value="#newEventId#"> <!--- Remove unnecessary <cfoutput> tags around variable outputs --->
<input type="hidden" name="contactid" value="#contactId#"> <!--- Remove unnecessary <cfoutput> tags around variable outputs --->
<input type="hidden" name="eventid" value="#newEventId#"> <!--- Remove unnecessary <cfoutput> tags around variable outputs --->
<input type="hidden" name="returnurl" value="#returnurl#"> <!--- Remove unnecessary <cfoutput> tags around variable outputs --->
<input type="hidden" name="noteid" value="#noteid#"> <!--- Remove unnecessary <cfoutput> tags around variable outputs --->

<!--- Check if audprojectid is defined and include it as a hidden input --->
<cfif isDefined('audProjectId')> <!--- Standardize variable names and casing --->
<input type="hidden" name="audprojectid" value="#audProjectId#"> <!--- Remove unnecessary <cfoutput> tags around variable outputs --->
</cfif>

<div class="row" />

<cfset placeholder="https://" />
<cfset minlength="3" />

<!--- Form group for link name --->
<div class="form-group col-md-12">
<label for="linkname">Name <span class="text-danger">*</span></label>
<input class="form-control" type="text" id="linkname" name="linkname" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters" data-parsley-required="true" placeholder="Enter Name or Title">
</div>

<!--- Form group for link URL --->
<div class="form-group col-md-12">
<label for="linkurl">URL <span class="text-danger">*</span></label>
<input class="form-control" type="text" id="linkurl" name="linkurl" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters" data-parsley-required="true" placeholder="Enter URL">
</div>

<!--- Submit button for the form --->
<div class="form-group text-center col-md-12">
<button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: ##406e8e; border: ##406e8e;">Add</button> <!--- For any # symbols inside <cfoutput> blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), use double pound signs ## to avoid interpretation as variables. --->
</div>

</form>

<!--- Initialize Parsley validation on document ready --->
<script>
$(document).ready(function() {
$(".parsley-examples").parsley();
});
</script>

<!--- Changes were made based on the following rules: 2. Remove unnecessary <cfoutput> tags around variable outputs. 5. Standardize variable names and casing. 10. For any # symbols inside <cfoutput> blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), use double pound signs ## to avoid interpretation as variables. --->