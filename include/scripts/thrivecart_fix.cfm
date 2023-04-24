 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
SELECT * FROM taousers u INNER JOIN thrivecart t ON t.id = u.customerid
</cfquery>
 
 <cfloop query="x">
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"  >
update thrivecart 
set customerfirst = '#x.userfirstname#'
,customerlast = '#x.userlastname#'
  ,customeremail = '#x.useremail#'  
  ,customerfullname = '#x.userfirstname# #x.userlastname#'  
where id = #x.id#
</cfquery>
</cfloop>
 
 
 