Class {
	#name : #SmockAbstractIconsLibrary,
	#superclass : #Object,
	#instVars : [
		'name',
		'style',
		'scale',
		'iconSize',
		'libraryDirectory'
	],
	#classInstVars : [
		'Current'
	],
	#category : #'OpenSmock-Iconography-Core'
}

{ #category : #private }
SmockAbstractIconsLibrary class >> _current [

	^ Current
]

{ #category : #private }
SmockAbstractIconsLibrary class >> _current: anObject [

	Current := anObject
]

{ #category : #cleanup }
SmockAbstractIconsLibrary class >> cleanUp [

	self allSubclassesDo: [ :c | c reset ]
]

{ #category : #cleanup }
SmockAbstractIconsLibrary class >> cleanUp: anObject [

	self cleanUp
]

{ #category : #accessing }
SmockAbstractIconsLibrary class >> current [

	^ self defaultIconsLibraryClass _current ifNil: [ self defaultIconsLibraryClass loadDefault ]
]

{ #category : #private }
SmockAbstractIconsLibrary class >> defaultIconsLibraryClass [

	^ self
]

{ #category : #private }
SmockAbstractIconsLibrary class >> installEmbeddedIcon: aForm name: aName in: aThemeIcons [
	
	aThemeIcons icons at: aName put: aForm
]

{ #category : #private }
SmockAbstractIconsLibrary class >> installEmbeddedIconsOn: aThemeIcons [
	"Install your embedded icons here to propose a ready to use set of icons"

	"Example : self installEmbeddedIcon: aForm name: #myIcon in: aThemeIcons"
]

{ #category : #testing }
SmockAbstractIconsLibrary class >> isAbstract [

	^ true
]

{ #category : #accessing }
SmockAbstractIconsLibrary class >> libraryName [

	^ self subclassResponsibility
]

{ #category : #accessing }
SmockAbstractIconsLibrary class >> loadDefault [

	| themeIcons |
	themeIcons := ThemeIcons named: self defaultIconsLibraryClass libraryName.
	self defaultIconsLibraryClass installEmbeddedIconsOn: themeIcons.
	self _current: themeIcons.
	
	^ themeIcons
]

{ #category : #construction }
SmockAbstractIconsLibrary class >> name: aName [

	^ self name: aName style: nil size: nil scale: nil
]

{ #category : #construction }
SmockAbstractIconsLibrary class >> name: aName style: aStyle [

	^ self name: aName style: aStyle size: nil scale: nil
]

{ #category : #construction }
SmockAbstractIconsLibrary class >> name: aName style: aStyle size: aSize [

	^ self name: aName style: aStyle size: aSize scale: nil
]

{ #category : #construction }
SmockAbstractIconsLibrary class >> name: aName style: aStyle size: aSize scale: aScale [
	"Need to return a form"

	| library |
	library := self defaultIconsLibraryClass new.
	library name: aName.
	library style: aStyle.
	library iconSize: aSize.
	library scale: aScale.

	^ library form
]

{ #category : #construction }
SmockAbstractIconsLibrary class >> reset [

	self defaultIconsLibraryClass _current: nil
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> buildSymbol [

	^ self name asSymbol
]

{ #category : #private }
SmockAbstractIconsLibrary >> downloadFrom: isToCache [
	"Download an icon and cache it if needed"
	| form directory |

	"first : local directory download"
	directory := self libraryDirectory ifNil:[ ^ nil ].
	directory exists ifFalse:[ ^ nil ].
	form := self downloadFromDirectory: directory.
		
	(form notNil and:[isToCache]) ifTrue:[
		self class installEmbeddedIcon: form name: self name in: self class current.
	].
	
	^ form
	
]

{ #category : #private }
SmockAbstractIconsLibrary >> downloadFromDirectory: aDirectory [
	"Download an icon from a directory"
	
	^ nil	
]

{ #category : #icons }
SmockAbstractIconsLibrary >> form [

	| symbol form |
	symbol := self buildSymbol.
	form := self class current iconNamed: symbol.
	
	(form isNil or:[form == self class current notFound]) ifTrue:[ | downloadedForm |
		downloadedForm := self downloadFrom: true.
		^ downloadedForm ifNil:[ ^ form ]
	].
	
	^ form
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> iconSize [

	^ iconSize
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> iconSize: anObject [

	iconSize := anObject
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> libraryDirectory [

	^ libraryDirectory
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> libraryDirectory: anObject [

	libraryDirectory := anObject
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> name [

	^ name
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> name: anObject [

	name := anObject
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> scale [

	^ scale
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> scale: anObject [

	scale := anObject
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> style [

	^ style
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> style: anObject [

	style := anObject
]
