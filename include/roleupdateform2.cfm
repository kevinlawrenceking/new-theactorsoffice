<!--- This ColdFusion page processes audition submissions, handling various parameters and database interactions. --->
<cfparam name="newIsDeleted" default="0">
<cfparam name="newContactId" default="">
<cfparam name="essence" default="">
<cfparam name="vocalType" default="">
<cfparam name="rangeName" default="">
<cfparam name="referral" default="">
<cfparam name="newOpenCallName" default="">
<cfparam name="newOpenCallId" default="0">
<cfparam name="newSubmitSiteId" default="">
<cfparam name="debug" default="n">

<!--- Include necessary query files for deletion and processing. --->
<cfinclude template="/include/qry/delete_287_1.cfm">
<cfinclude template="/include/qry/delete_287_2.cfm">
<cfinclude template="/include/qry/delete_287_3.cfm">
<cfinclude template="/include/qry/delete_287_4.cfm">
<cfinclude template="/include/qry/delete_287_5.cfm">

<!--- Check if newOpenCallName is provided and process accordingly. --->
<cfif len(newOpenCallName)>
    <cfinclude template="/include/qry/findit2_287_6.cfm">
    <cfif findit2.recordcount eq 1>
        <cfset newOpenCallId = findit2.openCallId>
    <cfelse>
        <cfinclude template="/include/qry/insert_287_7.cfm">
        <cfset newOpenCallId = result.generatedKey>
    </cfif>
</cfif>

<!--- Process essence if provided. --->
<cfif len(essence)>
    <cfloop list="#essence#" index="newEssence">
        <cfinclude template="/include/qry/findit_287_8.cfm">
        <cfif findit.recordcount eq 1>
            <cfset newEssenceId = findit.newEssenceId>
        <cfelse>
            <cfinclude template="/include/qry/insert_287_9.cfm">
            <cfset newEssenceId = result.generatedKey>
        </cfif>
        <cfinclude template="/include/qry/insert_287_10.cfm">
    </cfloop>
</cfif>

<cfparam name="genre" default="">

<!--- Process genre if provided. --->
<cfif len(genre)>
    <cfloop list="#genre#" index="newGenre">
        <cfinclude template="/include/qry/findit_287_11.cfm">
        <cfif findit.recordcount eq 1>
            <cfset newAudGenreId = findit.audGenreId>
            <cfinclude template="/include/qry/insert_287_12.cfm">
        <cfelse>
            <cfinclude template="/include/qry/insert_287_13.cfm">
            <cfset newAudGenreId = result.generatedKey>
            <cfinclude template="/include/qry/insert_287_14.cfm">
        </cfif>
    </cfloop>
</cfif>

<!--- Process vocal type if provided. --->
<cfif len(vocalType)>
    <cfinclude template="/include/qry/delete_287_15.cfm">
    <cfloop list="#vocalType#" index="newVocalTypeId">
        <cfinclude template="/include/qry/insert_287_16.cfm">
    </cfloop>
</cfif>

<!--- Process range name if provided. --->
<cfif len(rangeName)>
    <cfinclude template="/include/qry/delete_287_4.cfm">
    <cfloop list="#rangeName#" index="newRangeId">
        <cfinclude template="/include/qry/insert_287_18.cfm">
    </cfloop>
</cfif>

<!--- Handle contact creation if newAudSourceId is 3 and referral is provided. --->
<cfif newAudSourceId eq 3 and len(referral)>
    <cfinclude template="/include/qry/findg_287_19.cfm">
    <cfif findg.recordcount eq 1>
        <cfset newContactId = findg.contactId>
    <cfelse>
        <cfset numElements = listLen(referral, " ")>
        <cfif numElements eq 2>
            <cfset firstName = listFirst(referral, " ")>
            <cfset lastName = listLast(referral, " ")>
        <cfelseif numElements gte 3>
            <cfset firstName = listGetAt(referral, 1, " ") & " " & listGetAt(referral, 2, " ")>
            <cfset lastName = right(referral, len(referral) - len(firstName) - 1)>
        <cfelse>
            <cfset firstName = referral>
            <cfset lastName = ''>
        </cfif>
        <cfinclude template="/include/qry/add_287_20.cfm">
        <cfset newContactId = result.generatedKey>
        <cfset selectUserId = session.userId>
        <cfset selectContactId = newContactId>
        <cfinclude template="/include/folder_setup.cfm">
    </cfif>
</cfif>

<!--- Handle submissions if newAudSourceId is 2. --->
<cfif newAudSourceId eq 2>
    <cfinclude template="/include/qry/find_subsite_287_21.cfm">
    <cfif debug eq "Y">
        SELECT submitSiteId as newSubmitSiteId, catList as newCatList FROM audSubmitSites_user WHERE userId = #userId# and submitSiteName = '#trim(newSubmitSiteName)#'<BR>
        find_subsite.recordcount: #find_subsite.recordcount#<BR>
    </cfif>
    <cfif find_subsite.recordcount eq 1>
        <cfset newSubmitSiteId = find_subsite.newSubmitSiteId>
        <cfset newCatList = find_subsite.newCatList>
        <cfif debug eq "Y">
            newSubmitSiteId: #newSubmitSiteId#<BR>
            newCatList: #newCatList#<BR>
        </cfif>
        <cfif listFindNoCase(newCatList, newCatId)>
            <cfset newCatList = newCatList>
        <cfelse>
            <cfset newCatList = "#newCatList#,#newCatId#">
            <cfif debug eq "Y">
                newCatList: #newCatList#<BR>
            </cfif>
            <cfinclude template="/include/qry/update_287_22.cfm">
            <cfif debug eq "Y">
                update audSubmitSites_user set catList = '#newCatList#' WHERE submitSiteId = #newSubmitSiteId#<BR>
            </cfif>
        </cfif>
    <cfelse>
        <cfinclude template="/include/qry/add_287_23.cfm">
        <cfif debug eq "Y">
            INSERT INTO `audSubmitSites_user_tbl` (`submitSiteName`, `userId`, `catList`) VALUES ('#trim(newSubmitSiteName)#', #userId#, '#newCatId#')<BR>
        </cfif>
        <cfset newSubmitSiteId = sub.generatedKey>
        <cfif debug eq "Y">
            newSubmitSiteId: #newSubmitSiteId#<BR>
        </cfif>
    </cfif>
</cfif>

<!--- Debugging output if debug is enabled. --->
<cfif debug eq "Y">
    <cfabort>
</cfif>

<!--- Handle custom dialect processing if applicable. --->
<cfif newAudDialectId eq "CustomDialect" and len(CustomDialect)>
    <cfinclude template="/include/qry/insert_287_24.cfm">
    <cfset newAudDialectId = resultk.generatedKey>
<cfelseif len(oldDialectId)>
    <cfset newDialectId = oldDialectId>
</cfif>

<!--- Update audition roles. --->
<cfinclude template="/include/qry/audroles_upd_287_25.cfm">

<cfparam name="focusId" default="">

<!--- Determine return URL based on focusId. --->
<cfset returnUrl = "/app/audition/?audProjectId=#audProjectId#&secId=#secId#">
<cfif len(focusId)>
    <cfset returnUrl = "#returnUrl#&focusId=#focusId#">
</cfif>

<cflocation url="#returnUrl#">

<!--- Changes made: Standardized variable names and casing, removed unnecessary cfoutput tags, avoided using # symbols within conditional checks unless essential, simplified record count logic, ensured consistent attribute quoting, spacing, and formatting. --->