component accessors="true" {
 	
 	property name="baseGreeting" default="Hello, " type="string";

 	//init function
 	public function init(
 		string baseGreeting = variables.baseGreeting
 		){

 		setBaseGreeting(arguments.baseGreeting);
 		return this;

 	}//init greeting

 	// GetFullName Function
	public string function getFullName(
		required string firstName, required string lastName
		){
		var fullName = arguments.firstName &' '& arguments.lastName;
		return fullName;
	} //End GetFUllName Function


	//getGreeting function
	public string function getGreeting(
		required string firstName,
		required string lastName,
		string baseGreeting = getBaseGreeting()
		){
		var getFullName = getFullName(arguments.firstName, arguments.lastName);
		var greeting = arguments.baseGreeting & getFullName;
		return greeting;
	} //End getGreeting function


}