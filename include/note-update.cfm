<!--- This ColdFusion page handles the display and update of notes related to contacts, including relationships and visibility options. --->
<cfparam name="rContactId" default="0" />
<cfset currentId = rContactId />
<style>
    #hidden_div { display: none; }
</style>
<cfinclude template="/include/qry/relationships_13_1.cfm" />

<div class="row">
    <div class="col-xl-6 col-lg-8 col-md-12">
        <div class="card">
            <div class="card-body">
                <h4><cfoutput>#details.fullName#</cfoutput></h4>
                <!--- Form for updating notes --->
                <cfform method="post" action="/include/note-update2.cfm" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
                    <input type="hidden" name="returnurl" value="<cfoutput>#returnurl#</cfoutput>">
                    <input type="hidden" name="rContactId" value="<cfoutput>#rContactId#</cfoutput>">
                    <input type="hidden" name="userId" value="<cfoutput>#session.userId#</cfoutput>">
                    <input type="hidden" name="noteId" value="<cfoutput>#noteId#</cfoutput>">

                    <!--- JavaScript for selectize functionality --->
                    <script>
                        $(document).ready(function() {
                            $("#select-relationship").selectize({
                                persist: false,
                                createOnBlur: true,
                                create: true,
                                plugins: ["remove_button"],
                                delimiter: ",",
                                create: function(input) {
                                    return {
                                        value: input,
                                        text: input,
                                    };
                                },
                            });
                        });
                    </script>

                    <cfif isdefined('sdfsdfdsf')>
                        <!--- Relationships --->
                        <cfinclude template="/include/relationships.cfm" />
                    </cfif>

                    <!--- Visibility and Event Connection --->
                    <cfinclude template="/include/visibility_and_event_connection.cfm" />

                    <div class="row mt-2">
                        <div class="col-6"></div>
                        <div class="col-6 text-right">
                            <a href="javascript:history.go(-1)">
                                <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button>
                            </a>
                            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Update</button>
                        </div>
                    </div>
                </cfform>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $(".parsley-examples").parsley();
    });
</script>

<cfset scriptNameInclude="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />

<!--- Changes were made according to the following rules:
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