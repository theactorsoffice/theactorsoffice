<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="contactid" default="1" />
<cfparam name="updatenoteid" default="0" />
<cfquery name="notesRelationship" datasource="#dsn#" >
SELECT
n.noteID
 , n.noteid as recid   
,'Date' as head1
,'Time' as head2
,'Relationships' as head3
,'Status' as head4
,'Details' as head5
    ,n.notetimestamp
,n.noteTimestamp as col1
,n.noteTimestamp as col2
 ,n.noteDetails 
    
    
    ,d.contactfullname AS col3

,n.isPublic as col4
    ,n.noteDetails as col5
,n.noteDetailsHTML
    ,n.userID
,n.contactID
    
    
FROM noteslog n
    
    INNER JOIN contactDetails d on d.contactid = n.contactid

WHERE n.userID = #session.userid#

AND n.contactid = #contactid#
    
ORDER BY n.noteTimestamp DESC
</cfquery>





<cfquery name="notesContactDetails"  maxrows="1"   >
SELECT

n.noteID
,n.noteDetails
,n.userID
,n.noteTimestamp
,n.contactID
,n.isPublic
,d.contactFullName as fullname
FROM noteslog n
    INNER JOIN contactDetails d on d.contactid = n.contactid

WHERE n.noteid = #updatenoteid#
</cfquery>