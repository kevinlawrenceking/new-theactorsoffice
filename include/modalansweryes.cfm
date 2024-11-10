<!--- This ColdFusion page processes system updates based on audition dates and manages notifications accordingly. --->
<cfset suNotes = "Added via past date audition." />
<cfinclude template="/include/qry/fin_recordname_157_1.cfm" />

<!--- Check if a record is found in fin_recordname --->
<cfif fin_recordname.recordcount eq 1>
    <cfset newContactName = fin_recordname.recordname />
    <cfinclude template="/include/qry/find_fu_157_2.cfm" />

    <!--- Check if no records are found in find_fu --->
    <cfif find_fu.recordcount eq 0>
        <cfset suStartDate = DateFormat(new_suStartDate, 'yyyy-mm-dd') />
        <cfset currentStartDate = DateFormat(new_suStartDate, 'yyyy-mm-dd') />
        <cfinclude template="/include/qry/addSystem_157_3.cfm" />

        <cfset newSUID = result.generatedkey />
        <cfinclude template="/include/qry/CompleteTargetSystems_157_4.cfm" />
        <cfinclude template="/include/qry/sudetails_157_5.cfm" />
        <cfinclude template="/include/qry/Insert_157_6.cfm" />

        <cfset newNotification = result.generatedkey />
        <cfinclude template="/include/qry/addDaysNo_157_7.cfm" />

        <cfset addAction = "Y" />
        <cfset newActionId = addDaysNo.actionid />
        <cfset actionDaysNo = NumberFormat(addDaysNo.actiondaysno) />

        <!--- Check if addDaysNo is unique --->
        <cfif adddaysno.isunique eq 1>
            <cfinclude template="/include/qry/checkUnique_157_8.cfm" />

            <!--- Check if the unique record exists --->
            <cfif checkunique.recordcount eq 1>
                <cfset addAction = "N" />
            </cfif>
        </cfif>

        <!--- Proceed if action is still set to "Y" --->
        <cfif addAction eq "Y">
            <cfif IsEmpty(actionDaysNo)>
                <cfset actionDaysNo = 0 />
            </cfif>

            <cfset notStartDate = DateAdd('d', actionDaysNo, currentStartDate) />

            <!--- Check if the not start date is less than or equal to the current start date --->
            <cfif notStartDate lte currentStartDate>
                <cfinclude template="/include/qry/addNotification_157_9.cfm" />
            <cfelse>
                <cfinclude template="/include/qry/addNotification_157_10.cfm" />
            </cfif>
        </cfif>
    </cfif>
</cfif>

<!--- Changes: 
1. Removed unnecessary cfoutput tags.
2. Removed unnecessary # symbols in conditional checks.
3. Standardized variable names and casing.
4. Simplified record count logic.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Used uniform date and time formatting across the code.
7. Removed cftry and cfcatch blocks entirely.
8. Replaced single # symbols with double ## inside cfoutput blocks that are not meant as ColdFusion variables.
--->