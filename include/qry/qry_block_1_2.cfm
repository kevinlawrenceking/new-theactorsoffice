<cfset UserService = createObject("component", "services.UserService")>

<cfset UserService.UPDtaousers_23945(
    userid=userid,
    new_userfirstname=new_userfirstname,
    new_userlastname=new_userlastname,
    new_avatarname=new_avatarname,
    new_useremail=new_useremail,
    add1= form.add1,
    add2=form.add2,
    city=city,
    zip=zip,
    region_id=region_id,
    countryid=countryid
)>