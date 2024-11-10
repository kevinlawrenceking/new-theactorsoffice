<!--- This ColdFusion page retrieves and displays data from the audunions_sel query based on parameters provided. --->
<cfparam name="debug" default="N" />
<cfparam name="newAudCatId" default="0" />
<cfparam name="newCountryId" default="US" />

<cfinclude template="/include/qry/audunions_sel_40_1.cfm" />

<!--- Check if debugging is enabled --->
<cfif debug is "Y">
    <!--- Display the country ID and a header for the data table --->
    <h3>
        <cfoutput>#newCountryId# - Audunions_sel</cfoutput>
    </h3>

    <!--- Create a table to display the query results --->
    <cftable query="audunions_sel" colheaders="true" border="true" htmltable>
        <cfcol header="ID" text="#ID#" />
        <cfcol header="NAME" text="#NAME#" />
    </cftable>
</cfif>

<!--- Changes Made: 
1. Standardized variable names and casing.
2. Removed unnecessary # symbols within conditional checks.
--->