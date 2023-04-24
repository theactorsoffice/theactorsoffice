<cfquery name="shares"  >	
select * from shares where userid = #session.userid#
</cfquery>		


