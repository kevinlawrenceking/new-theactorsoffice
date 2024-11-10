<!--- This ColdFusion page processes updates to a record and logs changes. --->
<cfinclude template="rpg_load.cfm" />

<cfparam name="oldValue" default="" />
<cfparam name="recordName" default="" />
<cfparam name="newValue" default="" />
<cfparam name="updateName" default="" />
<cfparam name="recId" default="0" />
<cfparam name="updateDetails" default="" />
<cfparam name="loginName" default="" />
<cfparam name="isDeleted" default="0" />
<cfparam name="newIsDeleted" default="0" />
<cfparam name="t1" default="0" />
<cfparam name="t2" default="0" />
<cfparam name="t3" default="0" />
<cfparam name="t4" default="0" />
<cfparam name="contactId" default="0" />

<!--- Set user and company parameters for output --->
<cfparam name="userId" default="#userid#" />
<cfparam name="compId" default="#rpg_compid#" />
<cfparam name="compTable" default="#rpg_comptable#" />
<cfparam name="recName" default="#fid#" />
<cfparam name="compName" default="#rpg_compname#" />

<!--- Loop through rpgupdate query to process each record --->
<cfloop query="rpgupdate">
    <cfif rpgupdate.fname is not fid>
        <cfset fname = rpgupdate.Fname />
        <cfset ftype = rpgupdate.ftype />

        <cfif ftype is "integer">
            <cfset fsqltype = "CF_SQL_INTEGER" />
        <cfelseif ftype is "text">
            <cfset fsqltype = "CF_SQL_VARCHAR" />
        <cfelseif ftype is "date">
            <cfset fsqltype = "CF_SQL_DATE" />
        <cfelseif ftype is "datetime">
            <cfset fsqltype = "CF_SQL_TIMESTAMP" />
        <cfelseif ftype is "time">
            <cfset fsqltype = "CF_SQL_TIME" />
        <cfelseif ftype is "bit">
            <cfparam name="new_#FNAME#" default="0" />
            <cfset fsqltype = "CF_SQL_BIT" />
        </cfif>

        <cfinclude template="/include/qry/FindOld_266_1.cfm" />

        <cfset recordName = FindOld.recordName />
        <cfset newValue = EVALUATE('new_#FNAME#') />
        <cfset oldValue = FindOld.oldValue />
        <cfset updatedName = rpgupdate.updateName />

        <cfset updateUserName = updateUserName />

        <cfif oldvalue is "">
            <cfset oldvalue = "NULL" />
        </cfif>
        
        <cfif newvalue is "">
            <cfset newvalue = "NULL" />
        </cfif>

        <cfset updateDetails = "<span style='color: ##406E8E;font-weight:400;'>#oldvalue#</span> to <span style='color: ##406E8E;font-weight:400;'>#newvalue#</span>" />

        <cfif oldvalue neq newvalue>
            <cfif newvalue is not "NULL">
                <!--- Update the compTable --->
                <cfinclude template="/include/qry/update_266_2.cfm" />

                <!--- Insert into updatelog --->
                <cfinclude template="/include/qry/INSERT_266_3.cfm" />
            </cfif>
        </cfif>
    </cfif>
</cfloop>

<cfif isdefined('dbug')>
    <cfabort>
</cfif>

<cfif details_pgid is not "">
    <cfinclude template="/include/qry/Finddetails_266_4.cfm" />
    <cfset returnPage = "/app/#Finddetails.pgdir#/?recid=#details_recid#&contactid=#contactid#&t1=#t1#&t2=#t2#&t3=#t3#&t4=#t4#" />
<cfelse>
    <cfset returnPage = "/app/#rpg_compDir#/?recid=#recid#&contactid=#contactid#&t1=#t1#&t2=#t2#&t3=#t3#&t4=#t4#" />
</cfif>

<cflocation url="#returnPage#" />

<!--- Changes made: 
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Avoided using `#` symbols within conditional checks unless essential.
4. Removed `cftry` and `cfcatch` blocks entirely.
5. Used double pound signs `##` for hex color codes to avoid interpretation as variables.
--->