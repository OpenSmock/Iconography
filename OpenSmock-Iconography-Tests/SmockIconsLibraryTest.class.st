"
A SmockIconLibraryTest is a test class for testing the behavior of SmockIconLibrary
"
Class {
	#name : #SmockIconsLibraryTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Iconography-Tests-Core'
}

{ #category : #running }
SmockIconsLibraryTest >> setUp [ 

	super setUp.
	SmockIconsLibrary reset.
]

{ #category : #running }
SmockIconsLibraryTest >> tearDown [  

	super tearDown.
	SmockIconsLibrary reset.
]

{ #category : #tests }
SmockIconsLibraryTest >> testEmbeddedIcon [

	| icon |
	icon := (SmockIconsLibrary name: #faviconSmockWorkshop) form.
	self
		deny: icon
		identicalTo: SmockIconsLibrary currentThemeIcons notFound
]

{ #category : #tests }
SmockIconsLibraryTest >> testLibraryName [

	self assert: SmockIconsLibrary libraryName equals: 'Smock'
]

{ #category : #tests }
SmockIconsLibraryTest >> testNotFoundIcon [

	self
		assert: (SmockIconsLibrary name: #test_NotFoundIcon) form
		equals: SmockIconsLibrary currentThemeIcons notFound
]

{ #category : #tests }
SmockIconsLibraryTest >> testReset [

	| themeIcons |
	themeIcons := SmockIconsLibrary currentThemeIcons.
	SmockIconsLibrary reset.

	self
		deny: SmockIconsLibrary currentThemeIcons
		identicalTo: themeIcons
]

{ #category : #tests }
SmockIconsLibraryTest >> testSmockIconNamed [

	self assert: (self smockIconNamed: #faviconSmockWorkshop) identicalTo: ((SmockIconsLibrary name: #faviconSmockWorkshop) form)
]
