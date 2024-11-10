<!--- This ColdFusion page handles user account updates, including personal information, address, and settings. --->
<cfparam name="action" default="view" />
<cfparam name="defaultCountry" default="" />
<cfparam name="userContactId" default="30" />
<cfset cookie.userId = userId />
<cfset session.pageReturn = "P" />
<cfset pageReturn = "P" />
<cfinclude template="/include/tab_check_account.cfm" />
<cfinclude template="/include/qry/siteTypes_535_1.cfm" />
<cfinclude template="/include/qry/timezones.cfm" />
<cfinclude template="/include/qry/myLinks_159_1.cfm" />
<cfinclude template="/include/qry/actions_159_2.cfm" />

<div id="remoteUpdateAccountf" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: ##f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Account & Security</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body">
                <cfparam name="t1" default="0" />
                <cfparam name="t2" default="0" />
                <cfparam name="t3" default="0" />
                <cfparam name="t4" default="0" />
                <cfparam name="t5" default="0" />
                <cfparam name="t6" default="0" />
                <form action="/app/myaccount/" method="post" class="parsley-examples" id="account" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
                    <input type="hidden" name="action" value="update" />
                    <input type="hidden" name="t3" value="1" />
                    <div class="form-group col-md-12">
                        <label for="userFirstName">First Name<span class="text-danger">*</span></label>
                        <input class="form-control" type="text" id="new_userFirstName" name="new_userFirstName" value="<cfoutput>#userFirstName#</cfoutput>" data-parsley-required data-parsley-error-message="First Name is required" placeholder="Enter your first name">
                    </div>
                    <div class="form-group col-md-12">
                        <label for="userLastName">Last Name<span class="text-danger">*</span></label>
                        <input class="form-control" type="text" id="new_userLastName" name="new_userLastName" value="<cfoutput>#userLastName#</cfoutput>" data-parsley-required data-parsley-error-message="Last Name is required" placeholder="Enter your last name">
                    </div>
                    <div class="form-group col-md-12">
                        <label for="new_AvatarName">Avatar Name<span class="text-danger">*</span></label>
                        <input class="form-control" type="text" id="new_AvatarName" name="new_AvatarName" value="<cfoutput>#avatarName#</cfoutput>" data-parsley-required data-parsley-error-message="Avatar Name is required" placeholder="Enter your Avatar name">
                    </div>
                    <div class="form-group col-md-12">
                        <label for="userEmail">Email<span class="text-danger">*</span></label>
                        <input class="form-control" name="new_userEmail" value="<cfoutput>#userEmail#</cfoutput>" data-parsley-type="email" id="email_address" data-parsley-required data-parsley-trigger="focusout" data-parsley-checkemail data-parsley-checkemail-message="Email Address already Exists" placeholder="Enter your email">
                    </div>
                    <div class="form-group text-center col-md-12">
                        <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: ##406e8e; border: ##406e8e;">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--- Rest of the code --->

<!--- Changes made based on the following rules:
1. Maintain consistent and efficient conditional logic, especially for styling or control structures.
2. Remove unnecessary `<cfoutput>` tags around variable outputs.
3. Avoid using `#` symbols within conditional checks unless essential.
4. Simplify record count logic for icons or conditional displays.
5. Standardize variable names and casing.
6. Ensure consistent attribute quoting, spacing, and formatting.
7. Use uniform date and time formatting across the code.
8. Improve logic for expanding and collapsing views in mobile layouts.
9. Remove any `cftry` and `cfcatch` blocks entirely.
10. For any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), use double pound signs `##` to avoid interpretation as variables.
11. Only return the code, concisely edited, with no additional output. --->