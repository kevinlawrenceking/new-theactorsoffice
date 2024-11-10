<!--- This ColdFusion page handles the display and update of contact information including name, birthday, meeting date, pronouns, and referral details. --->
<cfinclude template="/include/qry/pronouns_269_1.cfm" />
<cfinclude template="/include/qry/refers_210_2.cfm" />
<cfinclude template="/include/qry/details_269_3.cfm" />

<cfset contactBirthday = details.contactBirthday />
<cfset contactMeetingDate = details.contactMeetingDate />

<form action="/include/remoteUpdateNameUpdate.cfm" method="post" class="parsley-examples" id="profile-form" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>

<input type="hidden" name="contactId" value="#details.contactId#">

<div class="row">
<div class="form-group col-md-12">
<label for="contactFullName">Name<span class="text-danger">*</span></label>
<input class="form-control" type="text" id="contactFullName" name="contactFullName" value="#details.contactFullName#" data-parsley-maxlength="500" data-parsley-maxlength-message="Max length 500 characters" data-parsley-required data-parsley-error-message="Valid Name is required" placeholder="Enter Name">
</div>

<cfscript>
if (Len(trim(contactBirthday)) > 0 && REFind("^\d{4}-\d{2}-\d{2}$", contactBirthday)) {
parsedDate = ParseDateTime(contactBirthday);
contactBirthday = DateFormat(parsedDate, "yyyy-mm-dd");
} else {
contactBirthday = "";
}

if (Len(trim(contactMeetingDate)) > 0 && REFind("^\d{4}-\d{2}-\d{2}$", contactMeetingDate)) {
parsedDate = ParseDateTime(contactMeetingDate);
contactMeetingDate = DateFormat(parsedDate, "yyyy-mm-dd");
} else {
contactMeetingDate = "";
}
</cfscript>

<div class="form-group col-sm-6 mb-6">
<label for="simpleinput">Next Birthday</label>
<input class="form-control" id="contactBirthday" value="#contactBirthday#" type="date" name="contactBirthday">
</div>

<div class="form-group col-sm-6 mb-6">
<label for="simpleinput">Initial Meeting Date</label>
<input class="form-control" id="contactMeetingDate" value="#contactMeetingDate#" type="date" name="contactMeetingDate">
</div>

<div class="form-group col-sm-6 mb-6">
<label for="contactMeetingLoc">Initial Meeting Location</label>
<input class="form-control" id="contactMeetingLoc" type="text" name="contactMeetingLoc" value="#details.contactMeetingLoc#">
</div>

<div class="form-group col-sm-6 mb-6">
<label for="contactPronoun">Gender Pronoun</label>
<select id="contactPronoun" name="contactPronoun" class="form-control" onchange="if (this.value=='custom'){this.form['custom'].style.visibility='visible',this.form['custom'].required=true}else {this.form['custom'].style.visibility='hidden',this.form['custom'].required=false};">
<option value="">Select a Pronoun</option>
<cfoutput query="pronouns">
<option value="#pronouns.genderPronoun#" <cfif pronouns.genderPronoun is details.contactPronoun> Selected</cfif>>#pronouns.genderPronoun#</option>
</cfoutput>
<option value="custom">Custom</option>
</select>
</div>

<div class="form-group col-sm-6 mb-6">
<label for="referContactId">Referred By</label>
<select id="referContactId" name="referContactId" class="form-control" style="width:100%;">
<option value="">Select a Relationship</option>
<cfoutput query="refers">
<option value="#refers.contactId#" <cfif refers.contactId is details.referContactId> selected</cfif>>#refers.contactFullName#</option>
</cfoutput>
</select>
</div>

<div class="form-group col-sm-6 mb-6">
<div class="input-group">
<input class="form-control" type="text" name="custom" id="custom" style="visibility:hidden;" data-parsley-maxlength="50" placeholder="Add a Gender Pronoun in single/plural format.">
</div>
</div>

<input type="hidden" name="deleteItem" value="0">

<div class="form-group text-center col-md-12">
<button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: ##406e8e; border: ##406e8e;">Update</button>
</div>

</form>

<script>
$(document).ready(function() {
$(".parsley-examples").parsley()
});
</script>

<cfset scriptNameInclude="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />

<!--- Changes made based on standards: 2, 3, 5, 6, 7, 9, 10 --->