 <CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="questions" datasource="#dsn#" >
    select 
	 q.qid,
	 q.qtext,
	 q.qtypeid,
	 q.qorder,
	 a.answerID,
	 a.audID,
	 a.aText,
	 a.aRating,
	 a.amemo,
	 qt.qtype
	 
	  from audquestions_user q
	 
	 INNER JOIN audanswers a ON a.qID = q.qid
	 
	 INNER JOIN audqtypes qt ON qt.qtypeid = q.qtypeid
	 
	 WHERE a.audid = <cfqueryparam cfsqltype="cf_sql_integer" value="#audid#"> 
    
    
    
    AND a.isdeleted IS FALSE 
    
    AND q.isDeleted IS false
	  
	 ORDER BY q.qorder

</cfquery>
 