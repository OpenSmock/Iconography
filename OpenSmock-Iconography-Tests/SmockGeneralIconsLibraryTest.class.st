"
A SmockTestIconsLibraryTest is a test class for testing the behavior of SmockTestIconsLibrary
"
Class {
	#name : #SmockGeneralIconsLibraryTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Iconography-Tests-Core'
}

{ #category : #tests }
SmockGeneralIconsLibraryTest >> setUp [ 

	super setUp.
	SmockTestIconsLibrary reset.
]

{ #category : #tests }
SmockGeneralIconsLibraryTest >> tearDown [ 

	super tearDown.
	SmockTestIconsLibrary reset.
]

{ #category : #tests }
SmockGeneralIconsLibraryTest >> testInstallEmbeddedIcon [

	| form |
	self
		assert: (SmockTestIconsLibrary name: #myIcon)
		equals: SmockTestIconsLibrary currentThemeIcons notFound.

	form := Form extent: 10 @ 10.
	SmockTestIconsLibrary installEmbeddedIcon: form name: #myIcon.
	self assert: (SmockTestIconsLibrary name: #myIcon) equals: form
]
