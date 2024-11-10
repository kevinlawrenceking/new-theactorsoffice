<!--- This ColdFusion page displays toast notifications based on the presence of data in the 'toasts' query. --->
<cfinclude template="/include/qry/toasts_306_1.cfm" />
<cfinclude template="/include/qry/toastmenu_306_2.cfm" />

<!--- Check if 'bringtoast' is defined --->
<cfif isDefined('bringtoast')>

    <!--- Check if there are any records in the 'toasts' query --->
    <cfif toasts.recordCount gt 0>

        <div aria-live="polite" aria-atomic="true" data-delay="2000" style="z-index: 99">
            <div style="position: absolute; top: 4.5rem; right: 0;">

                <!--- Loop through each record in the 'toasts' query --->
                <cfloop query="toasts">
                    <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true" data-bs-toggle="toast">
                        <div class="toast-header">
                            <img src="#application.imagesUrl#/logo-sm.png" alt="brand-logo" height="12" class="mr-1" />
                            <strong class="mr-auto">#notiftitle#</strong>
                            <button type="button" class="ml-2 mb-1 close" data-bs-dismiss="toast" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="toast-body">
                            <a href="#notifurl#">
                                <small class="text-muted">#subtitle#</small>
                            </a>
                            <br/>
                            <center>
                                <a href="#notifurl#">
                                    <small class="text-muted"><i class="mdi mdi-square-edit-outline"></i></small>
                                </a>
                            </center>
                        </div>
                    </div>
                </cfloop>

            </div>
        </div>

    </cfif>

</cfif>

<!--- Changes: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Simplified record count logic for icons or conditional displays.
4. Standardized variable names and casing.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Removed cftry and cfcatch blocks entirely.
7. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables, used double pound signs ## to avoid interpretation as variables.
--->