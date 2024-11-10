<cfset debugMode = "n" />
<cfparam name="idList" default="0" />
<cfif not isDefined('session.idList')>
    <cfset session.idList = idList />
</cfif>
<cfif idList is "0" and session.idList is not "0">
    <cfset idList = session.idList />
</cfif>
<cfinclude template="/include/qry/BatchDetails_304_1.cfm" />
<cfset currentStartDate = dateFormat(now(), 'yyyy-mm-dd') />
<cfparam name="contactExpand" default="true" />
<cfparam name="contactCheckVisible" default="false" />
<cfparam name="maintenanceExpand" default="false" />
<cfparam name="byTag" default="" />
<cfparam name="targetExpand" default="false" />
<cfparam name="followUpExpand" default="false" />
<cfparam name="allExpand" default="false" />
<cfparam name="pageAction" default="view" />
<cfparam name="systemId" default="0" />
<cfinclude template="/include/qry/lastUpdates.cfm" />
<cfset session.idList = idList />
<cfset numDeleted = 0 />
<cfset numSkipped = 0 />
<cfset numAdded = 0 />

<cfloop query="BatchDetails">
    <cfif debugMode is "Y">
        <h2>Contact: #batchDetails.recordName# (#batchDetails.contactId#) </h2>
    </cfif>
    <cfset newContactId = BatchDetails.contactId />
    <cfset newSystemType = newSystemType />
    <Cfset newSuStartDate = dateFormat(now(), 'yyyy-mm-dd') />
    <Cfset newCurrentStartDate = dateFormat(now(), 'yyyy-mm-dd') />
    <cfinclude template="/include/qry/FindScope_304_2.cfm" />
    <cfif findScope.recordCount is "1">
        <cfset newSystemScope = "Casting Director" />
        <cfif debugMode is "Y">
            <h4>#newSystemType# - Casting Director</h4>
        </cfif>
    <cfelse>
        <cfset newSystemScope = "Industry" />
        <cfif debugMode is "Y">
            <h4>#newSystemType# - Industry</h4>
        </cfif>
    </cfif>
    <cfinclude template="/include/qry/FindSystem_304_3.cfm" />
    <cfif findSystem.recordCount is "1">
        <cfset newSystemId = findSystem.systemId />
        <cfif debugMode is "Y">
            <p>new_systemid: #findSystem.systemId#</p>
        </cfif>
        <cfinclude template="/include/qry/FindActive_304_4.cfm" />
        <cfif keepList is "skip">
            <cfif debugMode is "Y">
                <p>keepList: skip</p>
                <p>Number of active systems for #batchDetails.recordName#: #findActive.recordCount#</p>
            </cfif>
            <cfif findActive.recordCount is "0">
                <cfif debugMode is "Y">
                    <p>Since the number of active systems is zero, add a new system.</p>
                </cfif>
                <cfinclude template="/include/AddSystemToContact.cfm" />
            <cfelse>
                <cfset numSkipped = numSkipped + 1 />
                <cfif debugMode is "Y">
                    <p>Skipping because it already has #findActive.recordCount# active system(s)</p>
                    <p>Total skipped: #numSkipped#</p>
                </cfif>
            </cfif>
        </cfif>
        <cfif keepList is "replace">
            <cfinclude template="/include/qry/findSame_304_5.cfm" />
            <cfif debugMode is "Y">
                <p>keepList: replace <br>Number of active identical systems of this same type: #findSame.recordCount#</p>
            </cfif>
            <cfif findSame.recordCount is "0">
                <cfif debugMode is "Y">
                    <p>Since the number of identical systems is zero, just delete any active systems.</p>
                </cfif>
                <cfinclude template="/include/qry/delete_304_6.cfm" />
                <cfset numDeleted = numDeleted + resultQryUpdateCell.RecordCount />
                <cfif debugMode is "Y">
                    <p>Total contact system's deleted: #resultQryUpdateCell.RecordCount#</p>
                    <p>numDeleted: #numDeleted#</p>
                </cfif>
                <cfif debugMode is "Y">
                    <p>Add a new system.</p>
                </cfif>
                <cfinclude template="/include/AddSystemToContact.cfm" />
            <cfelse>
                <cfset numSkipped = numSkipped + 1 />
                <cfif debugMode is "Y">
                    <p>System skipped</p>
                    <p>numSkipped: #numSkipped#</p>
                </cfif>
            </cfif>
        </cfif>
    <cfelse>
        <p>Aborted</p>
        <cfif debugMode is "Y">
            <p>Aborted - No System Found!!!</p>
        </cfif>
    </cfif>
</cfloop>

<p>ID LIST: #session.idList#<br>System: #newSystemType#<br>KEEPLIST: #keepList#</p>
<p>numSkipped: #numSkipped#<br>numDeleted: #numDeleted#<br>numAdded: #numAdded#</p>

<cfset scriptNameInclude = "/include/#ListLast(getCurrentTemplatePath(), " \")#" />
<cfset session.pageAction = "bulk" />
<cfif debugMode is "N">
    <cflocation url="/app/contacts/?bt=system&d=#numDeleted#&s=#numSkipped#&a=#numAdded#&t=#newSystemType#" />
</cfif>

<!--- Changes made based on rules 1, 2, 3, 4, 5, 6, 7, 8, 9, and 10. --->