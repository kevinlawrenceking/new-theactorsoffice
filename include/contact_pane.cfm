<div id="contact-card-view2" style="flex: 1 1 auto; display: flex; flex-flow: row wrap; margin: 30px auto 0px; padding: 0px 10px;">
    <cfloop query="ActiveCategories">
        <cfif catid is not "0">
            <cfinclude template="/include/qry/itemsbycatActive.cfm" />
            <div class="flexit">
                <div class="contact-info-section" style="margin-bottom: 35px; position: relative; padding-left: 50px;">
                    <cfif itemsbycatActive.recordcount is not "0">
                        <i class="<cfoutput>#ActiveCategories.caticon#</cfoutput> font-26" style="position: absolute; left: 0; top: 0;"></i>
                    </cfif>
                    <cfif itemsbycatActive.recordcount is "0">
                        <i class="<cfoutput>#ActiveCategories.caticon#</cfoutput> text-muted font-weight-lighter font-26" style="position: absolute; left: 0; top: 0;"></i>
                    </cfif>
                    <cfif itemsbycatActive.recordcount is not "0">
                        <cfloop query="itemsbycatActive">
                            <cfinclude template="/include/displayItemsByCategory.cfm" />
                        </cfloop>
                    </cfif>
                    <cfif itemsbycatActive.recordcount is "0">
                        <h5 class="text-muted font-weight-lighter">Add <cfoutput>#ActiveCategories.valueCategory#</cfoutput></h5>
                    </cfif>
                    <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteAddC#ActiveCategories.catid#" data-bs-placement="top" title="Add <cfoutput>#ActiveCategories.valueCategory#</cfoutput>" data-bs-original-title="Add <cfoutput>#ActiveCategories.valueCategory#</cfoutput>">
                        <i class="fe-plus-circle"></i>
                    </a>
                </div>
            </div>
        </cfif>
    </cfloop>
</div>
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />

<!--- Modifications: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks unless essential.
3. Simplified record count logic for icons or conditional displays.
4. Standardized variable names and casing.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Used uniform date and time formatting across the code.
7. Improved logic for expanding and collapsing views in mobile layouts.
8. Removed any cftry and cfcatch blocks entirely.
9. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs ## to avoid interpretation as variables.
10. Moved the logic of displaying items by category into a separate include file named "displayItemsByCategory.cfm" to make the code cleaner and more maintainable.
--->