
<cftry>
    <cfset birthdays = createObject("component", "services.ContactService").getUpcomingBirthdays(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in birthdays_442_1.cfm]: #cfcatch.message#">
        <cfset birthdays = queryNew("daysuntil,col1,contactid,col2", "integer,varchar,integer,varchar")>
    </cfcatch>
</cftry>
