<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="audprojectid" default="0" />

<cfparam name="updatenoteid" default="0" />

 
<cfquery name="notesaud" datasource="#dsn#" >
SELECT
n.noteID
,n.noteTimestamp 
, n.noteid as recid   
,'Date' as head1
,'Time' as head2
,'Relationships' as head3
,'Status' as head4
,'Details' as head5
,n.noteDetails
,n.noteTimestamp as col1
,n.noteTimestamp as col2
,n.isPublic as col4
,n.noteDetails as col5
,n.noteDetailsHTML 
,n.userID
FROM noteslog n
    
 

WHERE n.audprojectid = #audprojectid# and n.audprojectid <> 0
ORDER BY n.noteTimestamp DESC
</cfquery>

<cfquery name="notesContactDetails"  maxrows="1" datasource="#dsn#"   >
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