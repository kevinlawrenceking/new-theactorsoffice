<!--- Get system user details ---> 
<cfset systemUserService = createObject("component", "services.SystemUserService")>
<cfset reldetails = systemUserService.getSystemUserByID(suid=suid)>

<!--- Get old system details --->
<cfset oldSystemDetails = systemUserService.getOldSystemDetails(suid=suid)>

<cfset old_systemscope = oldSystemDetails.systemscope>
<cfset old_systemtype = oldSystemDetails.systemtype>

<!--- Determine old system type based on suid --->
<cfif suid neq "0">
    <cfset old_systemtype = reldetails.systemtype>
<cfelse>
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
        <cfset findSystem = systemUserService.findSystemByScope(systemscope=new_systemscope)>
        <cfset findSystemOld = systemUserService.findSystemByID(suid=suid)>

        <!--- Set system IDs --->
        <cfset systemid = (findSystem.recordcount EQ 1 AND len(trim(findSystem.systemid))) ? findSystem.systemid : 0>
        <cfset systemid_old = (findSystemOld.recordcount EQ 1 AND len(trim(findSystemOld.systemid))) ? findSystemOld.systemid : 0>

        <!--- Determine the verb (Added or Moved) --->
        <cfset verb = (systemid_old EQ 0) ? "Added" : "Moved">

        <!--- Track names mapped by system ID --->
        <cfset tracks = {
            1: "Follow Up",
            2: "Follow Up",
            3: "Maintenance",
            4: "Maintenance",
            5: "Targeted",
            6: "Targeted"
        }>

        <!--- Process notes based on system changes --->
    <!--- Process notes based on system changes --->
<cfloop collection="#tracks#" item="key">
    <cfif systemid EQ key AND systemid_old NEQ key>
        <cfset new_NoteDetails = "#verb# to #tracks[key]# Track.">

        <!--- Insert note dynamically without include --->
        <cfset noteService = createObject("component", "services.NoteService")>
        <cfset noteService.INSnoteslog_24319(
            userid=userid,
            contactid=contactid,
            noteDetails=new_NoteDetails,
            isPublic=true,
            eventid=0
        )>
    </cfif>
</cfloop>


        <!--- Add the new system --->
  <cfinclude template="/include/add_system.cfm"/>
    </cfif>
</cfif>

<cflocation url="/app/contact/?contactid=#contactid#" />


