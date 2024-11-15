<cfquery  name="insert">
            INSERT INTO contactitems (contactid,valuetype,valuecategory,valuetext,itemstatus, primary_yn)
            VALUES (#new_contactid#,'Tags','Tag','My Team','Active', 'Y')
        </cfquery>
