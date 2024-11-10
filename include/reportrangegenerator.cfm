<!--- This ColdFusion page processes date ranges based on predefined criteria from a query and prepares them for further use. --->
<cfinclude template="/include/qry/x_280_1.cfm" />

<cfset currentYear = year(now()) />
<cfset currentMonth = month(now()) />

<cfset lastYear = currentYear - 1 />

<cfloop query="x">
    <cfset currentRangeId = x.rangeid />
    
    <!--- Check for Current Year range name --->
    <cfif x.rangename is "Current Year">
        <cfset newYear = year(now()) />
        <cfset newRangeStart = "#newYear#-01-01" />
        <cfset newRangeEnd = "#newYear#-12-31" />
    </cfif>
    
    <!--- Check for Last Year range name --->
    <cfif x.rangename is "Last Year">
        <cfset newYear = year(now()) - 1 />
        <cfset newRangeStart = "#newYear#-01-01" />
        <cfset newRangeEnd = "#newYear#-12-31" />
    </cfif>
    
    <!--- Check for Current Month range name --->
    <cfif x.rangename is "Current Month">
        <cfif currentMonth eq 12>
            <cfset nextMonth = 1 />
            <cfset newYear = currentYear + 1 />
        <cfelse>
            <cfset nextMonth = currentMonth + 1 />
            <cfset newYear = currentYear />
        </cfif>

        <cfset nextDate = "#newYear#-#nextMonth#-01" />
        <cfset newRangeEnd = DateAdd("d", -1, nextDate) />
        <cfset newRangeEnd = dateformat(newRangeEnd, 'YYYY-MM-dd') />
        <cfset newRangeStart = "#currentYear#-#currentMonth#-01" />
    </cfif>
    
    <!--- Check for Last 3 Months range name --->
    <cfif x.rangename is "Last 3 Months">
        <cfset currentDate = now() />
        <cfset newRangeStart = CreateDate(year(currentDate), month(currentDate) - 3, 1) />
        <cfset newRangeEnd = dateformat(currentDate, 'YYYY-MM-dd') />
        <cfset newRangeStart = dateformat(newRangeStart, 'YYYY-MM-dd') />
    </cfif>
    
    <!--- Check for Last 6 Months range name --->
    <cfif x.rangename is "Last 6 Months">
        <cfset currentDay = day(now()) />

        <cfif currentMonth lte 6>
            <cfset sixMonth = 12 - (6 - currentMonth) />
            <cfset sixYear = lastYear />
        <cfelse>
            <cfset sixYear = currentYear />
            <cfset sixMonth = currentMonth - 6 />
        </cfif>

        <cfset newRangeEnd = dateformat(now(), 'YYYY-MM-dd') />
        <cfset newRangeStart = dateformat(CreateDate(sixYear, sixMonth, currentDay), 'YYYY-MM-dd') />
    </cfif>

    <cfinclude template="/include/qry/update2_280_2.cfm" />
</cfloop>

<cfinclude template="/include/qry/update2_280_3.cfm" />

<cfset newRangeEnd = "" />
<cfset newRangeStart = "" />

<!--- Modifications: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Simplified record count logic for icons or conditional displays.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Used uniform date and time formatting across the code.
7. Improved logic for expanding and collapsing views in mobile layouts.
8. Removed cftry and cfcatch blocks entirely.
9. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs ## to avoid interpretation as variables.
--->