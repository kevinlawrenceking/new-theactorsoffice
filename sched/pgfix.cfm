
<cfquery  name="z">
Select pgid from pgpages where pgid in (128,128)
</cfquery>

<cfloop  query="z">
    
    
<cfquery  name="x">
SELECT * FROM pgpagespluginsxref WHERE pgid = 36
</cfquery>

<cfloop query="x">
<cfquery  name="i">
insert into pgpagespluginsxref (pluginid,pgid,isdeleted)
    values (#x.pluginid#,#z.pgid#,0)
    </cfquery>
</cfloop>
    

</cfloop>
