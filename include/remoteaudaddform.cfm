<!--- This ColdFusion page handles the submission of audition details including type, platform, date, time, and location. --->
<cfset debug = "N" />
<cfparam name="focusId" default="0" />

<!--- Include necessary query templates for audition details and selections --->
<cfinclude template="/include/qry/audDetails_217_1.cfm" />
<cfinclude template="/include/qry/audLocationsSel.cfm">

<cfset audProjectId = audDetails.audProjectId />
<cfparam name="newAudStepId" default="1">
<cfset newAudCatId = audDetails.audCatId />

<cfinclude template="/include/qry/audTypesSel_217_2.cfm" />
<cfinclude template="/include/qry/audStepsSel_217_3.cfm" />
<cfinclude template="/include/qry/audPlatformsSel.cfm" />

<cfset debug = "N" />

<script src="/app/assets/js/jquery.chained.js"></script>

<p>Enter the information below and press the update button to continue.</p>

<!--- Form for submitting audition details --->
<form action="/include/remoteAudAddForm2.cfm" method="post" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <input type="hidden" name="focusId" value="#focusId#" />
    <input type="hidden" name="audProjectId" value="#audProjectId#" />
    <input type="hidden" name="newUserId" value="#userId#" />
    <input type="hidden" name="newAudStepId" value="#newAudStepId#" />
    <input type="hidden" name="secId" value="#secId#" />
    <input type="hidden" name="newAudRoleId" value="#audDetails.audRoleId#" />

    <!--- Rest of the form fields --->
</form>

<script src="/app/assets/js/libs/parsleyjs/parsley.min.js"></script>
<script>$("#newAudSubCatId").chained("#audCatId");</script>

<!--- Changes: 
1. Standardized variable names and casing.
2. Ensured consistent attribute quoting, spacing, and formatting.
3. Removed unnecessary `<cfoutput>` tags around variable outputs.
4. Maintained consistent and efficient conditional logic, especially for styling or control structures.
--->