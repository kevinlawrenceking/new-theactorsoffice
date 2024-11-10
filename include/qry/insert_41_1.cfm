<cfset componentPath = "/services/AuditionAnswerService.cfc">
<cfset auditionAnswerService = createObject("component", componentPath)>
<cfset auditionAnswerService.DELaudanswers(eventid=eventid)>