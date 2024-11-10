<!--- This ColdFusion page handles the insertion and updating of audition-related data based on custom tone and network IDs. --->
<cfif new_toneid is "Custom"> <!--- Check if the tone ID is custom and not empty --->
    <cfif Custom is not "">
        <cfinclude template="/include/qry/insert_277_1.cfm" />
        <cfset new_toneid = result.generatedkey>
    <cfelse>
        <cfset new_toneid = old_toneid>
    </cfif>
</cfif>

<cfif new_networkid is "CustomNetwork"> <!--- Check if the network ID is custom and not empty --->
    <cfif CustomNetwork is not "">
        <cfinclude template="/include/qry/insert_277_2.cfm" />
        <cfset new_networkid = resultz.generatedkey>
    <cfelse>
        <cfset new_networkid = old_networkid>
    </cfif>
</cfif>

<cfset new_audprojectid = audprojectid />
<cfinclude template="/include/qry/find_new_277_3.cfm" />

<cfif find_new.recordcount eq 0> <!--- If no records found, insert audition contacts --->
    <cfinclude template="/include/qry/audcontacts_auditions_xref_ins.cfm" />
</cfif>

<cfif old_contactid neq new_contactid> <!--- If the old contact ID is different from the new one, delete the old contact --->
    <cfinclude template="/include/qry/del_277_4.cfm" />
</cfif>

<cfinclude template="/include/qry/audprojects_upd.cfm" />

<cfset returnurl = "/app/audition/?audprojectid=" & audprojectid & "&secid=" & secid />

<cflocation url="#returnurl#" />

<!--- Changes: Removed unnecessary # symbols in conditional checks, removed unnecessary cfoutput tags, standardized variable names and casing, simplified record count logic, ensured consistent attribute quoting, spacing, and formatting. --->