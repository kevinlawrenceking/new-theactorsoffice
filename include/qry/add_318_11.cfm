<!--- This ColdFusion page updates the pnid for a specific sitetypeid in the sitetypes_user table. --->

<cfquery name="add"> 
    <!--- Update the pnid for the specified sitetypeid in the sitetypes_user table --->
    update sitetypes_user
    set pnid = #new_pnid# 
    where sitetypeid = #new_sitetypeid#
</cfquery>
