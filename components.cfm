<cfprocessingdirective pageEncoding="utf-8" suppressWhitespace="true" />
<h1>CF Components</h1>
<p>Components in CF behave like the objects in many other programming languages.</p>
<p>Components have <strong>properties</strong> - both publilc and private and <strong>methods(functions)</strong></p>
<p>Properties are like lables, you can read the labels and change its value.</p>

<!--- <cfobject name="myGreeting" component="Greeting" type="component" /> --->
<!--- <cfinvoke method="getGreeting" component="#myGreeting#" returnvariable="return" firstName="" lastName="" /> --->
<!--- <cfinvoke method="getGreeting" component="Greeting" returnvariable="return" firstName="" lastName="" />
<cfdump var="#return#"> --->
<cfscript>
	str['firstName'] = 'Gunya';
	str['lastName'] = '';
	// myGreeting = invoke( myGreeting, 'getGreeting', str);

	// writeOutput( '<h1>#myGreeting#</h1>' );

	objGreeting = createObject( 'component', 'Greeting').init('Kasaa haay, ');
	myGreeting = invoke(objGreeting, 'getGreeting', str)
	// myGreeting = objGreeting.init('Kaisa Hai re tu, ').getGreeting(argumentCollection=str);

	writeOutput( '<h1>#myGreeting#</h1>' );
</cfscript>

<h1>Java Objects</h1>

<cfscript>
	javaObj = createObject('java', 'java.lang.Runtime').getRunTime();
	writeDump(javaObj);
	// r = invoke(javaObj, 'freeMemory');
	writeDump(var = javaObj.freeMemory(), label="javaObjFreeMemory");
	writeDump(var = javaObj.maxMemory(), label="javaObjMaxMemory");
	writeOutput('<hr/>');
	myObj = createObject('java', 'java.lang.System');
	writeDump(var=myObj.console(), label='myobjConsole');
	writeDump(var=myObj, label="myOBJSystem");
</cfscript>
