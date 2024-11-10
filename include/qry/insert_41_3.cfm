<cfset componentPath = "/services/AuditionAnswerService.cfc">
<cfset auditionAnswerService = createObject("component", componentPath)>
<cfset auditionAnswerService.INSaudanswers(qid=x.qid, eventid=eventid)>