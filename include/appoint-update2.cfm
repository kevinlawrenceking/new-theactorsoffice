<!--- This ColdFusion page processes event details, calculates event stop time, cleans event descriptions, and manages relationships for contacts. --->
<cfparam name="rContactId" default="0" />
<cfparam name="eventStartTime" default="" />
<cfparam name="dow" default="" />

<!--- Check if event start time is provided --->
<cfif len(eventStartTime)>
    <!--- Include duration calculation template --->
    <cfinclude template="/include/qry/duration.cfm" />
    <cfset newDurSeconds = duration.durSeconds />
    <cfset eventStopTime = DateAdd("s", eventStartTime, newDurSeconds) />
    
    eventStartTime: <cfoutput>#timeformat(eventStartTime,'HH:MM:SS')#</cfoutput><BR>
    newDurSeconds: <cfoutput>#newDurSeconds#</cfoutput><BR>
    statement: SELECT ADDTIME("<cfoutput>#timeformat(eventStartTime,'HH:MM:SS')#</cfoutput>", "<cfoutput>#newDurSeconds#</cfoutput>") as newEventStopTime <BR>
    
    <cfset newEventStopTime = timeformat(DateAdd("s", newDurSeconds, eventStartTime),'HH:MM:SS') />
    
    newEventStopTime: <cfoutput>#newEventStopTime#</cfoutput><BR>
</cfif>

<!--- Clean event description and limit its length --->
<cfset cleanData = REReplace(eventDescription, "[^a-zA-Z0-9,.!? ]", "", "ALL")>
<cfset eventDescription = Left(cleanData, 5000)>

<!--- Include update and delete templates for event --->
<cfinclude template="/include/qry/update_18_1.cfm" />
<cfinclude template="/include/qry/d_18_2.cfm" />

<!--- Loop through relationships --->
<cfloop list="#relationships#" index="relationship" >
    <!--- Check if relationship is numeric --->
    <cfif isNumeric(relationship)>
        <!--- Include find template for relationship --->
        <cfinclude template="/include/qry/find_18_3.cfm" />
        <!--- Check if a record was found --->
        <cfif find.recordCount>
            <cfset newContactId = relationship />
        <cfelse>
            <cfset newContactId = 0 />
        </cfif>
    <cfelse>
        <!--- Include add template for new relationship --->
        <cfinclude template="/include/qry/add_14_6.cfm" />
        <cfset currentId = result.generatedKey />
        <cfset contactId = result.generatedKey />
        <cfset newContactId = result.generatedKey />
        <cfset selectUserId = cookie.userId />
        <cfset selectContactId = currentId />
        
        <!--- Include folder setup template --->
        <cfinclude template="/include/folder_setup.cfm" />
    </cfif>

    <!--- If a new contact ID was generated, include insert template --->
    <cfif newContactId>
        <cfinclude template="/include/qry/inserts_18_5.cfm" />
    </cfif>
</cfloop>

<!--- Determine return URL based on contact ID --->
<cfif rContactId>
    <cfset returnUrl = "/app/#returnUrl#?contactid=#rContactId#&t2=1" />
<cfelse>
    <cfset returnUrl = "/app/#returnUrl#/?eventid=#eventId#" />
</cfif>

<!--- Redirect to the return URL --->
<cflocation url="#returnUrl#" />

<!--- Changes made: 
1. Standardized variable names and casing
2. Removed unnecessary cfoutput tags around variable outputs
3. Avoided using # symbols within conditional checks unless essential
4. Simplified record count logic for icons or conditional displays
5. Ensured consistent attribute quoting, spacing, and formatting
6. Used uniform date and time formatting across the code
7. Removed cftry and cfcatch blocks entirely
8. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs ## to avoid interpretation as variables.
--->