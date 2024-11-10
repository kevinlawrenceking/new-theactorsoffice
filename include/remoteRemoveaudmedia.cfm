<!--- This ColdFusion page confirms the removal of a media item and processes the deletion request. --->
<cfinclude template="/include/qry/audmedia_details_226_1.cfm" />

<center>Are you sure you want<BR>to remove <strong>#audmedia_details.mediaType#: #audmedia_details.medianame#</strong>?</center>

<p></p>

<!--- Prepare the SQL delete query for the media item. --->
<cfsavecontent variable="deleteQuery">
    DELETE FROM audmedia_auditions_xref WHERE mediaid = #mediaid# AND audprojectid = #audprojectid#
</cfsavecontent>

<!--- Form to confirm and submit the deletion of the media item. --->
<form action="/include/remoteRemoveaudMedia2.cfm" method="post" class="needs-validation" novalidate>
    <input type="hidden" name="mediaid" value="#mediaid#" />
    <input type="hidden" name="audprojectid" value="#audprojectid#" />
    <input type="hidden" name="secid" value="#secid#" />
    <input type="hidden" name="deleteQuery" value="#deleteQuery#" />

    <p>&nbsp;</p>

    <div class="form-group text-center col-md-12">
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##FF0000; border: ##FF0000" type="submit">Remove</button>
    </div>
</form>

<!--- Changes made:
1. Removed unnecessary cfoutput tags around variable outputs.
2. Standardized variable names and casing.
3. Ensured consistent attribute quoting, spacing, and formatting.
4. Used double pound signs for hex color codes to avoid interpretation as variables.
--->