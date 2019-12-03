<cfprocessingdirective pageEncoding="utf-8" suppressWhitespace="true">
	<h1>OOP and ColdFusion</h1>
	<p>Object-Oriented Programming is common term in programming language. It’s a vast concept but to sum it up in a single line, it is a set of concepts and techniques that make use of the <span class="code">"object"</span> construct, to write more reusable, maintainable, and organized code. Objects are implemented differently in every language. In ColdFusion, we have ColdFusion Components (CFCs) that can be instantiated to create objects.</p>
	<ul>
		<li>Abstraction</li>
		<li>Encapsulation</li>
		<li>Inheritance</li>
		<li>Polymorphism</li>
	</ul>

	<h2 class="underline">Abstraction</h2>
	<p>The main goal of abstraction is to handle complexities by hiding unnecessary details from user. Like when we drive a car, we are unaware of how the engine works. Abstraction is implemented in most languages by defining a class that has methods, properties & constructors.</p>
	<p>In ColdFusion, class is simply a CFC. A CFC has private & public properties as well as methods. Variables defined in <span class="code">this</span> scope of CFC are public, while those in <span class="code">variables</span> scope are accessible to CFC. You can also define variables that are private to methods by defining them in <span class="code">local</span> scope. CFCs can be instantiated by either using <span class="code">CreateObject()</span> or the <span class="code">new</span> operator.</p>
	<hr/>

	<h2 class="underline">Encapsulation</h2>
	<p>Encapsulation is the concept of <span class="code">keeping data & the methods operating on this data in a single unit, i.e. class.</span> This concept also involves information hiding - <span class="code">(Abstraction)</span>. The basic idea is to bundle accessor methods with data that are not visible from outside of a class. Accessor methods are the methods that give read/write access to private data, commonly known as <span class="code">getter/setter</span> methods.</p>
	<p>In ColdFusion, you can define accessors for CFC properties. ColdFusion can automatically generate accessors if you set the property <span class="code">accessor</span> as <span class="code">true</span> for a CFC.</p>
	<hr/>

	<h2 class="underline">Inheritance</h2>
	<p>Inheritance is a <span class="code">way to reuse existing code</span>, or a way to write code in one location that many objects can make use of. <span class="code">When an object of class B inherits from class A, object B contains all the code — that is, methods and data — from class A, plus all the code from object B.</span></p>
	<p>In ColdFusion, CFCs can extend to inherit functions & properties. <span class="code">ColdFusion does not allow multiple inheritance but a CFC can implement multiple interfaces</span>. Interfaces can be extended too.</p>

	<h3>Types of Inheritance</h3>
	<ul>
		<li>Single</li>
		<li>Multi-level</li>
		<li>Multiple</li>
		<li>Hierarchical</li>
		<li>Hybrid</li>
		<li>Multipath</li>
	</ul>
	<div class="_it">
		<div class="image">
			<img src="./images/types-of-inheritance.png" />
		</div>
	</div>
	<hr/>
	<h2 class="underline">Polymorphism</h2>
	<p>Polymorphism describes the concept that objects of different types can be accessed through the same interface. In most languages, polymorphism is implemented by <span class="code">Method Overloading</span> & <span class="code">Method Overriding</span>.</p>
	<p>In ColdFusion, we support <span class="code">Method Overriding</span>. This means that a child CFC can override parent CFC’s method to to customize or completely replace the behavior of that method.</p>
	<hr/>
	<h2 class="underline">Abstract Classes and methods</h2>
	<p>An abstract class allows you to make a <span class="code">template</span> for classes that will eventually inherit from it, without writing unnecessary code for a parent class that is never instantiated. Therefore, abstract class cannot be instantiated but can be extended.</p>
	<p>Abstract classes can have both <span class="code">abstract</span> and <span class="code">concrete</span> methods. Abstract methods have no body. Declaring abstract methods in a class allows you to specify certain methods that must be implemented by the inheriting classes. In an inheritance hierarchy the first non-abstract class should implement all the abstract methods.</p>
	<p>Abstract Component & Methods have been introduced in the newest version of ColdFusion, ColdFusion 2018. They can be defined using the keyword <span class="code">abstract</span>. <span class="underline">A non-abstract CFC cannot have abstract methods whereas an abstract CFC can have both abstract and concrete methods.</span></p>
	<p>Let’s create a CFC wild kingdom to understand this concept.</p>

	<p>At the highest level is an Animal CFC. This is an <span class="code">abstract CFC</span> that encapsulates methods and data that are common to any kind of animal. This includes the animal’s size and type. This CFC cannot be instantiated. It can be extended and has concrete and abstract methods. Abstract methods defined are, <span class="code">eat()</span> and <span class="code">makeNoise()</span>.  <span class="code">These must be overridden by subclass of Animals.</span></p>
	<div class="cf-code">
		<pre>
			abstract component displayName="Animal" hint="Abstract Animal CFC."{
	
				property animalSize;
				property animalType;
				
				function init(animalSize,animalType){
					
					variables.instance.animalSize = arguments.animalSize
					variables.instance.animalType = arguments.animalType 
				}

				// Abstract Methods have no body
				// Declaring abstract methods in a class allows you to specify certain methods that must be
				//implemented by the inheriting classes

				abstract function eat(any prey="")
				abstract function makeNoise()
				
				function getanimalSize(){
					return variables.instance.animalSize
				}
				
				function getanimalType(){
					return variables.instance.animalType
				}
		}
		</pre>
	</div>
	<p>Mammal CFC is a subclass of Animal. Just like Animal, the purpose of the Mammal CFC is to wrap up data and methods common to all Mammals. In this example, Mammal doesn’t do much, but you can imagine it handling methods like growHair(). Mammal is also an abstract CFC, like Animal.</p>
	<div class="cf-code">
		<pre>
			abstract component extends="Animal" displayName="Mammal" hint="Abstract Mammal CFC."{
	
				function init(mammalSize,mammalType){
					super.init( arguments.mammalType, arguments.mammalSize )
					return this
				}
			}
		</pre>
	</div>
	<p>I’ve created CFCs that extend Mammal: a Mouse and a Feline. Mouse is a concrete CFCs, which means you can create instances of these CFCs.</p>
	<div class="cf-code">
		<pre>
			component extends="mammal" displayName="Mouse" hint="Concrete CFC Mouse."{
         
         function init(){
             super.init( 'Mouse', 'small' ) 
             return this
         }
         function eat(any cheese){
            return "I like #cheese#."
         }
         function makeNoise(){
            return "Squeak." 
         }
			}
		</pre>
	</div>
	<p>Feline is another abstract class which could encapsulate methods that apply to all felines, like purr().</p>
	<div class="cf-code">
		<pre>
			abstract component extends="Mammal" displayName="Feline" hint="Abstract Feline CFC."{
        
        function init(felineSize,felineType){
                super.init( arguments.felineType, arguments.felineSize )
                variables.instance.isPurring = false
                return this
         }
 		}
		</pre>
	</div>

	<p>And finally, the concrete subtypes of Feline are Tiger and Housecat.Tiger and Housecat have their own way of handling method calls like eat() and makeNoise().</p>
	<div class="cf-code">
		<pre>
			component extends="feline" displayName="Tiger" hint="Concrete CFC Tiger."{
            
         function init(){
                super.init( 'Tiger', 'large' )
                return this 
         }
         function eat(Animal prey){
              if( arguments.prey.getAnimalSize() eq 'large')
                    return "Crunch...gulp. Mmmmmm." 
              else
                    return "Are you crazy? I can't eat that!" 
         }

         function makeNoise(){
               return "ROAR!!!!" 
         }
			}

			component extends="Feline" displayName="HouseCat" hint="Concrete CFC Housecat."{
			           
          function init(){
                 super.init( 'Housecat', 'small' )
                 return this
           }
         function eat(Animal prey){
                if( arguments.prey.getAnimalSize() eq 'small')
                     return "Crunch...gulp. Mmmmmm." 
                else
                     return "Are you crazy? I can't eat that!" 
         }
         function makeNoise(){
             return "Meow." 
        }
		 }
		</pre>
	</div>
	<p>Let’s check what my animals eat what & what noise do they make.</p>
	<div class="cf-code">
		<pre>
			&lt;cfscript&gt;
			 minimouse=new Mouse();
			 writeoutput("MiniMouse :" minimouse.makenoise() & "&lt;br/&gt;");
			 writeoutput(minimouse.eat("cheese") & "&lt;br/&gt;");
			 mykitty=new HouseCat();
			 writeoutput(mykitty.eat(minimouse));
			&lt;/cfscrip&gt;>
		</pre>
	</div>
</cfprocessingdirective>