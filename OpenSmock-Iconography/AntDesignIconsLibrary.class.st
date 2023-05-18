Class {
	#name : #AntDesignIconsLibrary,
	#superclass : #SmockAbstractIconsLibrary,
	#instVars : [
		'svgConverter'
	],
	#classVars : [
		'FilledThemeIcons',
		'OutlinedThemeIcons',
		'TwoToneThemeIcons'
	],
	#category : #'OpenSmock-Iconography-Library - Ant Design'
}

{ #category : #accessing }
AntDesignIconsLibrary class >> filledThemeIcons [

	^ self currentThemeIcons
]

{ #category : #accessing }
AntDesignIconsLibrary class >> libraryName [

	^ 'Ant Design icons'
]

{ #category : #accessing }
AntDesignIconsLibrary class >> outlinedThemeIcons [

	^ OutlinedThemeIcons ifNil:[ OutlinedThemeIcons := self createThemeIcons: self libraryName, ' outlined' ]
]

{ #category : #accessing }
AntDesignIconsLibrary class >> reset [

	super reset.
	"Note : Filled is current theme"
	OutlinedThemeIcons := nil.
	TwoToneThemeIcons := nil.
]

{ #category : #accessing }
AntDesignIconsLibrary class >> twoToneThemeIcons [

	^ TwoToneThemeIcons ifNil:[ TwoToneThemeIcons := self createThemeIcons: self libraryName, ' two tone' ]
]

{ #category : #private }
AntDesignIconsLibrary >> downloadAsRasterFromDirectory: aDirectory [
	"Download an icon into a Form (raster image) from a directory"

	| vectorial morph |
	vectorial := self downloadAsVectorialFromDirectory: aDirectory.
	vectorial ifNil:[ ^ nil ].
	
	"using ASVGMorph parser to transform the vectorial image into a raster image"
	morph := ASVGMorph new svg: vectorial; yourself.
	morph ifNil:[ ^ nil ].

	self flag:'labordep : temporary, we get a default size of the the icon'.
	^ morph asForm scaledToSize: 32@32
]

{ #category : #private }
AntDesignIconsLibrary >> downloadAsVectorialFromDirectory: aDirectory [
	"Download an icon into a ASVGRoot (vectorial image) from a directory"

	| svg fileContent svgDir iconDir files formattedName |
	
	"get the svg directory"
	svgDir := self svgDirectoryFrom: aDirectory.
	svgDir exists ifFalse: [ ^ nil ].
	
	"localize icon into the style directory"
	iconDir := (self styleDirectoryFrom: svgDir).
	iconDir exists ifFalse:[ ^ nil ].
	files := iconDir filesMatching: self svgExtensionFilter.
	files ifEmpty: [ ^ nil ].
	
	formattedName := self name asString translateToLowercase.
	files do:[ :f | | fileName |
		fileName := f basenameWithoutExtension translateToLowercase copyReplaceAll: '-' with: ''.
		fileName = formattedName ifTrue:[
			"get the file content to parse it into a ASVGRoot"
			fileContent := f contents.
			svg := svgConverter importXMLDocument: (XMLDOMParser parse: fileContent).
			^ svg	
		].
	].
	
	^ nil
	
]

{ #category : #accessing }
AntDesignIconsLibrary >> initialize [

	super initialize.
	self style: AntDesignIconsStyle filled.
	self libraryDirectory: SmockIconographySystemSettings antDesignIconsDirectory.
	svgConverter := AthensSVGConverter new.
]

{ #category : #private }
AntDesignIconsLibrary >> styleDirectoryFrom: aDirectory [

	(self style = AntDesignIconsStyle filled) ifTrue:[^ aDirectory / 'filled'].
	(self style = AntDesignIconsStyle outlined) ifTrue:[^ aDirectory / 'outlined'].
	(self style = AntDesignIconsStyle twoTone) ifTrue:[^ aDirectory / 'twotone'].
	
	^ aDirectory / 'filled'
]

{ #category : #private }
AntDesignIconsLibrary >> svgDirectoryFrom: aDirectory [

	^ aDirectory / 'packages' / 'icons-svg' / 'svg'
]

{ #category : #accessing }
AntDesignIconsLibrary >> themeIcons [
	"Return the current style themeIcons"

	self style = AntDesignIconsStyle filled ifTrue:[^ super themeIcons].
	self style = AntDesignIconsStyle outlined ifTrue:[^ self class outlinedThemeIcons].
	self style = AntDesignIconsStyle twoTone ifTrue:[^ self class twoToneThemeIcons].

	^ super themeIcons
]
