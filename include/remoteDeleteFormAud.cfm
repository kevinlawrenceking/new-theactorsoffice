<!--- This ColdFusion page confirms the deletion of an audition and submits the deletion request. --->
<cfinclude template="/include/qry/details_229_1.cfm" />

<center>Are you sure you want to delete this audition?</center>

<p></p>

<!--- Form for submitting the delete request --->
<form action="/include/remoteDeleteFormAudDelete.cfm" method="post" class="needs-validation" novalidate>
    <input type="hidden" name="rpgid" value="175" />
    <input type="hidden" name="eventid" value="#eventid#" />
    <input type="hidden" name="audprojectid" value="#audprojectid#" />
    <input type="hidden" name="audroleid" value="#audroleid#" />
    
    <p>&nbsp;</p>
    
    <div class="form-group text-center col-md-12">
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##FF0000; border: ##FF0000" type="submit">Delete</button>
    </div>
</form>

<!--- Modifications: 
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Avoided using `#` symbols within conditional checks unless essential.
3. Ensured consistent attribute quoting, spacing, and formatting.
4. Used double pound signs `##` for hex color codes to avoid interpretation as variables.
--->