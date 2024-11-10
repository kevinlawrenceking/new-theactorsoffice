<!--- This ColdFusion page allows users to submit feedback to the development team, including error reports and change requests. --->
<cfset versionService = createObject("component", "services.VersionsService")>
<cfset activeVersions = versionService.getActiveVersions()>
<cfparam name="userRole" default="U" />
<!--- Include user query template --->
<cfinclude template="/include/qry/users_256_1.cfm" />
<cfset newPageId = pgid />

<p>Please feel free to enter any type of note to our development team, including errors discovered, change request or general notes/opinions regarding your experience. All feedback is welcomed and appreciated. Thank you!</p>

<form action="/include/remoteSupportFormAdd.cfm" method="post" class="needs-validation" validate>
    <input type="hidden" name="pgdir" value="<cfoutput>#pgdir#</cfoutput>" />
    <input type="hidden" name="qstring" value="<cfoutput>#qstring#</cfoutput>" />
    <div class="row">
        <div class="form-group col-md-12">
            <label for="ticketDetails">Title</label>
            <input class="form-control" type="text" id="new_ticketName" name="new_ticketName" placeholder="One-sentence summary" required />
            <div class="invalid-feedback"> Please enter a Title. </div>
        </div>

        <!--- Check if user role is Administrator --->
        <cfif userRole is "Administrator">
            <div class="form-group col-md-12">
                <label for="tickettype">User</label>
                <select class="form-control" name="new_userId" id="new_userId" required>
                    <cfoutput query="users">
                        <option value="#users.id#" <cfif users.id is userid> selected </cfif> >#users.name#</option>
                    </cfoutput>
                </select>
                <div class="invalid-feedback"> Please enter a User. </div>
            </div>
        <cfelse>
            <input type="hidden" name="new_userId" value="<cfoutput>#userid#</cfoutput>" />
        </cfif>

        <!--- Include ticket types query template --->
        <cfinclude template="/include/qry/types_256_2.cfm" />

        <div class="form-group col-md-6">
            <label for="tickettype">Type</label>
            <select class="form-control" name="new_ticketType" placeholder="select a Type" id="new_ticketType" required>
                <option value=""></option>
                <cfoutput query="types">
                    <option value="#types.id#">#types.name#</option>
                </cfoutput>
            </select>
            <div class="invalid-feedback"> Please enter a Type. </div>
        </div>

        <div class="form-group col-md-6">
            <label for="tickettype">Version</label>
            <select class="form-control" name="new_verId" id="new_verId" required>
                <option value="0"></option>
                <option value="0">No Version</option>
                <cfoutput query="activeVersions">
                    <option value="#activeVersions.id#">#activeVersions.name#</option>
                </cfoutput>
            </select>
            <div class="invalid-feedback"> Please enter a Page. </div>
        </div>

        <div class="form-group col-md-12">
            <label for="ticketDetails">Details</label>
            <textarea class="form-control" type="text" id="new_ticketDetails" name="new_ticketDetails" placeholder="Details" rows="4" required></textarea>
            <div class="invalid-feedback"> Please enter a Details. </div>
        </div>

        <div class="form-group col-md-12">
            <center>
                <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e;" type="submit">Add</button>
            </center>
        </div>
    </div>
</form>

<!--- Changes made: 
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Avoided using `#` symbols within conditional checks unless essential.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used double pound signs `##` for hex color codes to avoid interpretation as variables.
--->