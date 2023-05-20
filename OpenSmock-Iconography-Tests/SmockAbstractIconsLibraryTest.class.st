"
A SmockAbstractIconsLibraryTest is a test class for testing the behavior of SmockAbstractIconsLibrary
"
Class {
	#name : #SmockAbstractIconsLibraryTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Iconography-Tests-Core'
}

{ #category : #test }
SmockAbstractIconsLibraryTest >> testSerializeAsForm [

	"Use an existing library to serialize an icon as a form into a test class"
	| iconDescription |
	iconDescription := AntDesignIconsLibrary new name: #checkCircle.
]
