<cfsetting requestTimeout="9000">
<cfset startTime = getTickCount()>

<cfquery name="getComponents" datasource="abod">
    SELECT id, component_name, filename, displayname, hint 
    FROM components
</cfquery>


<cfloop query="getComponents">
<cfoutput>
<cfsavecontent variable="componentContent">
#Chr(60)#cfcomponent displayname="#getComponents.displayname#" hint="#getComponents.hint#" output="false"#Chr(62)#
</cfsavecontent>
</cfoutput>

    <cfquery name="getFunctions" datasource="abod">
        SELECT function_name, returntype, output, hint, displayname, function_code_final
        FROM functions 
        WHERE component_id = <cfqueryparam value="#getComponents.id#" cfsqltype="cf_sql_integer"> and function_code_final is not null
    </cfquery>

    <cfloop query="getFunctions">

        <cfset componentContent &= getFunctions.function_code_final>
    </cfloop>

    <cfset componentContent &= "</cfcomponent>">


    <cffile action="write" file="C:/home/theactorsoffice.com/extracted/#getComponents.filename#" output="#componentContent#" charset="utf-8">
</cfloop>


<cfset endTime = getTickCount()>
<cfset timeTakenMilliseconds = endTime - startTime>
<cfset timeTakenMinutes = timeTakenMilliseconds / 1000 / 60>
<cfoutput>
    Time taken to generate CFC services: #timeTakenMinutes# minutes
</cfoutput>
