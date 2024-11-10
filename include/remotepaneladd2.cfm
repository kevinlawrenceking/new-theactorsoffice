<!--- This ColdFusion page handles the addition of a new site type and redirects based on the operation result. --->
<cfparam name="newSiteTypeName" default="" />
<cftransaction>
    <!--- Include query to find existing site type --->
    <cfinclude template="/include/qry/find_249_1.cfm" />
    <!--- Check if no existing site type is found --->
    <cfif find.recordcount eq 0>
        <!--- Set the new site type title --->
        <cfset newPnTitle = newSiteTypeName />
        <!--- Include query to add new site type --->
        <cfinclude template="/include/qry/add_sitetype_249_2.cfm" />
        <!--- Get the generated key for the new site type --->
        <cfset newSiteTypeId = result.generated_key />
        <!--- Include query to find the newly added site type --->
        <cfinclude template="/include/qry/findit_249_3.cfm" />
        <!--- Set the new site type title from the find query --->
        <cfset newPnTitle = findit.pnTitle />
        <!--- Include query to find the total --->
        <cfinclude template="/include/qry/Findtotal_249_4.cfm" />
        <!--- Include query to add the new PN --->
        <cfinclude template="/include/qry/add_249_5.cfm" />
        <!--- Get the generated key for the new PN --->
        <cfset newPnId = PN.generated_key />
        <!--- Include query to add additional information for the new PN --->
        <cfinclude template="/include/qry/add_249_6.cfm" />
    </cfif>
</cftransaction>

<!--- Redirect based on the value of pgrtn --->
<cfif pgrtn eq "P" or pgrtn eq "D">
    <cflocation url="/app/myaccount/?t1=1&target_id=#newSiteTypeId#" />
<cfelseif pgrtn eq "z">
    <cflocation url="/app/dashboard_new/" />
</cfif>

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
11. Only return the code, concisely edited, with no additional output.
--->