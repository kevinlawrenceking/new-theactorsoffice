<!--- Get system user details ---> 
<cfset systemUserService = createObject("component", "services.SystemUserService")>
<cfset reldetails = systemUserService.getSystemUserByID(suid=suid)>

<!--- Get old system details ---> 
<cfset oldSystemDetails = systemUserService.getOldSystemDetails(suid=suid)>

<!--- Initialize old_systemscope and old_systemtype ---> 
<cfif structKeyExists(oldSystemDetails, "systemscope")>
    <cfset old_systemscope = oldSystemDetails.systemscope>
    <cfset old_systemtype = oldSystemDetails.systemtype>
<cfelse>
    <cfset old_systemscope = "None">
    <cfset old_systemtype = "None">
</cfif>

<!--- Get contact tag status ---> 
<cfset contactItemService = createObject("component", "services.ContactItemService")>
<cfset new_systemscope = contactItemService.getContactTagStatus(contactid=contactid, userid=userid)>

<!--- Check for changes in system type and scope ---> 
<cfif old_systemtype neq new_systemtype>
    <!--- Close existing system if old system type is not "None" ---> 
    <cfif old_systemtype neq "None">
        <cfset systemUserService.closeSystem(suid=suid)>
        <cfset systemUserService.closeSystemPart2(suid=suid)>
    </cfif>

    <!--- Add or move to new system if new system type is not "None" ---> 
    <cfif new_systemtype neq "None">
        <!--- Find new and old systems ---> 
        <cfset findSystem = systemUserService.findSystemByScope(systemscope=new_systemscope)>
        <cfset systemService = createObject("component", "services.SystemService")>
        <cfset findSystemOld = systemService.findSystemByID(suid=suid)>

        <!--- Set system IDs safely ---> 
        <cfset systemid = 0>
        <cfset systemid_old = 0>

        <cfif findSystem.recordcount EQ 1 AND structKeyExists(findSystem, "systemid") AND len(trim(findSystem.systemid))>
            <cfset systemid = findSystem.systemid>
        </cfif>

        <cfif findSystemOld.recordcount EQ 1 AND structKeyExists(findSystemOld, "systemid") AND len(trim(findSystemOld.systemid))>
            <cfset systemid_old = findSystemOld.systemid>
        </cfif>

        <!--- Output debug information for system IDs --->
        <cfdump var="#systemid#" label="System ID">
        <cfdump var="#systemid_old#" label="Old System ID">
    </cfif>
</cfif>
