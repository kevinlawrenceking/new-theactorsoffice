<!--- This ColdFusion page handles redirection based on the selected category. --->

<cfset dbug = 'N'>

<!--- Check the category and redirect accordingly --->
<cfif category eq "Contacts">
    <cflocation url = "/app/contact/?contactid=#selectedid#"/>
    
<cfelseif category eq "Tags">
    <cflocation url = "/app/contacts/?bytag=#selectedid#"/>
    
<cfelse>
    <cflocation url = "/app/appoint-update/?eventid=#selectedid#&returnurl=calendar-appoint&rcontactid=0"/>
</cfif>
