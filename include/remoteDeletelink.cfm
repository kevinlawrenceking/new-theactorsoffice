<!--- This ColdFusion page prompts the user for confirmation before deleting a specified link. --->
<cfinclude template="/include/qry/audlink_details_237_1.cfm" />

<center>Are you sure you want<BR>to delete <strong>#audlink_details.linkname#</strong>?</center>

<p></p>

<!--- Form for deleting the link --->
<form action="/include/remoteDeleteLink2.cfm" method="post" class="needs-validation" novalidate>
    <input type="hidden" name="eventId" value="#eventId#" />
    <input type="hidden" name="audProjectId" value="#audProjectId#" />
    <input type="hidden" name="linkId" value="#linkId#" />
    <input type="hidden" name="secId" value="177" />

    <p>&nbsp;</p>

    <div class="form-group text-center col-md-12">
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##FF0000; border: ##FF0000;" type="submit">Delete</button>
    </div>
</form>

<!--- 
Modifications based on standards:
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Avoided using `#` symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used double pound signs `##` for hex color codes to avoid interpretation as variables.
--->