<!--- Initialize services --->
<cfset systemUserService = createObject("component", "services.SystemUserService")>
<cfset systemService = createObject("component", "services.SystemService")>

<!--- Get system user details ---> 
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
        <!--- Find new and old systems using SystemService ---> 
        <cfset findSystem = systemService.findSystemByScope(systemscope=new_systemscope)>
        <cfset findSystemOld = systemService.findSystemByID(suid=suid)>

        <!--- Initialize system IDs safely --->
        <cfset systemid = 0>
        <cfset systemid_old = 0>

        <!--- Safely check and set systemid --->
        <cfif findSystem.recordcount EQ 1 AND findSystem.systemid[1] NEQ "" AND len(trim(findSystem.systemid[1]))>
            <cfset systemid = findSystem.systemid[1]>
        </cfif>

        <!--- Safely check and set systemid_old --->
        <cfif findSystemOld.recordcount EQ 1 AND findSystemOld.systemid[1] NEQ "" AND len(trim(findSystemOld.systemid[1]))>
            <cfset systemid_old = findSystemOld.systemid[1]>
        </cfif>

        <!--- Debugging --->
        <cfdump var="#systemid#" label="System ID">
        <cfdump var="#systemid_old#" label="Old System ID">
    </cfif>
</cfif>
