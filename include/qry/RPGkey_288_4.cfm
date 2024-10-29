
<cftry>
    <cfset RPGkey = createObject("component", "services.PageService").getPgFields(rpgid=#rpgid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in RPGkey_288_4.cfm]: #cfcatch.message# - Query: #cfcatch.detail#" />
        <cfset RPGkey = queryNew("fname,ftype") />
    </cfcatch>
</cftry>
