<cfquery  name="update">
        update taousers
        set userfirstname = '#new_userfirstname#'
        ,userlastname = '#new_userlastname#'
        ,avatarname = '#new_avatarname#'
        ,useremail = '#new_useremail#'

        ,add1 = '#add1#'
        ,add2 = '#add2#'
        ,city = '#city#'
        ,zip = '#zip#'
        ,region_id = #region_id#
        ,countryid = '#countryid#'
 

 
        where userid = #userid#
    </cfquery>
