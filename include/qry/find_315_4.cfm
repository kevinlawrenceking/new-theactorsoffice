
<cftry>
    <cfset find = createObject("component", "services.ContactService").SELcontactdetails_24397(fname=x.fname, lname=x.lname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_315_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
