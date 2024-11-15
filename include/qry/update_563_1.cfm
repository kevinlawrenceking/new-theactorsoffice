<cfquery  name="update">
            update contactitems_tbl set isdeleted = 1 where itemid = #new_itemid#
        </cfquery>
