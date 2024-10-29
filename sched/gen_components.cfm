<cfsetting requestTimeout="9000">
<cfset startTime = getTickCount()>

<!-- Query to fetch all components from the database -->
<cfquery name="getComponents" datasource="yourDataSource">
    SELECT id, component_name, filename, displayname, hint 
    FROM components
</cfquery>

<!-- Loop through each component to create the CFC -->
<cfloop query="getComponents">

    <!-- Initialize the content of the CFC with the component definition -->
    <cfsavecontent variable="componentContent">
        <cfoutput>
<cfcomponent displayname="#getComponents.displayname#" hint="#getComponents.hint#" output="false">
    <!--- Start of the component definition: #getComponents.component_name# --->
</cfoutput>
    </cfsavecontent>

    <!-- Query to fetch all functions related to the current component -->
    <cfquery name="getFunctions" datasource="yourDataSource">
        SELECT function_name, returntype, output, hint, displayname, function_code 
        FROM functions 
        WHERE component_id = <cfqueryparam value="#getComponents.id#" cfsqltype="cf_sql_integer">
    </cfquery>

    <!-- Loop through each function and append it to the CFC content using the complete function_code -->
    <cfloop query="getFunctions">
        <!-- Append the full function_code directly to the component content -->
        <cfset componentContent &= getFunctions.function_code>
    </cfloop>

    <!-- Close the CFC component definition -->
    <cfset componentContent &= "</cfcomponent>">

    <!-- Save the generated CFC content to a file in the specified directory -->
    <cffile action="write" file="extracted/services/#getComponents.filename#" output="#componentContent#" charset="utf-8">
</cfloop>

<!-- Output total processing time -->
<cfset endTime = getTickCount()>
<cfset timeTakenMilliseconds = endTime - startTime>
<cfset timeTakenMinutes = timeTakenMilliseconds / 1000 / 60>
<cfoutput>
    Time taken to generate CFC services: #timeTakenMinutes# minutes
</cfoutput>
