"
A SmockIconLibraryTest is a test class for testing the behavior of SmockIconLibrary
"
Class {
	#name : #SmockIconLibraryTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Iconography-Tests-Core'
}

{ #category : #tests }
SmockIconLibraryTest >> setUp [ 

	super setUp.
	SmockIconLibrary reset.
]

{ #category : #tests }
SmockIconLibraryTest >> tearDown [  

	super tearDown.
	SmockIconLibrary reset.
]

{ #category : #tests }
SmockIconLibraryTest >> testEmbeddedIcon [

	| icon |
	icon := SmockIconLibrary name: #faviconSmockWorkshop.
	self deny: icon identicalTo: (SmockIconLibrary current notFound).
]

{ #category : #tests }
SmockIconLibraryTest >> testLibraryName [

	self assert: SmockIconLibrary libraryName equals: 'Smock'
]

{ #category : #tests }
SmockIconLibraryTest >> testNotFoundIcon [

	self assert: (SmockIconLibrary name: #test_NotFoundIcon) equals: (SmockIconLibrary current notFound).
]

{ #category : #tests }
SmockIconLibraryTest >> testReset [

	| themeIcons |
	themeIcons := SmockIconLibrary current.
	SmockIconLibrary reset.
	
	self deny: (SmockIconLibrary current) identicalTo: themeIcons. 
]

{ #category : #tests }
SmockIconLibraryTest >> testSmockIconNamed [

	self assert: (self smockIconNamed: #faviconSmockWorkshop) identicalTo: (SmockIconLibrary name: #faviconSmockWorkshop)
]
