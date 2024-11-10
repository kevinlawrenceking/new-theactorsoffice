<!--- This ColdFusion page confirms the deletion of a media item and processes the deletion request. --->
<cfinclude template="/include/qry/audmedia_details_226_1.cfm" />

<center> 
    Are you sure you want<BR>to delete 
    <strong>#audmedia_details.mediaType#: #audmedia_details.medianame#</strong>? 
</center> 

<p></p> 

<!--- Save the delete query in a variable for later use. --->
<cfsavecontent variable="deleteQuery"> 
    update audmedia set IsDeleted = 1 WHERE mediaid = #mediaid# 
</cfsavecontent> 

<!--- Form to confirm deletion of the media item. --->
<form action="/include/remoteDeleteaudMedia2.cfm" method="post" class="needs-validation" novalidate>

    <input type="hidden" name="mediaid" value="#mediaid#" />
    <input type="hidden" name="secid" value="#secid#" />
    <input type="hidden" name="deleteQuery" value="#deleteQuery#" />

    <p>&nbsp;</p> 

    <div class="form-group text-center col-md-12"> 
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##FF0000; border: ##FF0000" type="submit">Delete</button> 
    </div> 

</form>

<!--- Changes: Standardized variable names and casing (Rule 5). Removed unnecessary cfoutput tags (Rule 2). Used double pound signs for hex color codes (Rule 10). --->