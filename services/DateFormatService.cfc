<cfcomponent displayname="DateFormatService" hint="Handles operations for DateFormat table" output="false"> 

    <cffunction name="SELdateformats" access="public" returntype="query" output="false">
        <!--- Initialize an empty query variable --->
        <cfset var result = "">

        <cfquery name="result" datasource="abod">
            SELECT id, formatexample, formatnotes
            FROM dateformats
        </cfquery>

        <cfreturn result>
    </cffunction>

</cfcomponent>
