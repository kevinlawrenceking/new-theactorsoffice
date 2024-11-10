<cfset componentPath = "/services/AuditionQuestionsDefaultService.cfc">
<cfset auditionQuestionsService = createObject("component", componentPath)>
<cfset auditionQuestionsService.INSaudquestions_default(
    new_qTypeID = new_qTypeID,
    new_qtext = new_qtext,
    new_qorder = new_qorder,
    new_isDeleted = new_isDeleted
)>