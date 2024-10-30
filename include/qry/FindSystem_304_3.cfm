
<cftry>
    <cfset FindSystem = createObject("component", "services.SystemService").SELfusystems_24342(systemType=new_systemtype, systemScope=new_systemscope) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindSystem_304_3.cfm]: #cfcatch.message#">
        <cfset FindSystem = queryNew("systemid")>
    </cfcatch>
</cftry>
