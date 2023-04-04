Class {
	#name : #SmockAbstractIconLibrary,
	#superclass : #Object,
	#instVars : [
		'name',
		'style',
		'scale',
		'iconSize'
	],
	#classInstVars : [
		'Current'
	],
	#category : #'OpenSmock-Iconography-Core'
}

{ #category : #cleanup }
SmockAbstractIconLibrary class >> cleanUp [

	self allSubclassesDo: [ :c | c reset ]
]

{ #category : #cleanup }
SmockAbstractIconLibrary class >> cleanUp: anObject [

	self cleanUp
]

{ #category : #accessing }
SmockAbstractIconLibrary class >> current [ 

	^ Current ifNil: [ Current := self loadDefault ]
]

{ #category : #private }
SmockAbstractIconLibrary class >> installEmbeddedIcon: aForm name: aName in: aThemeIcons [
	
	aThemeIcons icons at: aName put: aForm
]

{ #category : #private }
SmockAbstractIconLibrary class >> installEmbeddedIconsOn: aThemeIcons [
	"Install your embedded icons here to propose a ready to use set of icons"

	"Example : self installEmbeddedIcon: aForm name: #myIcon in: aThemeIcons"
]

{ #category : #testing }
SmockAbstractIconLibrary class >> isAbstract [

	^ true
]

{ #category : #accessing }
SmockAbstractIconLibrary class >> libraryName [

	^ nil
]

{ #category : #accessing }
SmockAbstractIconLibrary class >> loadDefault [

	| themeIcons |
	themeIcons := ThemeIcons named: self libraryName.
	self installEmbeddedIconsOn: themeIcons.
	^themeIcons
]

{ #category : #construction }
SmockAbstractIconLibrary class >> name: aName [

	^ self name: aName style: nil size: nil scale: nil
]

{ #category : #construction }
SmockAbstractIconLibrary class >> name: aName style: aStyle size: aSize scale: aScale [
	"Need to return a form"

	| library |
	library := self new.
	library name: aName.
	library style: aStyle.
	library iconSize: aSize.
	library scale: aScale.

	^ library form
]

{ #category : #construction }
SmockAbstractIconLibrary class >> reset [

	Current := nil
]

{ #category : #accessing }
SmockAbstractIconLibrary >> buildSymbol [

	^ self name asSymbol
]

{ #category : #icons }
SmockAbstractIconLibrary >> form [

	| symbol form |
	symbol := self buildSymbol.
	form := self class current iconNamed: symbol.
	^ form
]

{ #category : #accessing }
SmockAbstractIconLibrary >> iconSize [

	^ iconSize
]

{ #category : #accessing }
SmockAbstractIconLibrary >> iconSize: anObject [

	iconSize := anObject
]

{ #category : #accessing }
SmockAbstractIconLibrary >> name [

	^ name
]

{ #category : #accessing }
SmockAbstractIconLibrary >> name: anObject [

	name := anObject
]

{ #category : #accessing }
SmockAbstractIconLibrary >> scale [

	^ scale
]

{ #category : #accessing }
SmockAbstractIconLibrary >> scale: anObject [

	scale := anObject
]

{ #category : #accessing }
SmockAbstractIconLibrary >> style [

	^ style
]

{ #category : #accessing }
SmockAbstractIconLibrary >> style: anObject [

	style := anObject
]
