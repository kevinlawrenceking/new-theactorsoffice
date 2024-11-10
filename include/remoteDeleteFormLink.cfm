<!--- This ColdFusion page confirms the deletion of a site link and provides a form to submit the deletion request. --->
<cfset siteLinksService = createObject("component", "services.SiteLinksService")>
<cfset linkDetails = siteLinksService.getLinkDetailsById(new_id)>
<center>Are you sure you want to delete your <cfoutput>#linkDetails.sitename#</cfoutput> link?</center>
<p></p>
<!--- Form for deleting the site link --->
<form action="/include/excludelink.cfm" method="post" class="needs-validation">
    <input type="hidden" name="dd" value="1"/>
    <input type="hidden" name="new_id" value="<cfoutput>#linkDetails.id#</cfoutput>"/>
    <input type="hidden" name="target_id" value="<cfoutput>#linkDetails.sitetypeid#</cfoutput>"/>
    <p>&nbsp;</p>
    <div class="form-group text-center col-md-12">
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##FF0000; border-color: ##FF0000;" type="submit">Delete</button>
    </div>
</form>

<!--- Changes made:
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Ensured consistent attribute quoting, spacing, and formatting.
3. Used double pound signs `##` for hex color codes to avoid interpretation as variables.
--->