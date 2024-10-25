<cfcomponent displayname="QuotesService" output="false" hint="Service to handle quotes of the day.">

    <!-- Function to retrieve the quote of the day -->
    <cffunction name="getQuoteOfTheDay" access="public" returntype="query" output="false" hint="Retrieve the quote of the day.">
        
        <!-- Get today's month and day -->
        <cfset todayMonth = dateFormat(Now(), "MM")>
        <cfset todayDay = dateFormat(Now(), "dd")>
        
        <!-- Try to retrieve the quote for today using quoteMonth and quoteDay -->
        <cfquery name="quoteOfTheDay">
            SELECT 
                quotename, 
                quoteauthor
            FROM 
                quotes 
            WHERE 
                quoteMonth = <cfqueryparam cfsqltype="cf_sql_varchar" value="#todayMonth#">
                AND quoteDay = <cfqueryparam cfsqltype="cf_sql_varchar" value="#todayDay#">
            ORDER BY 
                quotedate DESC
            LIMIT 1
        </cfquery>
        
        <!-- If no quote for today, retrieve a random quote with null quote date -->
        <cfif quoteOfTheDay.recordcount eq 0>
            
            <!-- Get a random quote with null quotedate -->
            <cfquery name="randomQuote">
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

            <!-- If a random quote exists, update the quotedate to today -->
            <cfif randomQuote.recordcount gt 0>
                <cfquery>
                    UPDATE quotes 
                    SET 
                        quotedate = <cfqueryparam cfsqltype="cf_sql_date" value="#dateFormat(Now(),'yyyy-MM-dd')#">,
                        quoteMonth = <cfqueryparam cfsqltype="cf_sql_varchar" value="#todayMonth#">,
                        quoteDay = <cfqueryparam cfsqltype="cf_sql_varchar" value="#todayDay#">
                    WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#randomQuote.id#">
                </cfquery>

                <!-- Return the random quote -->
                <cfreturn randomQuote>
            </cfif>

        <!-- If a quote for today exists, return it -->
        <cfelse>
            <cfreturn quoteOfTheDay>
        </cfif>
        
    </cffunction>

</cfcomponent>
