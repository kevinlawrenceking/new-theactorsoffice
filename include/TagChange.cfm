<!--- This ColdFusion page processes tags, checks for existing records, and handles orphan records. --->
<cfparam name="tag" default=""/>
<cfset myTagList = tag> <!--- Standardized variable name and casing --->

<cfoutput>
    <br>#myTagList#<br>
    contactid: #contactid#<br>
</cfoutput>

<cfinclude template="/include/qry/delete_298_1.cfm" />

<!--- Check if the tag is not empty --->
<cfif len(trim(myTagList))> <!--- Removed unnecessary # symbols in conditional check --->
    <!--- Loop through each value in the myList --->
    <cfloop list="#myTagList#" index="newValueText"> <!--- Standardized variable name and casing --->
        <cfinclude template="/include/qry/find_298_2.cfm" />
        <!--- Check if no records were found --->
        <cfif NOT find.recordcount> <!--- Simplified record count logic --->
            <cfinclude template="/include/qry/insert_tag_298_3.cfm" />
            <cfinclude template="/include/qry/find_298_2.cfm" />
        </cfif>
        <cfinclude template="/include/qry/insert_298_5.cfm" />
    </cfloop>
</cfif>

<cfinclude template="/include/qry/y_298_6.cfm" />

<!--- Loop through query results from y --->
<cfloop query="y">
    <cfinclude template="/include/qry/find_orphan_298_7.cfm" />
    <!--- Check if no orphan records were found --->
    <cfif NOT find_orphan.recordcount> <!--- Simplified record count logic --->
        <cfinclude template="/include/qry/d_298_8.cfm" />
    </cfif>
</cfloop>

<cfset scriptNameInclude = "/include/#ListLast(GetCurrentTemplatePath(), '/')#"/> <!--- Standardized variable name and casing --->
<cfinclude template="/include/bigbrotherinclude.cfm"/>
<cflocation url="/app/contact/?contactid=#contactid#"/>

<!--- Changes were made based on rules 1, 3, 4, 5, and 11. --->