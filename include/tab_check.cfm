<cfset dbugz = 'n' />

<cfparam name="t1" default="1" />

<cfparam name="t2" default="0" />

<cfparam name="t3" default="0" />

<cfparam name="t4" default="0" />

<cfif #t1# is not "0">
<Cfif t1 + t2 + t3 + t4 eq 2>
    <cfset t1 = 0 />
</Cfif>
</cfif>

<cfparam name="contact_expand" default="true" />

<cfparam name="appointments_expand" default="false" />

<cfparam name="notes_expand" default="false" />

<cfparam name="relationship_expand" default="false" />


<cfset contact_expand="false" />

<cfset appointments_expand="false" />

<cfset notes_expand="false" />

<cfset relationship_expand="false" />


<cfsavecontent variable = "varcheck"><Cfoutput>
T1: #t1#<BR>
T2: #t2#<BR>
T3: #t3#<BR>
T4: #t4#<BR>
</Cfoutput></cfsavecontent>
    
          <cfif #dbugz# is "Y">
              <cfoutput>varcheck:#varcheck#<BR></cfoutput> <cfoutput>t1:#t1#<BR></cfoutput>
    </cfif>

<cfif t1 eq 1>
      <cfif #dbugz# is "Y">
              <cfoutput>t1:#t1#<BR></cfoutput>
    </cfif>
    <cfset contact_expand = "true" />

<cfelseif t2 eq 1>
    
    <cfset appointments_expand = "true" />
    
<cfelseif t3 eq 1>
    
    <cfset notes_expand = "true" />
    
<cfelseif t4 eq 1> 
    
    <cfset relationship_expand = "true" />

</cfif>
    
    <cfif t1 + t2 + t3 + t4 eq 0><cfset t1 = 1 /></cfif>
    
    <cfsavecontent variable = "varif"><Cfoutput>
IF: if #t1# is "0" and #t2# is "0" and #t3# is "0" and #t4# is "0"<BR>
</Cfoutput></cfsavecontent>
        
    
    <cfoutput>
    <cfif #t1# is "0" and #t2# is "0" and #t3# is "0" and #t4# is "0" ><cfset contact_expand = "true" /></cfif>
    </cfoutput>
        
        <cfsavecontent variable = "varafter"><Cfoutput>
T1: #t1#<BR>
T2: #t2#<BR>
T3: #t3#<BR>
T4: #t4#<BR>
</Cfoutput></cfsavecontent>
    
      <cfif #dbugz# is "Y">
            <Cfoutput> varif:#varif#<BR>varafter:#varafter#
             <p>notes_expand: #notes_expand#</p>
          <p>contact_expand: #contact_expand#</p></Cfoutput>
           <Cfabort>
            
            </cfif>      


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
