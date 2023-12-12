<cfset dbugz = "N" />
<cfset dbug = "N" />
 
<cfparam name="t0" default="0" />

<cfparam name="t1" default="0" />

<cfparam name="t2" default="0" />

<cfparam name="t3" default="0" />

<cfparam name="t4" default="0" />

<cfparam name="t5" default="0" />

<cfparam name="t6" default="0" />

<cfparam name="t7" default="0" />

<cfparam name="t8" default="0" />

<cfparam name="t9" default="0" />

<cfparam name="t10" default="0" />

<cfparam name="tab0_expand" default="false" />

<cfparam name="tab1_expand" default="false" />

<cfparam name="tab2_expand" default="false" />

<cfparam name="tab3_expand" default="false" />

<cfparam name="tab4_expand" default="false" />

<cfparam name="tab5_expand" default="false" />

<cfparam name="tab6_expand" default="false" />

<cfparam name="tab7_expand" default="false" />
<cfparam name="tab8_expand" default="false" />

<cfparam name="tab9_expand" default="false" />

<cfparam name="tab10_expand" default="false" />

<cfset tab0_expand="false" />

<cfset tab1_expand="false" />

<cfset tab2_expand="false" />

<cfset tab3_expand="false" />

<cfset tab4_expand="false" />

<cfset tab5_expand="false" />

<cfset tab6_expand="false" />

<cfset tab7_expand="false" />

<cfset tab8_expand="false" />

<cfset tab9_expand="false" />

<cfset tab10_expand="false" />

<cfsavecontent variable = "varcheck"><Cfoutput>
T1: #t1#<BR>
T2: #t2#<BR>
T3: #t3#<BR>
T4: #t4#<BR>
</Cfoutput></cfsavecontent>

<cfif t1 eq 1>

    <cfset tab1_expand = "true" />

    <cfelseif t0 eq 1>
    
    <cfset tab0_expand = "true" />

<cfelseif t2 eq 1>
    
    <cfset tab2_expand = "true" />
    
<cfelseif t3 eq 1>
    
    <cfset tab3_expand = "true" />
    
<cfelseif t4 eq 1> 
    
    <cfset tab4_expand = "true" />
    
<cfelseif t5 eq 1> 
    
    <cfset tab5_expand = "true" />
    
<cfelseif t6 eq 1> 
    
    <cfset tab6_expand = "true" />
    
<cfelseif t7 eq 1> 
    
    <cfset tab7_expand = "true" />
    
<cfelseif t8 eq 1> 
    
    <cfset tab8_expand = "true" />

    <cfelseif t9 eq 1> 

    
    <cfset tab9_expand = "true" />
<cfset tab1_expand="false" />

<cfelseif t10 eq 1> 
    <cfset tab10_expand = "true" />
</cfif>
    
    <cfif t0 + t1 + t2 + t3 + t4 + t5 + t6 + t7 + t8 + t9 + t10 eq 0><cfset t0 = 1 /><cfset tab0_expand = "true" /><cfelse>
    <cfset  tab0_expand = "false" /></cfif>
    
    <cfsavecontent variable = "varif"><Cfoutput>
IF: if #t1# is "0" and #t2# is "0" and #t3# is "0" and #t4# is "0" and #t5# is "0" and #t6# is "0"<BR>
</Cfoutput></cfsavecontent>
        
    
    <cfoutput>


    <cfif #t1# is "0" and #t2# is "0" and #t3# is "0" and #t4# is "0" and #t5# is "0" 
    and #t6# is "0"  and #t7# is "0" and #t8# is "0" and #t9# is "0" and #t0# is "0" and #t10# is "0" ><cfset tab0_expand = "true" /></cfif>
    </cfoutput>
        
        <cfsavecontent variable = "varafter"><Cfoutput>
T1: #t1#<BR>
T2: #t2#<BR>
T3: #t3#<BR>
T4: #t4#<BR>
</Cfoutput></cfsavecontent>


    
  <Cfif #isdefined('dbufg')#>  <cfoutput>#varcheck#<BR>#varif#<BR>var after: #varafter# #tab1_expand#</cfoutput><cfabort></Cfif>
   

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

