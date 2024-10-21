










<cfquery  name="x"  >
 SELECT min(notid) as new_notid,actionid,userid,suid
                         FROM funotifications
                         
                         GROUP BY actionid,userid,suid
                         
                        HAVING COUNT(*) > 1
                        ORDER BY actionid,userid,suid
</cfquery>


<cfloop query="x">
<cfquery  name="rr"  >
update funotifications_tbl
                         
set isdeleted = 1 where notid = #x.new_notid#

</cfquery>



</cfloop>






<cfquery  name="de"  >
update actionusers_tbl
set isdeleted = 1
</cfquery>

<cfquery  name="u"  >
        SELECT * from taousers  
        </cfquery>

    <cfloop query="u">

        <cfquery  name="xs"  >
        SELECT actionid,actiondaysno,actiondaysrecurring from fuactions
        </cfquery>

        <cfloop query="xs">
            
            
            <cfquery  name="find"  >
            SELECT * from actionusers where actionid = #xs.actionid# and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                <cfquery  name="insert"  >
                    INSERT INTO `actionusers_tbl` (`actionid`,`userid`,`actiondaysno`<cfif #xs.actiondaysrecurring# is not "">,`actiondaysrecurring`</cfif>,`IsDeleted`) 
                    VALUES (#xs.actionid#, #u.userid#,#xs.actiondaysno#<cfif #xs.actiondaysrecurring# is not "">,#actiondaysrecurring#</cfif>, 0);
                </cfquery>
     
            </cfif>

        </cfloop>


    </cfloop>
        
