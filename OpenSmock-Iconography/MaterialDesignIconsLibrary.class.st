Class {
	#name : #MaterialDesignIconsLibrary,
	#superclass : #SmockAbstractIconsLibrary,
	#classVars : [
		'OutlinedThemeIcons',
		'RoundedThemeIcons',
		'SharpThemeIcons',
		'TwoToneThemeIcons'
	],
	#category : #'OpenSmock-Iconography-Material Design'
}

{ #category : #accessing }
MaterialDesignIconsLibrary class >> defaultIconsLibraryClass [ 

	^ MaterialDesignIcons4Library
]

{ #category : #accessing }
MaterialDesignIconsLibrary class >> libraryName [

	^ 'Material design icons'
]

{ #category : #accessing }
MaterialDesignIconsLibrary class >> outlinedThemeIcons [

	^ OutlinedThemeIcons ifNil:[ OutlinedThemeIcons := self createThemeIcons: self libraryName, ' outlined' ]
]

{ #category : #accessing }
MaterialDesignIconsLibrary class >> reset [

	super reset.
	OutlinedThemeIcons := nil.
	RoundedThemeIcons := nil.
	SharpThemeIcons := nil.
	TwoToneThemeIcons := nil.
]

{ #category : #accessing }
MaterialDesignIconsLibrary class >> roundedThemeIcons [

	^ RoundedThemeIcons ifNil:[ RoundedThemeIcons := self createThemeIcons: self libraryName, ' rounded' ]
]

{ #category : #accessing }
MaterialDesignIconsLibrary class >> sharpThemeIcons [

	^ SharpThemeIcons ifNil:[ SharpThemeIcons := self createThemeIcons: self libraryName, ' sharp' ]
]

{ #category : #accessing }
MaterialDesignIconsLibrary class >> twoToneThemeIcons [

	^ TwoToneThemeIcons ifNil:[ TwoToneThemeIcons := self createThemeIcons: self libraryName, ' two tone' ]
]

{ #category : #private }
MaterialDesignIconsLibrary >> pngDirectoryFrom: aDirectory [

	^ aDirectory / 'png'.
]

{ #category : #private }
MaterialDesignIconsLibrary >> pngExtensionFilter [

	^ '*png'
]

{ #category : #private }
MaterialDesignIconsLibrary >> styleDirectoryFrom: aDirectory [

	(self style = MaterialDesignIconsStyle filled) ifTrue:[^ aDirectory / 'materialicons'].
	(self style = MaterialDesignIconsStyle outlined) ifTrue:[^ aDirectory / 'materialiconsoutlined'].
	(self style = MaterialDesignIconsStyle rounded) ifTrue:[^ aDirectory / 'materialiconsround'].
	(self style = MaterialDesignIconsStyle sharp) ifTrue:[^ aDirectory / 'materialiconssharp'].
	(self style = MaterialDesignIconsStyle twoTone) ifTrue:[^ aDirectory / 'materialiconstwotone'].
	
	^ aDirectory / 'materialicons'
]

{ #category : #private }
MaterialDesignIconsLibrary >> themeIcons [
	"Return the current style themeIcons"

	self style = MaterialDesignIconsStyle filled ifTrue:[^ super themeIcons].
	self style = MaterialDesignIconsStyle outlined ifTrue:[^ self class outlinedThemeIcons].
	self style = MaterialDesignIconsStyle rounded ifTrue:[^ self class roundedThemeIcons].
	self style = MaterialDesignIconsStyle sharp ifTrue:[^ self class sharpThemeIcons].
	self style = MaterialDesignIconsStyle twoTone ifTrue:[^ self class twoToneThemeIcons].

	^ super themeIcons
]
