"
A SmockAbstractIconsLibraryTest is a test class for testing the behavior of SmockAbstractIconsLibrary
"
Class {
	#name : #SmockAbstractIconsLibraryTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Iconography-Tests-Core'
}

{ #category : #running }
SmockAbstractIconsLibraryTest >> setUp [ 

	super setUp.
	
	"set up used icon libraries tests to prepare necessary files"
	SmockIconsLibraryTest new setUp.
	AntDesignIconsLibraryTest new setUp.
]

{ #category : #running }
SmockAbstractIconsLibraryTest >> tearDown [ 

	"tear down used icon libraries tests to prepare necessary files"
	SmockIconsLibraryTest new tearDown.
	AntDesignIconsLibraryTest new tearDown.

	super tearDown.
]

{ #category : #tests }
SmockAbstractIconsLibraryTest >> testCachedForm [

	| iconDescription |
	iconDescription := AntDesignIconsLibrary new.
	iconDescription name: #checkCircle.
	self assert: iconDescription cachedForm isNil. "the icon is not cached at start"
	
	iconDescription form. "call the icon form to be cached"
	self assert: iconDescription cachedForm notNil. "now the icon is cached"
	self assert: iconDescription cachedForm ~= iconDescription themeIcons notFound. 
]

{ #category : #tests }
SmockAbstractIconsLibraryTest >> testInitialize [
	| iconDescription |

	iconDescription := SmockTestIconsLibrary new.
	iconDescription name: #myIcon; scale: 1@1; style: #myStyle; iconSize: 32@32; libraryDirectory: 'my/directory' asFileLocatorOrReference.
	
	self assert: iconDescription name equals: #myIcon.
	self assert: iconDescription scale equals: 1@1.
	self assert: iconDescription style equals: #myStyle.
	self assert: iconDescription iconSize equals: 32@32.
	self assert: iconDescription libraryDirectory equals: ('my/directory' asFileLocatorOrReference).
]

{ #category : #tests }
SmockAbstractIconsLibraryTest >> testIsCachedForm [

	| iconDescription |
	iconDescription := AntDesignIconsLibrary new.
	iconDescription name: #checkCircle.
	self assert: iconDescription isCachedForm not. "the icon is not cached at start"
	
	iconDescription form. "call the icon form to be cached"
	self assert: iconDescription isCachedForm. "now the icon is cached"
]

{ #category : #tests }
SmockAbstractIconsLibraryTest >> testSerializeAsForm [

	"Use an existing library to serialize an icon as a form into a test class"
	| iconDescription |
	iconDescription := AntDesignIconsLibrary new.
	
	"needed properties to store as image : name, style and size"
	iconDescription name: #checkCircle; style: AntDesignIconsStyle filled; iconSize: 32@32.
	
	"test if the form is found"
	self assert: iconDescription exists.
]
