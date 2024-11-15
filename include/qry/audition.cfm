<!--- <CFINCLUDE template="/include/projdate_fix_user.cfm" /> --->

<!-- Set default variables -->
<cfparam name="focusid" default="" />
<cfparam name="ctaction" default="" />
<cfparam name="new_contactid" default="" />
<cfparam name="eventid" default="0" />
<cfparam name="secid" default="176" />

<!-- Consolidate submitsitefix into the main update -->
<cfinclude template="/include/qry/submitsitefix_368_1.cfm" />

<!-- Fetch project details -->
<cfinclude template="/include/qry/projectDetails_368_2.cfm" />

<cfset audroleid = projectDetails.audroleid />

<!-- Fetch role details -->
<cfinclude template="/include/qry/roleDetails_368_3.cfm" />

<!-- Delete referral contacts -->
<cfinclude template="/include/qry/delete_ref_368_4.cfm" />

<!-- Fetch and consolidate event queries -->
<cfinclude template="/include/qry/events_368_5.cfm" />

<!-- Fetch no-booking events -->
<cfinclude template="/include/qry/events_nobooking_368_6.cfm" />

<!-- Handle delete contact action -->
<cfif ctaction is "deleteContact">
    <cfinclude template="/include/qry/delete_368_7.cfm" />

    <cfinclude template="/include/qry/delete2_368_8.cfm" />
</cfif>

<!-- Check for projects and contact id -->
<cfinclude template="/include/qry/cdcheck_368_9.cfm" />

<cfif cdcheck.contactid is "99999999">
    <cfloop query="cdcheck">
        <cfinclude template="/include/qry/add_cd_368_10.cfm" />
    </cfloop>
</cfif>

<cfinclude template="/include/qry/audageranges_audtion_xref_368_11.cfm" />

