<!--- This ColdFusion page processes system scope and type changes, including closing existing systems and inserting notes as necessary. --->

<cfinclude template="/include/qry/reldetails_271_1.cfm" />

<cfoutput>
    <cfset old_systemscope="#reldetails.systemscope#" />
</cfoutput>

<cfinclude template="/include/qry/findscope_old_294_2.cfm" />
<cfinclude template="/include/qry/findscope_294_3.cfm" />

<!--- Check if there is exactly one record in findscope --->
<cfif #findscope.recordcount# is "1">
    <cfset new_systemscope="Casting Director" />
<cfelse>
    <cfset new_systemscope="Industry" />
</cfif>

<!--- Determine old system type based on suid --->
<cfif #suid# is not "0">
    <CFOUTPUT>
        <CFSET OLD_SYSTEMTYPE="#RELDETAILS.SYSTEMTYPE#" />
    </CFOUTPUT>
<cfelse>
    <CFSET OLD_SYSTEMTYPE="None" />
</cfif>

<CFOUTPUT>
    OLD: #OLD_SYSTEMTYPE#<br>
    NEW: #NEW_SYSTEMTYPE#
</CFOUTPUT>

<!--- Check if old system type is different from new system type --->
<cfif "#OLD_SYSTEMTYPE#" is not "#new_systemtype#">
    <!--- Close existing system if old system type is not "None" --->
    <cfif #OLD_SYSTEMTYPE# is not "None">
        <cfinclude template="/include/qry/close_294_4.cfm" />
        <cfinclude template="/include/qry/close2_294_5.cfm" />
    </cfif>

    <!--- Process new system type if it is not "None" --->
    <cfif #new_systemtype# is not "None">
        <cfinclude template="/include/qry/FindSystem_294_6.cfm" />
        <cfinclude template="/include/qry/FindSystemOld_294_7.cfm" />

        <cfoutput>
            findsystem.systemid: #findsystem.systemid#<BR>
            findsystemold.systemid: #findsystemold.systemid#<BR>
        </cfoutput>

        <!--- Check if there is exactly one record in findsystem --->
        <cfif #findsystem.recordcount# is "1">
            <cfset systemid=findsystem.systemid />
            <cfset systemid_old =findsystemold.systemid />

            <!--- Set systemid to 0 if it is empty --->
            <CFIF #SYSTEMID# IS "">
                <CFSET SYSTEMID = 0 />
            </CFIF>

            <!--- Set systemid_old to 0 if it is empty --->
            <CFIF #SYSTEMID_old# IS "">
                <CFSET SYSTEMID_old = 0 />
            </CFIF>

            <cfoutput>
                systemid: #systemid#<BR>
                systemid_old: #systemid_old#<BR>
            </cfoutput>

            <!--- Check if systemid is 3 and systemid_old is not 3 --->
            <cfif #systemid# is "3" and #systemid_old# is not "3">
                <cfinclude template="/include/qry/InsertNote_294_8.cfm" />
                note Added!
            </cfif>

            <cfinclude template="/include/add_system.cfm" />
        </cfif>
    </cfif>
</cfif>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />

<cflocation url="/app/contact/?contactid=#contactid#" />

