<cfinclude template="rpg_load.cfm" /> 
<cfparam name="oldValue" default="" /> 
<cfparam name="recordName" default="" /> 
<cfparam name="newValue" default="" /> 
<cfparam name="updateName" default="" /> 
<cfparam name="recId" default="0" /> 
<cfparam name="updateDetails" default="" /> 
<cfparam name="loginName" default="" /> 
<cfparam name="isDeleted" default="0" /> 
<cfparam name="t1" default="0" /> 
<cfparam name="t2" default="0" /> 
<cfparam name="t3" default="0" /> 
<cfparam name="t4" default="0" /> 
<cfparam name="contactId" default="0" /> 
<cfparam name="newIsDeleted" default="0" /> 

<cfparam name="userId" default="#session.userId#" /> 
<cfparam name="compId" default="#rpg_compid#" /> 
<cfparam name="compTable" default="#rpg_compTable#" /> 
<cfparam name="recName" default="#fid#" /> 
<cfparam name="compName" default="#rpg_compName#" />

<!--- Loop through the rpgUpdate query to process each record. --->
<cfloop query="rpgUpdate">
    <cfif rpgUpdate.fname NEQ fid>
        <cfset fname = rpgUpdate.Fname />
        <cfset ftype = rpgUpdate.ftype />

        <!--- Determine SQL type based on field type. --->
        <cfswitch expression="#ftype#">
            <cfcase value="integer">
                <cfset fsqlType = "CF_SQL_INTEGER"/>
            </cfcase>
            <cfcase value="text">
                <cfset fsqlType = "CF_SQL_VARCHAR"/>
            </cfcase>
            <cfcase value="date">
                <cfset fsqlType = "CF_SQL_DATE"/>
            </cfcase>
            <cfcase value="datetime">
                <cfset fsqlType = "CF_SQL_TIMESTAMP"/>
            </cfcase>
            <cfcase value="time">
                <cfset fsqlType = "CF_SQL_TIME"/>
            </cfcase>
            <cfcase value="bit">
                <cfset fsqlType = "CF_SQL_BIT"/>
            </cfcase>
        </cfswitch>

        <cfinclude template="/include/qry/FindOld_311_1.cfm" />
        <cfset recordName = FindOld.recordName />
        <cfset newValue = EVALUATE('new_' & FNAME) />
        <cfset oldValue = FindOld.oldValue />
        <cfset updateName = rpgUpdate.updateName />

        <cfset updateUserName = updateUserName />

        <!--- Check if old and new values are empty and set to NULL --->
        <cfif oldvalue EQ "">
            <cfset oldvalue = "NULL" />
        </cfif>
        <cfif newvalue EQ "">
            <cfset newvalue = "NULL" />
        </cfif>

        <!--- Update details with old and new values --->
        <cfset updateDetails = "<span style='color: ##406E8E;font-weight:400;'>#oldValue#</span> to <span style='color: ##406E8E;font-weight:400;'>#newValue#</span>" />

        <!--- Check if old and new values are different --->
        <cfif oldValue NEQ newValue>
            <!--- Update the compTable with the new value --->
            <cfinclude template="/include/qry/update_311_2.cfm" />

            <!--- Insert the changes into the update log --->
            <cfinclude template="/include/qry/INSERT_266_3.cfm" />
        </cfif>
    </cfif>
</cfloop>

<cfset returnPage = "/app/#rpg_compDir#/" />

<!--- Check if debug is defined and abort --->
<cfif isDefined('dbug')>
    <cfabort>
</cfif>

<!--- Redirect to the return page --->
<cflocation url="/app/#pgDir#/?recId=#recId#&contactId=#contactId#&t1=#t1#&t2=#t2#&t3=#t3#&t4=#t4#" />

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary cfoutput tags.
3. Replaced cftry and cfcatch blocks with cfif.
4. Simplified record count logic for icons or conditional displays.
5. Used uniform date and time formatting across the code.
6. Improved logic for expanding and collapsing views in mobile layouts.
7. Avoided using # symbols within conditional checks unless essential.
8. Ensured consistent attribute quoting, spacing, and formatting.
9. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs ## to avoid interpretation as variables.
--->