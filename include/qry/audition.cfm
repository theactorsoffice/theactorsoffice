<CFINCLUDE template="/include/projdate_fix_user.cfm" />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfset new_audprojectid = audprojectid />

<cfinclude template="/include/audintoevents_fix_audition.cfm">
    
    
<cfparam name="ctaction" default="" /> 
<cfparam name="new_contactid" default="" />
 <cfparam name="audid" default="0" />
<cfparam name="secid" default="176" />

<cfquery name="projectDetails" datasource="#dsn#" maxrows="1">
SELECT 
proj.`audprojectID`, 
r.audroleid,
proj.`projName`, 
proj.projDescription,
cat.`audCatName`, 
cat.audcatid,
subcat.`audSubCatName`, 
subcat.audsubcatid,
proj.audprojectdate,
proj.contactid,
ct.contracttype,
ton.tone, 
net.network,
un.`unionName`,    
c.recordname as castingFullName
,proj.isdirect
FROM audprojects proj 
    INNER JOIN audroles r on r.audprojectid = proj.audprojectid
    LEFT OUTER  JOIN audcontracttypes ct ON ( proj.`contractTypeID` = ct.contracttypeid  )  
	LEFT OUTER  JOIN audsubcategories subcat ON ( proj.`audSubCatID` = subcat.`audSubCatId`  )  
	LEFT OUTER  JOIN audcategories cat ON ( subcat.`audCatId` = cat.`audCatId`  )  
	LEFT OUTER JOIN audtones_user ton ON ( proj.`toneID` = ton.toneid  )  
	LEFT OUTER JOIN audnetworks_user net ON ( proj.`networkID` = net.networkid  )  
	LEFT OUTER JOIN contactdetails c on c.contactid = proj.contactid
	LEFT OUTER JOIN audunions un ON ( proj.`unionID` = un.`unionID`  )   
WHERE proj.audprojectID = #audprojectID#
</cfquery>
<cfset audroleid = projectDetails.audroleid />

<cfquery name="roleDetails" datasource="#dsn#">
SELECT 
r.`audroleid`,
r.audprojectid,
r.auddialectid,
r.`audRoleName`, 
r.`charDescription`, 
r.`holdStartDate`, 
r.`holdEndDate`, 
rt.audroletype, 
r.audroletypeid,
di.auddialect,
s.audsource,
r.audsourceid,
r.contactid,
r.payrate,
r.netincome,
r.buyout,
i.incometype,
r.iscallback,
r.isredirect,
r.ispin,
r.isbooked,
r.opencallid,
c.recordname as contactname,
p.paycycleid,
p.paycyclename,
b.submitsiteid,
b.submitsitename,
o.opencallname


FROM audroles r 
    LEFT OUTER JOIN audsubmitsites_user b on (r.submitsiteid = b.submitsiteid)
	LEFT OUTER JOIN audroletypes rt ON ( r.`audRoleTypeID` = rt.audroletypeid  )  
	LEFT OUTER JOIN auddialects_user di ON ( r.`audDialectID` = di.auddialectid  )  
    LEFT OUTER JOIN audsources s on (r.audsourceid = s.audsourceid)
    LEFT OUTER JOIN incometypes i on i.incometypeid = r.incometypeid
    LEFT OUTER JOIN contactdetails c on c.contactid = r.contactid
    LEFT OUTER join audpaycycles p on p.paycycleid = r.paycycleid
    LEFT OUTER join audopencalloptions_user o on o.opencallid = r.opencallid
WHERE r.audroleid = #audroleid#
</cfquery>
    <cfquery name="delete_ref" datasource="#dsn#">
   delete from `audcontacts_auditions_xref`
where `audprojectid` = #audprojectid#
       and `xrefNotes` = 'Referral';
    </cfquery>


<cfquery name="auditions" datasource="#dsn#">
    SELECT
    e.eventid,
    a.audid AS audid
    ,'Date' AS head1

    ,'Project' AS head2
    ,'Source' as head3
    ,'Type' as head4
    ,'Role' AS head5
    ,a.audstepid
    ,a.audstarttime
    ,a.audstartDate
    ,p.projname AS col2
    ,s.audsource AS col3
    ,t.audtype
    ,a.audlocation
    ,rt.audroletype AS col5
    ,st.audstep
    ,a.workwithcoach
    FROM auditions a

    LEFT JOIN audroles r ON r.audroleid = a.audroleid

    LEFT JOIN audprojects p ON p.audprojectID = r.audprojectID
    LEFT JOIN audsources s ON s.audSourceID = r.audSourceID
    LEFT JOIN audtypes t ON t.audtypeid = a.audtypeid
    LEFT JOIN audsteps st ON st.audstepid = a.audstepid
    LEFT JOIN audroletypes rt ON rt.audroletypeid = r.audroletypeid
    LEFT join events e on e.audid = a.audid
    WHERE a.isdeleted = 0 and p.isdeleted = 0 and r.isdeleted = 0 and a.isdeleted = 0
    AND r.audroleid = #audroleid#

    ORDER BY a.audstartDate
</cfquery>

<cfquery name="finda" datasource="#dsn#" maxrows="1">
    SELECT
    a.audid AS audid
    ,'Date' AS head1

    ,'Project' AS head2
    ,'Source' as head3
    ,'Type' as head4
    ,'Role' AS head5
    ,a.audstepid
    ,a.audstarttime
    ,a.audstartDate
    ,p.projname AS col2
    ,s.audsource AS col3
    ,t.audtype
    ,a.audlocation
    ,rt.audroletype AS col5
    ,st.audstep
    ,a.workwithcoach
    FROM auditions a

    LEFT JOIN audroles r ON r.audroleid = a.audroleid

    LEFT JOIN audprojects p ON p.audprojectID = r.audprojectID
    LEFT JOIN audsources s ON s.audSourceID = r.audSourceID
    LEFT JOIN audtypes t ON t.audtypeid = a.audtypeid
    LEFT JOIN audsteps st ON st.audstepid = a.audstepid
    LEFT JOIN audroletypes rt ON rt.audroletypeid = r.audroletypeid
    WHERE a.isdeleted = 0 and p.isdeleted = 0
    AND r.audroleid = #audroleid#

    ORDER BY a.audstartDate
</cfquery>
 


<cfif #ctaction# is "deleteContact">

    <cfquery name="delete" datasource="#dsn#">
    delete from `audcontacts_auditions_xref`
where `audprojectid` = #audprojectid# and 
`contactid` = #deletecontactid#;
    </cfquery>



    <cfset ctaction="view" />

    <cfset teamaction="view" />

    <cfset secid=175 />
    
    <cfelse>
        
        <cfset old_callbacktypeid =  0 />

</cfif>
    
 
    
     



    <cfif #ctaction# is "addmember" and "#autocomplete_aud#" is not "">
<cfoutput>        SELECT CONTACTID from contacts_ss WHERE userid = #userid# and col1 = '#autocomplete_aud#'</cfoutput> 

 <cfquery datasource="#dsn#" name="FINDK" maxrows="1">
        SELECT CONTACTID from contacts_ss WHERE userid = #userid# and col1 = '#autocomplete_aud#'
    </cfquery>

    <cfif #findK.recordcount# is "1">

        <cfset new_contactid=findk.contactid />

    <cfquery name="add_cd" datasource="#dsn#">
    INSERT IGNORE INTO `audcontacts_auditions_xref`
SET `audprojectid` = #audprojectid#,
        xrefNotes = '/qry/audition.cfm',
`contactid` = #new_contactid#;
    </cfquery>
        
        
        <cfif DateCompare(projectDetails.audprojectdate, Now()) lt 0>
            
                <cfquery name="findtag" datasource="#dsn#" maxrows="1">
            SELECT * FROM 
          `contactdetails` `d` 
          JOIN contactitems i ON i.contactid = d.contactid

          join `tags` `tu` on(
            
              convert(`tu`.`tagname` using UTF8) = `i`.`valueText`)
              
              WHERE d.contactid = #new_contactid# AND i.valuecategory = 'Tag'  AND  tu.tagtype = 'C'
            </cfquery>
            
            <cfif #findtag.recordcount# is "1">
              <cfset new_systemid=1 />
            <cfelse>
              <cfset new_systemid=2 />
            </cfif>
            
            
            
                  <cfset new_contactid=new_contactid />
           <cfset new_userid=userid />
         
            <cfset new_suStartDate = projectDetails.audprojectdate />
    

    <cfinclude template="/include/modalansweryes.cfm" />
            
            
        </cfif>

    </cfif>

            <cfquery name="x" datasource="#dsn#">
        SELECT distinct e.eventid 
         from       audprojects p
              INNER JOIN audroles r ON r.audprojectID = p.audprojectID  
              inner join auditions a on a.audroleid = r.audroleid
 
inner join events e on e.audid = a.audid
        where p.audprojectid = #audprojectid# AND a.isDeleted = 0 AND r.isdeleted = 0 AND p.isdeleted = 0
        </cfquery>
        
        <cfloop query="x">
        
        
        
                   
<cfquery datasource="#dsn#" name="find" maxrows="1">
Select * from eventcontactsxref where  eventid = #x.eventid# and contactid = #new_contactid#
</cfquery>
                
            
    <cfif #find.recordcount#  is "0">
        <cfquery datasource="#dsn#" name="f" maxrows="1">
            
            select recordname from contactdetails where contactid = #new_contactid#
        
        </cfquery>
        
        <cfoutput>
        event NO. #x.eventid# - #f.recordname# added<BR>
        </cfoutput>
    <cfquery datasource="#dsn#" name="inserts">
        Insert into  eventcontactsxref (eventid,contactid) values (
        <cfqueryparam cfsqltype="cf_sql_integer" value="#x.eventid#" />,
        <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />)
    </cfquery>
    
    </cfif>
    
   </cfloop>
        
    <cfset ctaction="view" />

    <cfset teamaction="view" />

    <cfset secid=175 />
        
        
        
        
        

</cfif>



    
    



<cfquery name="cdcheck" datasource="#dsn#">
SELECT p.audprojectid, p.contactid FROM audprojects p 

INNER JOIN audroles r ON r.audprojectID = p.audprojectID
WHERE p.isdeleted is FALSE
AND r.isdeleted IS FALSE
AND p.audprojectID = #audprojectID#
</cfquery>  
<cfif #cdcheck.contactid# is  "99999999">

<cfloop query="cdcheck">
   
    <cfquery name="add_cd" datasource="#dsn#">
    INSERT IGNORE INTO `audcontacts_auditions_xref`
SET `audprojectid` = #cdcheck.audprojectid#,
`contactid` = #cdcheck.contactid#;
    </cfquery>
</cfloop>
</cfif>
<cfset new_audcatid = projectdetails.audcatid />
<cfset new_subcatid = projectdetails.audsubcatid />

<cfquery name="sec_det" datasource="#dsn#">
Select * from pgpages where pgid = #secid#
    
</cfquery>

<cfquery name="options" datasource="#dsn#">
Select pgid,pgtitle from pgpages where pgdir = 'audition' and isdeleted is false
    <cfif #projectdetails.isdirect# is "1">
     and pgid <> 179
    </cfif>
</cfquery>


<cfquery name="audageranges_audtion_xref" datasource="#dsn#">
SELECT g.rangename, g.rangeid FROM audageranges g
INNER JOIN audageranges_audtion_xref x ON x.rangeid = g.rangeid
WHERE x.audroleid = #audroleid#
ORDER BY g.rangeid
 
</cfquery>

<cfquery name="audvocaltypes_audition_xref" datasource="#dsn#">
SELECT g.vocaltype FROM audvocaltypes g
INNER JOIN audvocaltypes_audition_xref x ON x.vocaltypeid = g.vocaltypeid
WHERE x.audroleid = #audroleid#
ORDER BY g.vocaltype
</cfquery>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
