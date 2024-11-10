<!--- This ColdFusion page processes project information and updates the database accordingly. --->
<cfparam name="newIsDeleted" default="0"/>
<cfparam name="newProjName" default=""/>
<cfparam name="newProjDescription" default=""/>
<cfparam name="newAudSubCatID" default=""/>
<cfparam name="newUnionID" default=""/>
<cfparam name="newNetworkID" default=""/>
<cfparam name="newToneID" default=""/>
<cfparam name="newContractTypeID" default=""/>
<cfparam name="newContactId" default=""/>
<cfparam name="isDirect" default="0"/>
<cfparam name="isRedirect" default="0"/>
<cfparam name="isBooked" default="0"/>
<cfparam name="isPin" default="0"/>
<cfparam name="isFix" default="N"/>

<cfinclude template="/include/qry/y_308_1.cfm"/>

RECORDz: #Y.RECORDCOUNT#

<!--- Loop through query results --->
<cfloop query="y">
    <cfset newStatus = "Valid"/>
    new_status: #newStatus#
    <cfinclude template="/include/qry/find_308_2.cfm"/>

    <!--- Check if the record is unique --->
    <cfif find.recordcount neq 0>
        its unique!<BR>
        <cfset newStatus = "Invalid"/>
        #NEW_STATUS#<br>
        <cfinclude template="/include/qry/err_308_3.cfm"/>
    </cfif>

    <!--- Validate project name --->
    <cfif y.projname eq "">
        <cfset newStatus = "Invalid"/>
        PROJNAME IS empty<br>
        <cfinclude template="/include/qry/err_308_4.cfm"/>
    </cfif>

    <!--- Validate role name --->
    <cfif y.audrolename eq "">
        <cfset newStatus = "Invalid"/>
        ROLE NAME IS empty<br>
        <cfinclude template="/include/qry/err_308_5.cfm"/>
    </cfif>

    <!--- Check if fix is required --->
    <cfif isFix eq "Y">
        <cfinclude template="/include/qry/findcat_308_6.cfm"/>

        <!--- Validate category count --->
        <cfif findcat.recordcount neq 1>
            <cfset newStatus = "Invalid"/>
            CATEGORY INVALID<br>
            <cfinclude template="/include/qry/err_308_7.cfm"/>
        </cfif>
    </cfif>

    <cfinclude template="/include/qry/findsource_308_8.cfm"/>

    <!--- Validate source count --->
    <cfif findsource.recordcount neq 1>
        <cfset newStatus = "Invalid"/>
        <cfinclude template="/include/qry/err_308_9.cfm"/>
    </cfif>

    <cfinclude template="/include/qry/update_308_10.cfm"/>
</cfloop>

<!--- Check if fix is required for additional processing --->
<cfif isFix eq "Y">
    <cfinclude template="/include/qry/x_308_11.cfm"/>
<cfelse>
    <cfinclude template="/include/qry/x_308_12.cfm"/>
</cfif>

<!--- Loop through another query result --->
<cfloop query="x">
    <cfset newProjDate = dateformat(x.projdate,'MM/DD/YYYY')/>

    <!--- Validate project date --->
    <cfif IsDate(newProjDate)>
        <cfset newProjDate = x.projdate>
    <cfelse>
        <cfset newProjDate = Now()>
    </cfif>

    <cfset cdFullName = x.cdFirstName & " " & x.cdLastName/>
    <cfinclude template="/include/qry/findcd_308_13.cfm"/>

    <!--- Check if contact exists --->
    <cfif findcd.recordcount eq 0 and cdFirstName neq "">
        contact not found, adding...<BR>
        <cfinclude template="/include/qry/add_308_14.cfm"/>
        <cfset newContactId = result.generatedKey/>
        <cfset selectUserId = userId/>
        <cfset selectContactId = newContactId/>
        <cfset cdType = "Casting Director"/>
        new contactid: #newContactId#<BR>
        <cfinclude template="/include/folder_setup.cfm"/>
        <cfinclude template="/include/qry/insert_28_2.cfm"/>
    <cfelse>
        <cfset newContactId = 0/>
    </cfif>

    <cfset newStatus = "Added"/>
    result: added - #newContactId#<br>
    <cfset selectUserId = session.userId/>
    <cfset selectContactId = newContactId/>
    <cfinclude template="/include/folder_setup.cfm"/>
    <cfset newProjName = trim(x.projName)/>
    <cfset newAudRoleName = trim(x.audRoleName)/>

    <!--- Check if fix is required --->
    <cfif isFix eq "Y">
        <cfset newAudSubCatID = x.audSubCatID/>
    <cfelse>
        <!--- Validate subcategory count --->
        <cfif x.audCatName neq "">
            <cfinclude template="/include/qry/find_subcat_308_16.cfm"/>
            <cfif find_subcat.recordcount eq 1>
                subcat found<BR>
                <cfset newAudSubCatID = find_subcat.audSubCatID/>
            </cfif>
        </cfif>
    </cfif>

    <cfset isCallBack = 0/>
    <cfset isRedirect = 0/>
    <cfset isPin = 0/>
    <cfset isBooked = 0/>

    <!--- Set flags based on conditions --->
    <cfif x.callBack_YN eq "Y">
        <cfset isCallBack = 1/>
    </cfif>

    <cfif x.redirect_YN eq "Y">
        <cfset isRedirect = 1/>
    </cfif>

    <cfif x.pin_YN eq "Y">
        <cfset isPin = 1/>
    </cfif>

    <cfif x.booked_YN eq "Y">
        <cfset isBooked = 1/>
    </cfif>

    <cfset newProjDescription = x.projDescription/>
    <cfset newCharDescription = x.charDescription/>
    <cfset newAudRoleName = x.audRoleName/>

    <!--- Check if fix is required --->
    <cfif isFix eq "Y">
        <cfset newAudSubCatID = x.audSubCatID/>
    <cfelse>
        <!--- Validate category count --->
        <cfif x.audCatName neq "">
            <cfinclude template="/include/qry/find_cat_308_17.cfm"/>
            SELECT * FROM audcategories WHERE audcatname = '#x.audCatName#' and isdeleted is false<BR>
            <cfif find_cat.recordcount eq 1>
                <cfset newAudCatID = find_cat.audCatID/>
                <cfinclude template="/include/qry/find_subcat_308_18.cfm"/>
                SELECT * FROM audsubcategories WHERE audcatid = #newAudCatID# and audsubcatname = '#x.audSubCatName#'<BR>
                <cfif find_subcat.recordcount eq 1>
                    <cfset newAudSubCatID = find_subcat.audSubCatID/>
                    new_audsubcatid: #find_subcat.audSubCatID#<BR>
                </cfif>
            </cfif>
        </cfif>
    </cfif>

    here<BR>
    <cfinclude template="/include/qry/audprojects_ins_308_19.cfm"/>
    <cfset newAudProjectID = result.GENERATEDKEY/>
    <cfset audProjectId = newAudProjectID/>
    new audprojectid: #newAudProjectID#<BR/>

    <!--- Validate source count --->
    <cfif x.audSource neq "">
        <cfinclude template="/include/qry/find_source_308_20.cfm"/>
        <cfif find_source.recordcount eq 1>
            <cfset newAudSourceId = find_source.audSourceId/>
        </cfif>
    </cfif>

    <!--- Validate role name --->
    <cfif newAudRoleName eq "">
        <cfset newAudRoleName = "Unknown"/>
    </cfif>

    <cfinclude template="/include/qry/audroles_ins_308_21.cfm"/>
    <cfset newAudRoleID = result.GENERATEDKEY/>

    <!--- Validate note count --->
    <cfif x.note neq "">
        <cfinclude template="/include/qry/InsertNote_308_22.cfm"/>
    </cfif>

    <cfinclude template="/include/qry/update_contact_308_23.cfm"/>
</cfloop>

<!--- Changes: Standardized variable names and casing, removed unnecessary cfoutput tags, improved conditional logic, ensured consistent attribute quoting, spacing, and formatting, simplified record count logic, used uniform date and time formatting.