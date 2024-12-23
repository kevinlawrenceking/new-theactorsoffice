<cfset contactService = createObject("component", "services.ContactService")>

<!--- Simulate form submission or variable inputs --->
<cfparam name="form.fname" default="">
<cfparam name="form.lname" default="">
<cfparam name="form.contactMeetingDate" default="">
<cfparam name="form.contactMeetingLoc" default="">
<cfparam name="form.birthday" default="">

<!--- Construct contact struct dynamically from submitted variables --->
<cfset new_X = {
    fname = trim(form.fname),
    lname = trim(form.lname),
    contactMeetingDate = trim(form.contactMeetingDate),
    contactMeetingLoc = trim(form.contactMeetingLoc),
    birthday = trim(form.birthday)
}>

<!--- Call the function and pass variables --->
<cfset result = contactService.INScontactdetails_24399(new=new_x, userid=userid)>
