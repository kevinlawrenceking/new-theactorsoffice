<!--- This ColdFusion page prompts the user for confirmation before deleting an audition project. --->
<center>Are you sure you want to delete this audition project?</center>
<p></p>
<form action="/include/remoteDeleteFormAudprojectDelete.cfm" method="post" class="needs-validation" novalidate>
    <!--- Hidden input for RPG ID --->
    <input type="hidden" name="rpgid" value="175" />
    <!--- Hidden input for Audition Project ID --->
    <input type="hidden" name="audprojectid" value="<cfoutput>#audprojectid#</cfoutput>" />
    <p>&nbsp;</p>
    <div class="form-group text-center col-md-12">
        <!--- Submit button for deletion confirmation --->
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##FF0000; border-color: ##FF0000;" type="submit">Delete</button>
    </div>
</form>

<!--- Changes made:
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Ensured consistent attribute quoting, spacing, and formatting.
3. Used double pound signs `##` for hex color codes to avoid interpretation as variables.
--->