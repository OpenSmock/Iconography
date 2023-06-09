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
	| file form |

	file := self rasterImageFile.
	(file isNil or:[file exists not]) ifTrue:[ ^ nil ].

	form := self class currentThemeIcons readPNGFrom: file.
	^ form
]

{ #category : #initialization }
MaterialDesignIcons4Library >> initialize [

	super initialize.
	self style: MaterialDesignIconsStyle filled.
	self libraryDirectory: SmockIconographySystemSettings materialDesignIcons4Directory
]

{ #category : #initialization }
MaterialDesignIcons4Library >> rasterImageFile [ 
	| pngDir directory width sizeDirectory targetWidth |
	self flag:'labordep : temporary, we get the default scale and size of the the icon'.

	directory := self libraryDirectory ifNil:[ ^ nil ].
	directory exists ifFalse:[ ^ nil ].

	pngDir := self pngDirectoryFrom: directory.
	pngDir exists ifFalse: [ ^ nil ].

	"Considere the requested size"
	sizeDirectory := '18dp'.
	targetWidth := 18.
	width := 18.
	self iconSize ifNotNil: [width := (self iconSize x > self iconSize y) ifTrue:[self iconSize x] ifFalse:[self iconSize y]].
	width > 18 ifTrue:[
		width <= 24 
			ifTrue:[sizeDirectory := '24dp'. targetWidth := 24]
			ifFalse:[width <= 36 
							ifTrue:[sizeDirectory := '36dp'. targetWidth := 36] 
							ifFalse:[sizeDirectory := '48dp'. targetWidth := 48]
			].
	].

	pngDir directories do: [ :d |
		d directories do: [ :d2 |
			d2 basename = self name ifTrue: [
				| iconDir targetScale |
				
				"Check if the requested size is compliant with the scale, then use the good scale"
				targetScale := '1x'.
				self iconSize ifNotNil:[ (self iconSize x > targetWidth and:[self iconSize y > targetWidth]) ifTrue:[ targetScale := '2x' ] ].

				iconDir := (self styleDirectoryFrom: d2) / sizeDirectory / targetScale.
				iconDir exists ifTrue: [
					| files |
					files := iconDir filesMatching: self pngExtensionFilter.
					files ifEmpty: [ ^ nil ].
					^ files first 
				] 
			] 
		] 
	].

	^ nil
]
