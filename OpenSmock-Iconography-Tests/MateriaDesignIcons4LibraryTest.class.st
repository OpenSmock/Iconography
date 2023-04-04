"
A MateriaDesignIconsLibrary400Test is a test class for testing the behavior of MateriaDesignIconsLibrary400
"
Class {
	#name : #MateriaDesignIcons4LibraryTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Iconography-Tests-Core'
}

{ #category : #running }
MateriaDesignIcons4LibraryTest >> setUp [ 

	super setUp.
	MateriaDesignIcons4Library reset.
]

{ #category : #running }
MateriaDesignIcons4LibraryTest >> tearDown [  

	super tearDown.
	MateriaDesignIcons4Library reset.
]

{ #category : #running }
MateriaDesignIcons4LibraryTest >> testLibraryName [

	self assert: MateriaDesignIcons4Library libraryName equals: 'Material design icons 4.0.0'
]
