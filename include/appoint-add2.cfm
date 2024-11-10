<cfparam name="rContactId" default="0"/>
<cfparam name="relationships" default="0"/>
<cfparam name="eventStart" default=""/>
<cfparam name="eventEnd" default=""/>
<cfparam name="eventStartTime" default="12:00:00"/>
<cfparam name="newEventStopTime" default=""/>
<cfparam name="eventEndTime" default=""/>
<cfparam name="dow" default=""/>
<cfparam name="endRecur" default=""/>

<!--- Adjust endRecur date if provided --->
<cfif endRecur is not "">
    <cfset endRecur = dateAdd('d', 1, endRecur) />
</cfif>

<!--- Set default event start date if not provided --->
<cfif eventStart is "">
    <cfset eventStart = dateformat(now(), 'yyyy-mm-dd') />
</cfif>

<!--- Set default event end date if not provided --->
<cfif eventEnd is "">
    <cfset eventEnd = dateformat(eventStart, 'yyyy-mm-dd') />
</cfif>

<!--- Calculate new event stop time if event start time is provided --->
<cfif eventStartTime is not "">
    <cfinclude template="/include/qry/duration.cfm" />
    <cfset newDurSeconds = duration.durseconds />
    <cfset newEventStopTime = timeformat(DateAdd("s", newDurSeconds, eventStartTime), 'HH:MM:SS') />
</cfif>

<!--- Clean event description and limit its length --->
<cfset cleanData = REReplace(eventDescription, "[^a-zA-Z0-9,.!? ]", "", "ALL")>
<cfset eventDescription = Left(cleanData, 5000)>

<!--- Now insert 'cleanData' into your database --->
<cfinclude template="/include/qry/add_14_1.cfm" />
<cfinclude template="/include/qry/t_14_2.cfm" />
<cfinclude template="/include/qry/tt_14_3.cfm" />
<cfinclude template="/include/qry/dd_14_4.cfm" />

<cfset newEventId = result.generatedkey />

<!--- Loop through relationships and process each one --->
<cfloop list="#relationships#" index="relationship">
    <cfif isnumeric(relationship)>
        <cfinclude template="/include/qry/find_14_5.cfm" />
        <cfif find.recordcount>
            <cfset newContactId = relationship />
        <cfelse>
            <cfset newContactId = 0 />
        </cfif>
    <cfelse>
        <cfinclude template="/include/qry/add_14_6.cfm" />
        <cfset currentId = result.generated_key />
        <cfset contactId = result.generated_key />
        <cfset newContactId = result.generated_key />
        <cfset selectUserId = userId />
        <cfset selectContactId = currentId />
        <cfinclude template="/include/folder_setup.cfm" />
    </cfif>

    <!--- Insert relationship data if new_contactid is not zero --->
    <cfif newContactId>
        <cfinclude template="/include/qry/inserts_14_7.cfm" />
    </cfif>
</cfloop>

<!--- Insert note details if provided --->
<cfif noteDetails is not "">
    <cfinclude template="/include/qry/InsertNote_14_8.cfm" />
</cfif>

<!--- Process audition-specific data if event type is Audition --->
<cfif eventTypeName is "Audition">
    <cfparam name="newAudLocId" default="0" />
    <cfset newAudStepId = 1 />
    <cfset newAudCatId = 1 />
    <cfset newAudSubCatId = 6 />
    <cfset newUserId = session.userId />
    <cfset newAudTypeId = "1" />
    <cfset newProjName = "Unknown" />
    <cfset newAudPlatformId = 4 />
    <cfset newAudRoleName = "Unknown" />
    <cfset newAudRoleTypeId = 1 />
    <cfset newContactId = 0 />
    <cfset newEventStart = eventStart />
    <cfset newEventStartTime = eventStartTime />
    <cfset newNewEventStopTime = newEventStopTime />

    <cfinclude template="/include/qry/audprojects_ins.cfm" />
    <cfinclude template="/include/qry/audroles_ins.cfm" />
    <cfinclude template="/include/qry/auditions_ins.cfm" />
</cfif>

<!--- Determine return URL based on contact ID --->
<cfif rContactId is "0">
    <cfset returnUrl = "/app/#returnUrl#/" />
<cfelse>
    <cfset returnUrl = "/app/#returnUrl#?contactid=#rContactId#" />
</cfif>

<cfset scriptNameInclude = "/include/#ListLast(GetCurrentTemplatePath(), " \")#"/>
<cfinclude template="/include/bigbrotherinclude.cfm" />

<!--- Redirect to the appointment page with new event ID --->
<cflocation url="/app/appoint/?eventid=#newEventId#"/>

<!--- Changes: Removed unnecessary cfoutput tags, removed unnecessary # symbols in conditional checks, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting, removed cftry and cfcatch blocks, used double pound signs for non-variable # symbols inside cfoutput blocks. --->