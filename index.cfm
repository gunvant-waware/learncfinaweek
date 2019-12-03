<cfprocessingdirective pageEncoding="utf-8" suppressWhitespace="true" />
<h1>ColdFusion Tutorials</h1>
<cfdump var="#request#">
<h2>Setting Variables</h2>
<p>The variable name must start with a <em>letter</em> or an <em>underscore [ _ ]</em>. No other special characters are allowed in the variable name</p>
<cfset _myVar = 'Value'/>
<cfdump var="#_myVar#" label="_myVar">
<br/>
<cfset myVar = 'Value 2'/>
<cfdump var="#myVar#" label="myVar">
<br/>
<cfset dateToday = "Today is: "&now() />
<cfdump var="#dateToday#" label="dateToday">
<hr/>

<h2>cfoutput</h2>
<p>To display the contents of a variable to a user, use cfoutput. The variable reference must be a simple value that can be displayed as text. This includes Strings, Numbers, Dates, Times, and so on. Complex variables, such as Structs, Arrays, Queries, Functions, and so on, can not be displayed with the cfoutput command because they are not displayable as text.</p>
<p>USING CFOUTPUT</p>
<cfoutput>#dateToday#</cfoutput>
<hr/>
<h2>Data types</h2>
<h3>String/Numbers - isSimple: Yes</h3>
<p>Strings and numbers are very easy to work with. To set a string or a number, use the cfset command. To append strings and numbers to each other, use the <em>&</em> operator:</p>
<cfsavecontent variable="EmailContent">
    Hi

    We want to send you a hoverboard.
    Let us know if you will accept this free offer.

    -Us
</cfsavecontent>

<cfdump var="#EmailContent#" label="CFSAVECONTENT"/>

<cfset nNumber = 43 />
<cfset sString = "THis is a string!"/>

<cfdump var="#nNumber#" label="Number DataType">
<cfdump var="#sString#" label="String DataType"/>

<h3>Dates - isSimple: kind of</h3>
<p>Dates are also very easy to work with in ColdFusion. You can use built in functions like now() to make a date, or you can type the date into the variable assignment like this:</p>

<cfset DateToday = now()>
<cfset NewYearDay = "1/1/2019">
<cfdump var="#DateToday# #NewYearDay#" label="Now() and As a String">
<p>You can use built-in functions to work with dates. To show how many days it has been since the turn of the century:</p>
<cfset DaysSinceTurnOfCentury = DateDiff("d", "1/1/2000", now() )>
<cfdump var="#DaysSinceTurnOfCentury# Days" label="DaysSinceTurnOfCentury">

<h3>Arrays - isSimple: No</h3>
<p>Arrays are an ordered series of data. Here's an example of a one dimensional array:</p>
<cfset ThingsILike = ["Warm Sandy Beaches", "Tropical Drinks", 42]>
<cfdump var = "#ThingsILike#" label="ThingsILike">

<h4>Alternate method: arrayNew() function</h4>
<cfset ThingsILike = arrayNew(1)>
<cfset ThingsILike[1]  = "Warm Sandy Beaches">

<cfset ArrayAppend( ThingsILike,  "Tropical Drinks")>
<cfset ArrayAppend( ThingsILike,  42)>
<cfdump var="#ThingsILike#" label="Using ArrayNew() function">

<cfset twoDimArray = arrayNew(2) />
<p>Two dimentional array will the array of array: </p>
<!--- Index position 1 first array, and index position 2 in the second array--->

<cfset twoDimArray[1][2] = {'Key'='Value'}/>
<!--- Index position 2 first array, and index position 3 in the second array--->
<cfset twoDimArray[2][3] = '1 and 3'/>

<!--- And if you wish to delete the the element inside the first array then use ArrayDeleteAt(twoDimArray[1], indexPosition) --->

<cfdump var="#twoDimArray#" label="twoDimArray">

<h3>Structs - isSimple: No</h3>
<p>Structs, aka Structures, are a collection of data, stored by a key, or name. Suppose for example, you wanted to store several kinds of fruit and also whether you like it or not. Structs provide a way to organize like name/value pairs and let you refer to them as a single collection.</p>
<cfset FruitBasket = structNew()>

<cfset FruitBasket["Apple"] = "Like">
<cfset FruitBasket["Banana"] = "Like">
<cfset FruitBasket["Cherry"] = "Dislike">

<cfdump var = "#FruitBasket#" label="FruitBasket Structure">

<ul>
	<li>Adding Items to a Struct: Bracket Notation</li>
	<li>Adding Items to a Struct Dot Notation</li>
</ul>

<p>Pro Tip: There are reasons to use one struct notation over another. If you ran some of these examples you would notice that the Bracket Notation preserved the case of the keys and the Dot Notation did not. Sometimes the preservation of case is important, like when passing values to Javascript or other case sensitive languages or formats. In the Struct Creation and Population in One Statement Example, the case will be preserved as long as they keys are surrounded by quotes. If the keys are not quoted, the case will be converted to upper case.</p>

<p>Also, the bracket notation allows for a dynamic key reference. This is helpful when the name of the struct key will come from a runtime operation, such as looping over the struct. Many people find Dot Notation easier to read and use it most of the time, except in cases where Bracket Notation offers a feature Dot Notation does not.</p>

<h4>Displaying the Contents of a Struct</h4>
<p>See how your preference was mapped to the kind of fruit? You can't use the cfoutput command on structs either because, once again, they aren't displayable as a string. You can loop over the struct and output the keys and values to the page:</p>

<cfloop collection="#FruitBasket#" item="fruit">
	<cfdump var="#fruit#" label="Key: #fruit#">
    <cfoutput>I #FruitBasket[fruit]# #fruit#</cfoutput><br/><br/>
</cfloop>

<h3>Queries - isSimple: No</h3>

<p>Queries are recordsets. Recordsets contain a series of columns with 0 or more rows. You can think of a query like a single page of a spreadsheet with the columns across the top and rows down the side.</p>

<p>Most ColdFusion programs interact with databases. Database interaction takes the form of a query and ColdFusion makes it very easy to work with the data returned by the database. Databases will be covered more in more detail later on in the course.</p>

<!---<cfquery name="FruitQuery" datasource="fruit">
    SELECT Name, Price
    FROM FruitStore
    WHERE Price < 7
</cfquery>

<cfloop query="FruitQuery">
    #FruitQuery.Name# costs #FruitQuery.Price# <br>
</cfloop>--->

<p>Query Objects have a few special properties. You can use these properties to get specific information about the data inside the query.</p>

<ul>
<li>queryname.recordcount: How many rows does this query have?</li>
<li>queryname.columnlist: What columns does this query have?</li>
<li>queryname.currentrow: What row number are we currently on inside a cfoutput or cfloop?</li>
</ul>
<hr/>

<h1>Functions</h1>
<cfset fullName = getName() />
<cfoutput><h1>Welcome #fullName#!</h1></cfoutput>

<cfscript>
//void means the function doesnt return anything
public string function getName(required string firstName = 'Gunvant', string lastName = 'Waware'){
    variables.fullName = arguments.firstName & ' ' & arguments.lastName;
    return fullName;
}
</cfscript>

<cfset myCfc = createObject('component', 'mycfc') />
<strong>The variable declared inside the cfcomponent will be available to all the functions, doesnt matter where the variable is declared.
The variables declared at the end of the last function will still be available to all the functions inside the CFC</strong>
<p>GLobally declared this scope variables can be access after creating an object of the CFC just like accesing the function</p>
<cfdump var="#mycfc.MYCOMPONENTTHISSCOPE#" label="ThisScope after createObject"><br/>
<p>WHen you dump the CFC object you will see all the methods declared in it including public and private methods.</p>
<cfdump var="#myCFC#" label="myCfc CreateObject"><br/>

<p>YOu can not call a private method outside the CFC. I am trying to access the private privateFunction here:</p>
<cftry>
    <cfdump var="#myCfc.privateFunction()#"/><br/>
<cfcatch><cfoutput><p style="color: red; font-size: 18px;">#cfcatch.message#</p></cfoutput></cfcatch>
</cftry>
<p>However, you can access the private function inside the component only.</p>
<cfset myCfc.function1() />
<hr/>

<cfset Variables.MyName="Wilson">
<cfobject component="myCfc" name="myGreetings">
<cfoutput>
Before invoking the CFC, Variables.Myname is: #Variables.MyName#.<br/>
Passing Variables scope to hello method. It returns: #myGreetings.hello(Variables.MyName)#.<br/>
After invoking the CFC, Variables.Myname is: #Variables.MyName#.<br/>
</cfoutput>
<cfinvoke component="myCfc" method="VarScopeInCfc">