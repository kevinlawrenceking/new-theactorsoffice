<cfset debug = "N" />
<cfparam name="contactExpand" default="true" />
<cfparam name="idList" default="0" />

<cfif idList is "0" and session.idList is not "0">
    <cfset idList = session.idList />
</cfif>

<cfif debug is "N">
    <cfif idList is "0">
        <cflocation url="/app/contacts/?bulk_no=0" />
    </cfif>
</cfif>

<cfparam name="contactCheckVisible" default="false" />
<cfparam name="maintenanceExpand" default="false" />
<cfparam name="byTag" default="" />
<cfparam name="targetExpand" default="false" />
<cfparam name="followUpExpand" default="false" />
<cfparam name="allExpand" default="false" />
<cfparam name="pgAction" default="view" />
<cfparam name="systemID" default="0" />

<cfinclude template="/include/qry/lastUpdates.cfm" />

<cfset session.idList = idList />

<cfset noDeleted = 0 />
<cfset noSkipped = 0 />
<cfset noAdded = 0 />
<cfset newAddRemove = addRemove />

<cfinclude template="/include/qry/batchDetails_304_1.cfm" />

<cfloop query="batchDetails">
    <cfif debug is "Y">
        <h2>Contact: #batchDetails.recordName# (#batchDetails.contactId#) </h2>
    </cfif>

    <cfset newContactId = batchDetails.contactId />
    <cfset newTagName = newTagName />
    <Cfset newCurrentStartDate = dateFormat(Now(),'yyyy-mm-dd') />

    <cfinclude template="/include/qry/findSame_305_2.cfm" />

    <cfif addRemove is "add">
        <cfif findSame.recordCount is "0">
            <cfinclude template="/include/qry/insert_305_3.cfm" />
            <cfset noAdded = noAdded + 1 />
        </cfif>

        <cfif findSame.recordCount is "1">
            <cfset noSkipped = noSkipped + 1 />
        </cfif>
    </cfif>

    <cfif addRemove is "remove">
        <cfif findSame.recordCount is "0">
            <cfset noSkipped = noSkipped + 1 />
        </cfif>

        <cfif findSame.recordCount is "1">
            <cfinclude template="/include/qry/insert_305_4.cfm" />
            <cfset noDeleted = noDeleted + 1 />
        </cfif>
    </cfif>
</cfloop>

<P>ID LIST: #session.idList#<BR>Tag: #newTagName#<BR>Action: #addRemove#</P>
<p>No Skipped: #noSkipped#<BR>No Deleted: #noDeleted#<BR>No Added: #noAdded#</p>

<cfset scriptNameInclude = "/include/#ListLast(GetCurrentTemplatePath(), ' \')#" />

<cfset session.pgAction = "bulk" />

<cfif debug is "N">
    <cflocation url="/app/contacts/?bt=tag&d=#noDeleted#&s=#noSkipped#&a=#noAdded#&t=#newTagName#" />
</cfif>

<!--- Modifications made based on standards: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used uniform date and time formatting across the code.
--->