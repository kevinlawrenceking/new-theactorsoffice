<!--- This ColdFusion page confirms the deletion of a note and processes the deletion action. --->
<center>Are you sure you want to delete this note?</center>
<p></p>
<!--- Form to handle the deletion of a note --->
<form action="/include/deletenote.cfm" method="post" class="needs-validation" novalidate>
    <input type="hidden" name="recid" value="#recid#">
    <input type="hidden" name="contactid" value="#contactid#">
    <input type="hidden" name="returnurl" value="contact">
    <p>&nbsp;</p>
    <div class="form-group text-center col-md-12">
        <!--- Submit button to confirm deletion --->
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##FF0000; border: ##FF0000;" type="submit">Delete</button>
    </div>
</form>

<!--- Changes made based on standards: 
1. Removed unnecessary cfoutput tags around variable outputs (Standard 2).
2. Used double pound signs for hex color codes to avoid interpretation as variables (Standard 10).
--->