<cfparam name="select_userid" default="%"/>
<cfparam name="select_ticketstatus" default="%"/>
<cfparam name="select_tickettype" default="%"/>
<cfparam name="select_ticketpriority" default="%"/>
<cfparam name="select_pgid" default="%"/>
<cfparam name="select_verid" default="%"/>

<!-- Main query for fetching ticket results -->
<cfinclude template="/include/qry/results_330_1.cfm" />

<!-- Query for ticket priorities -->
<cfinclude template="/include/qry/priorities_330_2.cfm" />

<!-- Query for versions with available hours calculation -->
<cfinclude template="/include/qry/vers_330_3.cfm" />

