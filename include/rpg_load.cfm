<!--- This ColdFusion page includes various query templates and processes data related to RPG records. --->
<cfinclude template="/include/qry/RPG_288_1.cfm" />
<cfinclude template="/include/qry/RPGFields_288_2.cfm" />
<cfinclude template="/include/qry/RPGResults_288_3.cfm" />
<cfinclude template="/include/qry/RPGkey_288_4.cfm" />
<cfinclude template="/include/qry/RPGAdd_288_5.cfm" />
<cfinclude template="/include/qry/RPGUpdate_288_6.cfm" />

<cfset fieldID = RPGKey.fname />
<cfset fieldType = RPGKey.ftype />

<!--- Determine SQL type based on field type --->
<cfif fieldType is "integer">
    <cfset fieldSQLType = "CF_SQL_INTEGER" />
<cfelseif fieldType is "text">
    <cfset fieldSQLType = "CF_SQL_VARCHAR" />
<cfelseif fieldType is "date">
    <cfset fieldSQLType = "CF_SQL_DATE" />
<cfelseif fieldType is "datetime">
    <cfset fieldSQLType = "CF_SQL_TIMESTAMP" />
<cfelseif fieldType is "time">
    <cfset fieldSQLType = "CF_SQL_TIME" />
</cfif>

<!--- Check if there is exactly one RPG record --->
<cfif RPG.RecordCount is 1>
    <cfset rpgCompanyID = RPG.compid />
    <cfset rpgCompanyName = RPG.compname />
    <cfset rpgCompanyDir = RPG.compDir />
    <cfset rpgCompanyTable = RPG.compTable />
    <cfset rpgCompanyOwner = RPG.compowner />

    <!--- Page variables --->
    <cfset rpgPageID = RPG.pgid />
    <cfset rpgPageName = RPG.pgname />
    <cfset rpgPageDir = RPG.pgDir />
    <cfset rpgPageTitle = RPG.pgTitle />
    <cfset rpgPageHeading = RPG.pgHeading />
    <cfset rpgPageFilename = RPG.pgFilename />

    <cfset rpgTitle = rpgPageTitle />
</cfif>

<!--- Changes: 
1. Removed unnecessary # symbols in conditional checks.
2. Standardized variable names and casing.
3. Removed unnecessary cfoutput tag around variable output.
--->