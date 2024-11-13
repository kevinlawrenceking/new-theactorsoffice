<cfcomponent displayname="DateFormatService" hint="Handles operations for DateFormat table" > 

    <cffunction output="false" name="SELdateformats" access="public" returntype="query" >
        <!--- Initialize an empty query variable --->
        <cfset var result = "">

        <cfquery name="result">
            SELECT id, formatexample, formatnotes
            FROM dateformats
        </cfquery>

        <cfreturn result>
    </cffunction>

</cfcomponent>