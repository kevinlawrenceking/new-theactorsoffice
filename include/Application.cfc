<cfoutput>#expandPath("../app/Application.cfc")#</cfoutput>

<Cfabort>
<cfcomponent extends="/app/Application.cfc">
    <cfscript>
        this.mappings["/app"] = expandPath("../app");
    </cfscript>
</cfcomponent>
