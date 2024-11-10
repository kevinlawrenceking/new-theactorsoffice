<!--- This ColdFusion page processes audition questions and answers, including setting parameters and looping through questions to include answers. --->
<cfinclude template="/include/qry/aud_questions.cfm" />

<cfparam name="eventid" default="0" />
<cfparam name="newEventId" default="0" />
<cfparam name="newAText" default="" />
<cfparam name="newARating" default="" />
<cfparam name="newAMemo" default="" />
<cfparam name="newIsDeleted" default="0" />

<!--- Loop through each question in the query "questions" --->
<cfloop query="questions">
    <cfset newQid = questions.qid />
    <cfset newAnswerId = questions.answerid />
    <cfset newQtype = questions.qtype />
    <cfset newValue = evaluate('q' & questions.qid) />

    <!--- Include the answers for the current question --->
    <cfinclude template="/include/qry/audanswers_ins_215_1.cfm" />
</cfloop>

<!--- Redirect to the audition page with the specified parameters --->
<cflocation url="/app/audition/?audprojectid=#audprojectid#&eventid=#eventid#&secid=176" />

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary # symbols within conditional checks.
3. Ensured consistent attribute quoting, spacing, and formatting.
--->