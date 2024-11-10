<!--- This ColdFusion page fetches favicons from specified URLs and saves them as PNG images. --->
<cfinclude template="/include/qry/x_91_1.cfm" />

<!--- Loop through each record in the query x --->
<cfloop query="x">
    <cfset recordId = x.id />
    <cfset siteUrl = x.siteurl />

    <!--- Add 'http' if missing in the site URL --->
    <cfif NOT findNoCase("http", siteUrl)>
        <cfset siteUrl = "http://" & siteUrl />
    </cfif>

    <!--- Fetch the favicon from the site URL --->
    <cfhttp url="#siteUrl#/favicon.ico" method="get" getAsBinary="yes" result="result"></cfhttp>

    <!--- Check if cfhttp was successful and the content type indicates an image --->
    <cfif result.statusCode EQ "200 OK" AND findNoCase("image/", result.responseHeader["Content-Type"])>

        <!--- Write the favicon to a temporary file --->
        <cffile action="write" file="#GetTempDirectory()#/favicon.ico" output="#result.fileContent#" mode="777"></cffile>

        <!--- New image name and directory --->
        <cfset newSiteIcon = "custom_" & recordId & ".png" />
        <cfset imageDir = application.retinaIcons14Url />

        <!--- Convert to PNG and Save --->
        <cfimage action="read" source="#GetTempDirectory()#/favicon.ico" name="imageObj">
        <cfimage action="write" destination="#imageDir#/custom_#recordId#.png" source="#imageObj#" format="png"></cfimage>

        <!--- Update Record with the new favicon --->
        <cfinclude template="/include/qry/update_91_2.cfm" />
    </cfif>
</cfloop>

<!--- 
Modifications based on standards:
1. Removed unnecessary cfoutput tags around variable outputs.
2. Standardized variable names and casing.
3. Removed cftry and cfcatch blocks entirely.
4. Avoided using # symbols within conditional checks unless essential.
--->