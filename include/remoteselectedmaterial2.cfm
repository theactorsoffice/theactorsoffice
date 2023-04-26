<cfset userid=session.userid />

<CFINCLUDE template="/include/remote_load.cfm" />
    <cfquery name="ins" datasource="#dsn#"   >   
     delete from audmedia_auditions_xref where mediaid = #mediaid# and audprojectid = #audprojectid# 
</cfquery>

    <cfquery name="ins" datasource="#dsn#"   >   
        insert into audmedia_auditions_xref (mediaid,audprojectid) values (#mediaid#,#audprojectid#)
</cfquery>


     <cfoutput>
     <cfset returnurl = "/app/audition/?audprojectid=#audprojectid#&secid=177" />
     </cfoutput>
	 
	 <cflocation url="#returnurl#" >

 