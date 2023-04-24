 <cfquery datasource="abod" name="x">
     SELECT * from auditions where userid is not null
 </cfquery>


 <cfloop query="x">
     <cfset new_audid=x.audid />
     <cfset new_userid=x.userid />

     <cfquery datasource="abod" name="y">
         SELECT audlocid FROM audlocations WHERE userid = #new_userid# ORDER BY RAND() LIMIT 1
     </cfquery>

     <cfset new_audlocid=y.audlocid />

     <cfquery datasource="abod" name="a">
         update auditions set audlocid = #new_audlocid# where audid = #new_audid#
     </cfquery>

 </cfloop>