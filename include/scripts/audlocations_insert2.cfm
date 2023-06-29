 <cfquery datasource="abod" name="x">
     SELECT * from events where userid is not null
 </cfquery>


 <cfloop query="x">
     <cfset new_eventid=x.eventid />
     <cfset new_userid=x.userid />

     <cfquery datasource="abod" name="y">
         SELECT audlocid FROM audlocations WHERE userid = #new_userid# ORDER BY RAND() LIMIT 1
     </cfquery>

     <cfset new_audlocid=y.audlocid />

     <cfquery datasource="abod" name="a">
         update events set audlocid = #new_audlocid# where eventid = #new_eventid#
     </cfquery>

 </cfloop>