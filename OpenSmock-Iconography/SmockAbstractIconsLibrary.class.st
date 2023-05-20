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
		'CurrentThemeIcons'
	],
	#category : #'OpenSmock-Iconography-Core'
}

{ #category : #private }
SmockAbstractIconsLibrary class >> _currentThemeIcons [

	^ CurrentThemeIcons
]

{ #category : #private }
SmockAbstractIconsLibrary class >> _currentThemeIcons: anObject [

	CurrentThemeIcons := anObject
]

{ #category : #cleanup }
SmockAbstractIconsLibrary class >> cleanUp [

	self allSubclassesDo: [ :c | c reset ]
]

{ #category : #cleanup }
SmockAbstractIconsLibrary class >> cleanUp: anObject [

	self cleanUp
]

{ #category : #private }
SmockAbstractIconsLibrary class >> createDefaultThemeIcons [

	| themeIcons |
	themeIcons := self createThemeIcons: self defaultIconsLibraryClass libraryName.
	self defaultIconsLibraryClass installEmbeddedIconsOn: themeIcons.
	self _currentThemeIcons: themeIcons.
	
	^ themeIcons
]

{ #category : #private }
SmockAbstractIconsLibrary class >> createThemeIcons: aName [

	| themeIcons |
	themeIcons := ThemeIcons named: aName.
	^ themeIcons
]

{ #category : #accessing }
SmockAbstractIconsLibrary class >> current [

	self deprecated: 'use new interface' transformWith: '`@receiver current' -> '`@receiver currentThemeIcons'.
	^ self currentThemeIcons
]

{ #category : #accessing }
SmockAbstractIconsLibrary class >> currentThemeIcons [

	^ self defaultIconsLibraryClass _currentThemeIcons ifNil: [ self defaultIconsLibraryClass createDefaultThemeIcons ]
]

{ #category : #private }
SmockAbstractIconsLibrary class >> defaultIconsLibraryClass [

	^ self
]

{ #category : #installation }
SmockAbstractIconsLibrary class >> installEmbeddedIcon: aForm name: aName [

	self
		installEmbeddedIcon: aForm
		name: aName
		in: self currentThemeIcons
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

{ #category : #icons }
SmockAbstractIconsLibrary class >> name: aName [

	^ self name: aName style: nil size: nil scale: nil
]

{ #category : #icons }
SmockAbstractIconsLibrary class >> name: aName style: aStyle [

	^ self name: aName style: aStyle size: nil scale: nil
]

{ #category : #icons }
SmockAbstractIconsLibrary class >> name: aName style: aStyle size: aSize [

	^ self name: aName style: aStyle size: aSize scale: nil
]

{ #category : #icons }
SmockAbstractIconsLibrary class >> name: aName style: aStyle size: aSize scale: aScale [
	"Need to return a form"

	| library |
	library := self defaultIconsLibraryClass new.
	library name: aName.
	library style: aStyle.
	library iconSize: aSize.
	library scale: aScale.

	^ library
]

{ #category : #cleanup }
SmockAbstractIconsLibrary class >> reset [

	self defaultIconsLibraryClass _currentThemeIcons: nil
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> buildSymbol [

	^ self name asSymbol
]

{ #category : #testing }
SmockAbstractIconsLibrary >> cachedForm [

	| symbol form |
	symbol := self buildSymbol.
	form := self themeIcons iconNamed: symbol.
	
	form ifNil:[ ^ nil ].
	form == self themeIcons notFound ifTrue:[ ^ nil ]. 
	^ form
]

{ #category : #private }
SmockAbstractIconsLibrary >> downloadAsRaster: mustBeCached [
	"Download an icon into a Form (raster image) and cache it if needed"
	| form directory |

	"first : local directory download"
	directory := self libraryDirectory ifNil:[ ^ nil ].
	directory exists ifFalse:[ ^ nil ].
	form := self downloadAsRasterFromDirectory: directory.
		
	(form notNil and:[mustBeCached]) ifTrue:[
		self class installEmbeddedIcon: form name: self name in: self themeIcons
	].
	
	^ form
	
]

{ #category : #private }
SmockAbstractIconsLibrary >> downloadAsRasterFromDirectory: aDirectory [
	"Download an icon into a Form (raster image) from a directory"
	
	^ nil	
]

{ #category : #testing }
SmockAbstractIconsLibrary >> exists [ 
	"Test if the icon exists in the library, icon can be cached, not already cached but present in a file directory or available online"
	
	"First test : is icon already cached ?"
	self isCachedForm ifTrue:[ ^ true ].
	
	"Second test : is icon on directory file ?"
	((self rasterImageFile notNil and:[self rasterImageFile exists]) 
		or:[(self vectorialImageFile notNil and:[self vectorialImageFile exists])]) ifTrue:[ ^ true ].

	^ false
]

{ #category : #icons }
SmockAbstractIconsLibrary >> form [

	| downloadedForm |
	self cachedForm ifNotNil:[ :form | ^ form ].
	downloadedForm := self downloadAsRaster: true.
	^ downloadedForm ifNil:[ self themeIcons notFound ]
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> iconSize [

	^ iconSize
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> iconSize: anObject [

	iconSize := anObject
]

{ #category : #testing }
SmockAbstractIconsLibrary >> isCachedForm [

	| symbol form |
	symbol := self buildSymbol.
	form := self themeIcons iconNamed: symbol.
	
	^ (form notNil and:[form ~= self themeIcons notFound])
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

{ #category : #private }
SmockAbstractIconsLibrary >> pngExtensionFilter [

	^ '*png'
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> rasterImageFile [

	^ self shouldBeImplemented
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> scale [

	^ scale
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> scale: anObject [

	scale := anObject
]

{ #category : #export }
SmockAbstractIconsLibrary >> serializeAsForm: aClass [
	"Serialize an icon as a Form into a Class"
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> style [

	^ style
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> style: anObject [

	style := anObject
]

{ #category : #private }
SmockAbstractIconsLibrary >> svgExtensionFilter [

	^ '*svg'
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> themeIcons [

	^ self class currentThemeIcons
]

{ #category : #accessing }
SmockAbstractIconsLibrary >> vectorialImageFile [

	^ self shouldBeImplemented
]
