<!--- This ColdFusion page processes system scope and type changes, including closing existing systems and inserting notes as necessary. --->

<cfinclude template="/include/qry/reldetails_271_1.cfm" />
<cfset old_systemscope = reldetails.systemscope />

<cfinclude template="/include/qry/findscope_old_294_2.cfm" />
<cfinclude template="/include/qry/findscope_294_3.cfm" />

<!--- Determine new system scope based on findscope record count --->
<!--- Part aa --->
<cfif findscope.recordcount is 1>
    <cfset new_systemscope = "Casting Director">
<cfelse>
    <cfset new_systemscope = "Industry">
</cfif>

<!--- Part bb--->
<!--- Determine old system type based on suid --->
<cfif suid neq "0">
    <cfset old_systemtype = reldetails.systemtype>
<cfelse>
    <cfset old_systemtype = "None">
</cfif>

<!--- Part c--->
<cfif old_systemtype neq new_systemtype>

    <!--- Close existing system if old system type is not "None" --->
    <cfif old_systemtype neq "None">
        <cfinclude template="/include/qry/close_294_4.cfm" />
        <cfinclude template="/include/qry/close2_294_5.cfm" />
    </cfif>

<!--- part d --->
    <cfif new_systemtype neq "None">
        <cfinclude template="/include/qry/FindSystem_294_6.cfm" />
        <cfinclude template="/include/qry/FindSystemOld_294_7.cfm" />

        <!--- Check if there is exactly one record in findsystem --->
        <cfif findsystem.recordcount is 1>
          <cfif len(trim(findsystem.systemid))>
    <cfset systemid = findsystem.systemid>
<cfelse>
    <cfset systemid = 0>
</cfif>

<cfif len(trim(findsystemold.systemid))>
    <cfset systemid_old = findsystemold.systemid>
<cfelse>
    <cfset systemid_old = 0>
</cfif>

<!--- part K--->
            <cfif systemid is 3 and systemid_old neq 3>
                <cfinclude template="/include/qry/InsertNote_294_8.cfm" />
            </cfif>

            <cfinclude template="/include/add_system.cfm" />
        </cfif>
    </cfif>
</cfif>

<cfset script_name_include = "/include/#ListLast(GetCurrentTemplatePath(), '\')#" />
<cflocation url="/app/contact/?contactid=#contactid#" />
