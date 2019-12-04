<cfprocessingdirective pageEncoding="utf-8" suppressWhitespace="true">
	<h1>Custom Tags</h1>
	<p>For displaying code on front end, another option is to use a Custom Tag</p>
	<p>-Live on their own directory and prefix with 'cf_'</p>
	<p>executionMode='start' - Tag is being opened</p>
	<p>executionMode='end' - Tag is being closed</p>

	<p>This can be actieved by setting up if statement thisTag.executionMode EQ 'start'</p>

	<h1>Using cf_</h1>
	<cf_greeting firstName="Gunvant" lastName="Waware" />

	<h1>Using cfimport tag</h1>
	<p>You can also use cfimport to bring multiple tags in your page and put them in their own namespace.</p>
	<p>Takes only two arguments. prefix and tagLib</p>

	<!--- <cfimport taglib="customTags" prefix="display"/> --->
	<cfimport taglib="./customTags" prefix="display"/>
	<display:greeting firstName="This is" lastName="Custom Tag Using CFIMPORT"/>

	<h1>Using CfModule</h1>
	<p>This is the simplest way to call a CustomTag</p>
	<cfset variables.myStruct = structNew() />
	<cfset variables.myStruct['firstName'] = 'Gunya' />
	<cfset variables.myStruct['lastName'] = 'Wawarya' />
	<p>Passing as an attributes to the tags</p>
	<cfmodule template="greeting.cfm" firstName="Gunvant Madhukar" lastName="Waware"/>
	<h3>OR</h3>
	<p>Using AttributeCollection in cfmodule</p>
	<cfmodule template="greeting.cfm" attributecollection = "#variables.myStruct#"/>
</cfprocessingdirective>