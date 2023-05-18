Class {
	#name : #MaterialDesignIcons4Library,
	#superclass : #MaterialDesignIconsLibrary,
	#category : #'OpenSmock-Iconography-Library - Material Design'
}

{ #category : #accessing }
MaterialDesignIcons4Library class >> cacheAllFilled [
	"Warning : this action  can be long depending your file system and hardware and the quantity of icons (>1000)"
	<script: 'self cacheAllFilled. self current inspect.'>

	| directory pngDir names |
	directory := self new libraryDirectory ifNil:[ ^ nil ].
	directory exists ifFalse:[ ^ nil ].
	
	pngDir := directory / 'png'.
	pngDir exists ifFalse:[ ^ nil ].
	
	UIManager default showWaitCursorWhile:[
		"first : count nb of icons"
		names := Set new.
		pngDir directories do:[ :d |
			d directories do:[ :d2 | 
				names add: d2 basename.
			].
		].
	].

	UIManager default informUserDuring: [ :bar | | nb size |
		bar label: 'Caching icons...'.
		nb := 1.
		size := names size.
		names asOrderedCollection do:[ :n |
			bar label: 'Caching icon ', nb asString ,'/', names size asString.
			self name: n.
			nb := nb + 1.
		].
	].

	
]

{ #category : #accessing }
MaterialDesignIcons4Library class >> libraryName [

	^ 'Material Design icons 4.0.0'
]

{ #category : #initialization }
MaterialDesignIcons4Library >> downloadAsRasterFromDirectory: aDirectory [
	"Download an icon into a Form (raster image) from a directory"

	| pngDir |
	self flag:'labordep : temporary, we get the default theme/size of the the icon'.

	pngDir := self pngDirectoryFrom: aDirectory.
	pngDir exists ifFalse: [ ^ nil ].

	pngDir directories do: [ :d |
		d directories do: [ :d2 |
			d2 basename = self name ifTrue: [
				| iconDir |
				iconDir := (self styleDirectoryFrom: d2) / '18dp' / '1x'.
				iconDir exists ifTrue: [
					| files form |
					files := iconDir filesMatching: self pngExtensionFilter.
					files ifEmpty: [ ^ nil ].
					form := self class currentThemeIcons readPNGFrom: files first.
					^ form ] ] ] ].

	^ nil
]

{ #category : #initialization }
MaterialDesignIcons4Library >> initialize [

	super initialize.
	self style: MaterialDesignIconsStyle filled.
	self libraryDirectory: SmockIconographySystemSettings materialDesignIcons4Directory
]
