
<cftry>
    <cfset RPGkey = createObject("component", "/services/PageService").getpgpages(rpgid)>
    <cfcatch type="any">
        <cflog text="[Error in RPGkey_288_4.cfm]: #cfcatch.message#" file="errorLog">
    </cfcatch>
</cftry>
