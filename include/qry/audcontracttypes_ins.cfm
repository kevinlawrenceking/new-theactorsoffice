


<cfparam name="new_contracttype" default="" />

<cfparam name="new_audCatid" default="2" />

<cfparam name="new_isDeleted" default="0" />


<cfinclude template="/include/qry/audcontracttypes_ins_352_1.cfm" />


<cfset new_contracttypeid = result.GENERATEDKEY />

