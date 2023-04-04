"
A MateriaDesignIconsLibrary400Test is a test class for testing the behavior of MateriaDesignIconsLibrary400
"
Class {
	#name : #MaterialDesignIcons4LibraryTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Iconography-Tests-Core'
}

{ #category : #running }
MaterialDesignIcons4LibraryTest >> setUp [ 

	super setUp.
	MaterialDesignIcons4Library reset.
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> tearDown [  

	super tearDown.
	MaterialDesignIcons4Library reset.
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testGetAndCacheIcon [
	"You need to have a directory with the library unzipped inside"
	| icon |
	
	self assert: (MaterialDesignIconsLibrary current iconNamed: #check) equals: MaterialDesignIconsLibrary current notFound.
	
	icon := MaterialDesignIconsLibrary name: #check.
	self deny: icon equals: MaterialDesignIconsLibrary current notFound.
	self deny: (MaterialDesignIconsLibrary current iconNamed: #check) equals: MaterialDesignIconsLibrary current notFound.
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testLibraryName [

	self assert: MaterialDesignIcons4Library libraryName equals: 'Material design icons 4.0.0'
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testMaterialDesignIconNamed [

	self assert: (self materialDesignIconNamed: #check) identicalTo: (MaterialDesignIconsLibrary name: #check)
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testNameWithSymbolOrString [
	"You need to have a directory with the library unzipped inside"
	| iconA iconB |
	iconA := MaterialDesignIconsLibrary name: 'view_day'.
	iconB := MaterialDesignIconsLibrary name: #'view_day'.
	
	self assert: iconA equals: iconB
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testNotFoundIcon [

	self assert: (MaterialDesignIconsLibrary name: #test_NotFoundIcon) equals: (MaterialDesignIconsLibrary current notFound).
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testReset [

	| themeIcons |
	themeIcons := MaterialDesignIconsLibrary current.
	MaterialDesignIconsLibrary reset.
	
	self deny: (MaterialDesignIconsLibrary current) identicalTo: themeIcons. 
]
