<cfif #usercustomerid# is "">
<cfset usercustomerid = 0 />
</cfif>
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="thrivecartDetails" datasource="#dsn#"  >	
SELECT 
t.purchasedate
,t.trialdays
,t.trialenddate
,t.invoiceid
,t.customerid
,p.PlanName
,r.BaseProductLabel
FROM thrivecart t INNER JOIN paymentplans p ON p.basepaymentplanid = t.basepaymentplanid INNER JOIN products r ON r.BaseProductId = t.baseproductid
WHERE t.id = #usercustomerid#
</cfquery>		
 <cfif #thrivecartdetails.recordcount# is "0">
<cfquery name="thrivecartDetails" datasource="abo" maxrows="1" >	
SELECT 
t.purchasedate
,t.trialdays
,t.trialenddate
,t.invoiceid
,t.customerid
,p.PlanName
,r.BaseProductLabel
FROM thrivecart t INNER JOIN paymentplans p ON p.basepaymentplanid = t.basepaymentplanid INNER JOIN products r ON r.BaseProductId = t.baseproductid

</cfquery>		


</cfif>