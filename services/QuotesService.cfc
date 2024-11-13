<cfcomponent displayname="QuotesService" output="false"> 

    <cffunction name="getQuoteOfTheDay" access="public" returntype="query" output="false">
        
        <cfset todayMonth = dateFormat(Now(), "MM")>
        <cfset todayDay = dateFormat(Now(), "dd")>
        
        <cfquery result="result"  name="quoteOfTheDay">
            SELECT 
                quotename, 
                quoteauthor
            FROM 
                quotes 
            WHERE 
                quoteMonth = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#todayMonth#">
                AND quoteDay = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#todayDay#">
            ORDER BY 
                quotedate DESC
            LIMIT 1
        </cfquery>
        
        <cfif quoteOfTheDay.recordcount eq 0>
            
            <cfquery result="result"  name="randomQuote">
                SELECT 
                    id,
                    quotename, 
                    quoteauthor
                FROM 
                    quotes 
                WHERE 
                    quotedate IS NULL 
                ORDER BY RAND()
                LIMIT 1
            </cfquery>

            <cfif randomQuote.recordcount gt 0>
                <cfquery result="result" >
                    UPDATE quotes 
                    SET 
                        quotedate = <cfquery result="result" param cfsqltype="cf_sql_date" value="#dateFormat(Now(),'yyyy-MM-dd')#">,
                        quoteMonth = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#todayMonth#">,
                        quoteDay = <cfquery result="result" param cfsqltype="cf_sql_varchar" value="#todayDay#">
                    WHERE id = <cfquery result="result" param cfsqltype="cf_sql_integer" value="#randomQuote.id#">
                </cfquery>

                <cfreturn randomQuote>
            </cfif>

        <cfelse>
            <cfreturn quoteOfTheDay>
        </cfif>
        
    </cffunction>

</cfcomponent>