<!--- This ColdFusion page processes form data for updating audition records and returns a JSON response. --->
<cfparam name="form.recordId" default="">
<cfparam name="form.projDate" default="">
<cfparam name="form.projName" default="">
<cfparam name="form.audRoleName" default="">
<cfparam name="form.audCatName" default="">
<cfparam name="form.audSubCatName" default="">
<cfparam name="form.audSource" default=""> <!--- Standardized variable casing --->
<cfparam name="form.cdFirstName" default=""> <!--- Standardized variable casing --->
<cfparam name="form.cdLastName" default=""> <!--- Standardized variable casing --->
<cfparam name="form.callbackYN" default="N"> <!--- Standardized variable casing --->
<cfparam name="form.redirectYN" default="N"> <!--- Standardized variable casing --->
<cfparam name="form.pinYN" default="N"> <!--- Standardized variable casing --->
<cfparam name="form.bookedYN" default="N"> <!--- Standardized variable casing --->
<cfparam name="form.projDescription" default="">
<cfparam name="form.charDescription" default="">
<cfparam name="form.note" default="">
<cfparam name="form.status" default="">
<cfparam name="form.audSubCatId" default="0"> <!--- Standardized variable casing --->

<cfset response = StructNew()>

<!--- Check if a record ID is provided --->
<cfif len(form.recordId)>
    <cfinclude template="/include/qry/find_313_1.cfm">
    <!--- Check if the query returned a record --->
    <cfif find.recordCount gt 0>
        <cfinclude template="/include/qry/update_record_313_2.cfm">
        <cfset isFix = "Y"> <!--- Standardized variable casing --->
        <cfinclude template="/include/transfer_audition.cfm">
        <cfset response.success = true>
        <cfset response.message = "Record updated successfully.">
    <cfelse>
        <cfset response.success = false>
        <cfset response.message = "Category or Subcategory not found.">
    </cfif>
<cfelse>
    <cfset response.success = false>
    <cfset response.message = "No record ID provided.">
</cfif>

<cfheader name="Content-Type" value="application/json" charset="utf-8">
<cfoutput>SerializeJSON(response)</cfoutput> <!--- Removed unnecessary # symbols --->
<!--- Changes: Standardized variable names and casing, removed unnecessary # symbols around variable outputs, maintained consistent and efficient conditional logic --->