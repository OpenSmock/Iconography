"
A MateriaDesignIconsLibrary400Test is a test class for testing the behavior of MateriaDesignIconsLibrary400.

To make sample files from PNG image : 
form := Form fromFileNamed: '../../baseline_check_circle_black_18dp.png'.
stream := ReadWriteStream on: String new.
form storeOn: stream.
Smalltalk compiler evaluate: stream contents.

"
Class {
	#name : #MaterialDesignIcons4LibraryTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Iconography-Tests-Core'
}

{ #category : #baselines }
MaterialDesignIcons4LibraryTest class >> baseline_check_circle_black_18dpPNG [
	<script: '(Smalltalk compiler evaluate: self baseline_check_circle_black_18dpPNG) inspect'>

	^'(Form
	extent: (18@18)
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 134217728 1124073472 1593835520 1593835520 1006632960 67108864 0 0 0 0 0 0 0 0 0 0 335544320 2399141888 4143972352 4278190080 4278190080 4278190080 4278190080 4009754624 2130706432 201326592 0 0 0 0 0 0 0 671088640 3741319168 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 3472883712 402653184 0 0 0 0 0 402653184 3808428032 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 3472883712 201326592 0 0 0 0 2667577344 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 2868903936 1459617792 4211081216 2130706432 0 0 0 402653184 4211081216 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 2868903936 67108864 1006632960 4076863488 4009754624 67108864 0 0 1526726656 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 2868903936 67108864 1006632960 4076863488 4278190080 4278190080 1006632960 0 0 2130706432 4278190080 4211081216 1593835520 3271557120 4278190080 4278190080 4278190080 2868903936 67108864 1006632960 4076863488 4278190080 4278190080 4278190080 1593835520 0 0 2130706432 4278190080 4076863488 1006632960 201326592 3271557120 4278190080 2868903936 67108864 1006632960 4076863488 4278190080 4278190080 4278190080 4278190080 1660944384 0 0 1660944384 4278190080 4278190080 4076863488 1006632960 201326592 2130706432 67108864 1006632960 4076863488 4278190080 4278190080 4278190080 4278190080 4278190080 1124073472 0 0 536870912 4278190080 4278190080 4278190080 4076863488 1006632960 0 1006632960 4076863488 4278190080 4278190080 4278190080 4278190080 4278190080 4143972352 134217728 0 0 0 2936012800 4278190080 4278190080 4278190080 4076863488 1862270976 4076863488 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 2399141888 0 0 0 0 603979776 4009754624 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 3741319168 335544320 0 0 0 0 0 1006632960 4009754624 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 3808428032 671088640 0 0 0 0 0 0 0 603979776 2936012800 4278190080 4278190080 4278190080 4278190080 4278190080 4211081216 2667577344 402653184 0 0 0 0 0 0 0 0 0 0 536870912 1660944384 2130706432 2130706432 1526726656 402653184 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
	offset: (0@0))'
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> createSampleIconFiles [

	| directory file |
	directory := SmockIconographySystemSettings materialDesignIcons4Directory.
	directory := (directory / 'png' / 'action' / 'check_circle' ) ensureCreateDirectory.
	
	file := (directory / 'materialicons' / '18dp' / '1x') ensureCreateDirectory.
	file := file / 'baseline_check_circle_black_18dp.png'.
	file exists ifFalse:[ | form |
		form := Smalltalk compiler evaluate: self class baseline_check_circle_black_18dpPNG.
		file asFileReference binaryWriteStreamDo: [ :out | (PNGReadWriter on: out) nextPutImage: form ].
		file ensureCreateFile.
	].
	
	(directory / 'materialiconsoutlined' / '18dp' / '1x') ensureCreateDirectory.
	(directory / 'materialiconsround' / '18dp' / '1x') ensureCreateDirectory.
	(directory / 'materialiconssharp' / '18dp' / '1x') ensureCreateDirectory.
	(directory / 'materialiconstwotone' / '18dp' / '1x') ensureCreateDirectory.
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> setUp [ 

	super setUp.
	MaterialDesignIcons4Library reset.
	self createSampleIconFiles.
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> tearDown [  

	super tearDown.
	MaterialDesignIcons4Library reset.
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testGetAndCacheIcon [
	| icon |

	self
		assert:
		(MaterialDesignIconsLibrary currentThemeIcons iconNamed: #check_circle)
		equals: MaterialDesignIconsLibrary currentThemeIcons notFound.

	icon := MaterialDesignIconsLibrary name: #check_circle.
	self
		deny: icon
		equals: MaterialDesignIconsLibrary currentThemeIcons notFound.
	self
		deny:
		(MaterialDesignIconsLibrary currentThemeIcons iconNamed: #check_circle)
		equals: MaterialDesignIconsLibrary currentThemeIcons notFound
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testLibraryName [

	self assert: MaterialDesignIcons4Library libraryName equals: 'Material Design icons 4.0.0'
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testMaterialDesignIconNamed [

	self assert: (self materialIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	self assert: (self materialFilledIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	
	self deny: (self materialOutlinedIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	self deny: (self materialRoundedIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	self deny: (self materialSharpIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	self deny: (self materialTwoToneIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testMaterialDesignIconNamedStyle [

	self assert: (self materialIconNamed: #check_circle style: #filled) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	self assert: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle filled) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	
	self deny: (self materialIconNamed: #check_circle style: #outlined) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	self deny: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle outlined) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	
	self deny: (self materialIconNamed: #check_circle style: #rounded) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	self deny: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle rounded) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	
	self deny: (self materialIconNamed: #check_circle style: #sharp) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	self deny: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle sharp) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	
	self deny: (self materialIconNamed: #check_circle style: #twoTone) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
	self deny: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle twoTone) identicalTo: (MaterialDesignIconsLibrary name: #check_circle).
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testNameWithSymbolOrString [
	| iconA iconB |

	iconA := MaterialDesignIconsLibrary name: 'check_circle'.
	iconB := MaterialDesignIconsLibrary name: #'check_circle'.
	
	self deny: iconA equals: MaterialDesignIconsLibrary currentThemeIcons notFound.
	self assert: iconA equals: iconB
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testNotFoundIcon [

	self
		assert: (MaterialDesignIconsLibrary name: #test_NotExistingIcon)
		equals: MaterialDesignIconsLibrary currentThemeIcons notFound
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> testReset [

	| themeIcons |
	themeIcons := MaterialDesignIconsLibrary currentThemeIcons.
	MaterialDesignIconsLibrary reset.

	self
		deny: MaterialDesignIconsLibrary currentThemeIcons
		identicalTo: themeIcons
]
