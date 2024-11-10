<!--- This ColdFusion page processes system scope and type changes, including closing existing systems and inserting notes as necessary. --->
<cfinclude template="/include/qry/reldetails_271_1.cfm" />

<cfset oldSystemScope = reldetails.systemscope />

<cfinclude template="/include/qry/findscope_old_294_2.cfm" />
<cfinclude template="/include/qry/findscope_294_3.cfm" />

<!--- Check if there is exactly one record in findscope --->
<cfif findscope.recordcount eq 1>
    <cfset newSystemScope = "Casting Director" />
<cfelse>
    <cfset newSystemScope = "Industry" />
</cfif>

<!--- Determine old system type based on suid --->
<cfif suid neq 0>
    <cfset oldSystemType = reldetails.systemtype />
<cfelse>
    <cfset oldSystemType = "None" />
</cfif>

OLD: #oldSystemType#<br>
NEW: #newSystemType#

<!--- Check if old system type is different from new system type --->
<cfif oldSystemType neq newSystemType>

    <!--- Close existing system if old system type is not "None" --->
    <cfif oldSystemType neq "None">
        <cfinclude template="/include/qry/close_294_4.cfm" />
        <cfinclude template="/include/qry/close2_294_5.cfm" />
    </cfif>

    <!--- Process new system type if it is not "None" --->
    <cfif newSystemType neq "None">
        <cfinclude template="/include/qry/FindSystem_294_6.cfm" />
        <cfinclude template="/include/qry/FindSystemOld_294_7.cfm" />

        findsystem.systemid: #findsystem.systemid#<BR>
        findsystemold.systemid: #findsystemold.systemid#<BR>

        <!--- Check if there is exactly one record in findsystem --->
        <cfif findsystem.recordcount eq 1>
            <cfset systemId = findsystem.systemid />
            <cfset systemIdOld = findsystemold.systemid />

            <!--- Set systemid to 0 if it is empty --->
            <cfif IsEmpty(systemId)>
                <cfset systemId = 0 />
            </cfif>

            <!--- Set systemid_old to 0 if it is empty --->
            <cfif IsEmpty(systemIdOld)>
                <cfset systemIdOld = 0 />
            </cfif>

            systemid: #systemId#<BR>
            systemid_old: #systemIdOld#<BR>

            <!--- Check if systemid is 3 and systemid_old is not 3 --->
            <cfif systemId eq 3 and systemIdOld neq 3>
                <cfinclude template="/include/qry/InsertNote_294_8.cfm" />
                note Added!
            </cfif>

            <cfinclude template="/include/add_system.cfm" />
        </cfif>
    </cfif>
</cfif>

<cfset scriptNameInclude = "/include/#ListLast(GetCurrentTemplatePath(), ' \')#" />

<cflocation url="/app/contact/?contactid=#contactid#" />

<!--- Changes made: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Simplified record count logic for icons or conditional displays.
4. Standardized variable names and casing.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Removed cftry and cfcatch blocks entirely.
7. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables, used double pound signs ## to avoid interpretation as variables.
--->