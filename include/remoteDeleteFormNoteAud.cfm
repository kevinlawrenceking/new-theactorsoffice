<!--- This ColdFusion page confirms the deletion of a note and provides a form to submit the deletion request. --->
<center>Are you sure you want to delete this note?</center>
<p></p>
<!--- Form to handle note deletion --->
<form action="/include/deletenote.cfm" method="post" class="needs-validation" novalidate>
    <input type="hidden" name="recId" value="#recId#">
    <input type="hidden" name="audProjectId" value="#audProjectId#">
    <input type="hidden" name="returnUrl" value="audition">
    <p>&nbsp;</p>
    <div class="form-group text-center col-md-12">
        <!--- Submit button for deletion confirmation --->
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##FF0000; border: ##FF0000;" type="submit">Delete</button>
    </div>
</form>

<!---
Changes made:
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Avoided using `#` symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. For any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs `##` to avoid interpretation as variables.
--->