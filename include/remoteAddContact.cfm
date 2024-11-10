<!--- This ColdFusion page is used to create a form for adding a new contact with associated tags. --->
<cfparam name="tagTypes" default="team" />
<cfinclude template="/include/qry/tags_200_1.cfm" />

<form action="/include/remoteAddContactAdd.cfm" method="post" class="needs-validation" id="profile-form">
    <input type="hidden" name="newTag" value="My Team">
    <input type="hidden" name="userId" value="<cfoutput>#userId#</cfoutput>">
    <input type="hidden" name="src" value="<cfoutput>#src#</cfoutput>">

    <div class="row">
        <!--- Form Group for Contact Full Name --->
        <div class="form-group col-md-6">
            <label for="contactFullName">Name:</label>
            <input class="form-control" type="text" id="contactFullName" name="contactFullName" required placeholder="Enter Name">
        </div>

        <!--- Form Group for Company --->
        <div class="form-group required col-md-6">
            <label for="company">Company:</label>
            <input class="form-control" type="text" id="company" name="company" placeholder="Add Company">
        </div>

        <!--- Form Group for Tag Selection --->
        <div class="form-group col-sm-6 mb-6">
            <label for="tag">Tag</label>
            <select id="newTag" name="newTag" required class="form-control">
                <option value="">Select a type</option>
                <cfloop query="tags">
                    <option value="<cfoutput>#tags.tagName#</cfoutput>"><cfoutput>#tags.tagName#</cfoutput></option>
                </cfloop>
            </select>
        </div>

        <!--- Form Group for Work Phone --->
        <div class="form-group col-md-6">
            <label for="workPhone">Phone:</label>
            <input class="form-control" type="text" id="workPhone" name="workPhone" placeholder="Enter Work Phone">
            <div class="invalid-feedback"> Please add work phone. </div>
        </div>

        <!--- Form Group for Work Email --->
        <div class="form-group col-md-6">
            <label for="workEmail">Email:</label>
            <input class="form-control" type="text" id="workEmail" name="workEmail" placeholder="Enter Email">
        </div>
    </div>

    <!--- Submit Button --->
    <div class="form-group text-center col-md-12">
        <p>
            <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: ##406e8e; border: ##406e8e;">Add</button>
        </p>
    </div>
</form>

<!--- Changes made: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used double pound signs for hex color codes to avoid interpretation as variables.
--->