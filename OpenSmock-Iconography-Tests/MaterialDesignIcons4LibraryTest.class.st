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
MaterialDesignIcons4LibraryTest >> removeGeneratedMethods [ 

	"remove generated methods"
	SmockTestIconExport class removeSelector: #iconCheckCircleFilled32x32.
	SmockTestIconExport class removeSelector: #iconCheckCircleFilled32x16.
	SmockTestIconExport class removeSelector: #iconCheckCircleFilled16x16.
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> setUp [ 

	super setUp.
	MaterialDesignIcons4Library reset.
	self createSampleIconFiles.
	
 	self removeGeneratedMethods.
]

{ #category : #running }
MaterialDesignIcons4LibraryTest >> tearDown [  

	super tearDown.
	MaterialDesignIcons4Library reset.
	
	self removeGeneratedMethods.
]

{ #category : #tests }
MaterialDesignIcons4LibraryTest >> testExists [

	| iconDescription |
	iconDescription := MaterialDesignIcons4Library new.
	iconDescription name: #check_circle.
	self assert: iconDescription exists.
	
	iconDescription := MaterialDesignIcons4Library new.
	iconDescription name: #check_circle_not_exists.
	self deny: iconDescription exists.
]

{ #category : #tests }
MaterialDesignIcons4LibraryTest >> testGetAndCacheIcon [
	| icon |

	self
		assert:
		(MaterialDesignIconsLibrary currentThemeIcons iconNamed: #check_circle) form
		equals: MaterialDesignIconsLibrary currentThemeIcons notFound.

	icon := (MaterialDesignIconsLibrary name: #check_circle) form.
	self
		deny: icon
		equals: MaterialDesignIconsLibrary currentThemeIcons notFound.
	self
		deny:
		(MaterialDesignIconsLibrary currentThemeIcons iconNamed: #check_circle) form
		equals: MaterialDesignIconsLibrary currentThemeIcons notFound
]

{ #category : #tests }
MaterialDesignIcons4LibraryTest >> testLibraryName [

	self assert: MaterialDesignIcons4Library libraryName equals: 'Material Design icons 4.0.0'
]

{ #category : #tests }
MaterialDesignIcons4LibraryTest >> testMaterialDesignIconNamed [

	self assert: (self materialIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	self assert: (self materialFilledIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	
	self deny: (self materialOutlinedIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	self deny: (self materialRoundedIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	self deny: (self materialSharpIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	self deny: (self materialTwoToneIconNamed: #check_circle) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
]

{ #category : #tests }
MaterialDesignIcons4LibraryTest >> testMaterialDesignIconNamedStyle [

	self assert: (self materialIconNamed: #check_circle style: #filled) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	self assert: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle filled) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	
	self deny: (self materialIconNamed: #check_circle style: #outlined) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	self deny: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle outlined) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	
	self deny: (self materialIconNamed: #check_circle style: #rounded) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	self deny: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle rounded) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	
	self deny: (self materialIconNamed: #check_circle style: #sharp) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	self deny: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle sharp) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	
	self deny: (self materialIconNamed: #check_circle style: #twoTone) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
	self deny: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle twoTone) identicalTo: (MaterialDesignIconsLibrary name: #check_circle) form.
]

{ #category : #tests }
MaterialDesignIcons4LibraryTest >> testNameWithSymbolOrString [
	| iconA iconB |

	iconA := (MaterialDesignIconsLibrary name: 'check_circle') form.
	iconB := (MaterialDesignIconsLibrary name: #'check_circle') form.
	
	self deny: iconA equals: MaterialDesignIconsLibrary currentThemeIcons notFound.
	self assert: iconA equals: iconB
]

{ #category : #tests }
MaterialDesignIcons4LibraryTest >> testNotFoundIcon [

	self
		assert: (MaterialDesignIconsLibrary name: #test_NotExistingIcon) form
		equals: MaterialDesignIconsLibrary currentThemeIcons notFound
]

{ #category : #tests }
MaterialDesignIcons4LibraryTest >> testRasterImageFile [

	| iconDescription file |
	iconDescription := MaterialDesignIcons4Library new.
	iconDescription name: #check_circle.
	file := iconDescription rasterImageFile.
	self assert: file notNil.
	self assert: file exists.
	self assert: file basename equals: 'baseline_check_circle_black_18dp.png'.

	iconDescription := MaterialDesignIcons4Library new.
	iconDescription name: #check_circle_not_exists.
	file := iconDescription rasterImageFile.
	self assert: file isNil.
]

{ #category : #tests }
MaterialDesignIcons4LibraryTest >> testReset [

	| themeIcons |
	themeIcons := MaterialDesignIconsLibrary currentThemeIcons.
	MaterialDesignIconsLibrary reset.

	self
		deny: MaterialDesignIconsLibrary currentThemeIcons
		identicalTo: themeIcons
]

{ #category : #tests }
MaterialDesignIcons4LibraryTest >> testSerializeAsFormMaxWidthMaxHeight [
	"Serialize an icon as a form into a test class"
	| iconDescription symbol32x32 symbol16x16 form32x32 form16x16 controlForm32x32 |

	iconDescription := MaterialDesignIcons4Library new.
	iconDescription name: #check_circle.
	iconDescription iconSize: 64@4.
	
	"test if the form is found before serialization"
	self assert: iconDescription exists.
	
	"test if the class cannot contains the icon selector"
	self deny: (SmockTestIconExport respondsTo: #iconCheckCircleFilled32x32).
	self deny: (SmockTestIconExport respondsTo: #iconCheckCircleFilled16x16).
	
	"serialize into a test Class"
	symbol32x32 := iconDescription serializeAsForm: SmockTestIconExport maxWidth: 32 maxHeight: 32.
	self assert: symbol32x32 equals: #iconCheckCircleFilled32x32.
	self assert: (SmockTestIconExport respondsTo: #iconCheckCircleFilled32x32).
	
	symbol16x16 := iconDescription serializeAsForm: SmockTestIconExport maxWidth: 16 maxHeight: 16.
	self assert: symbol16x16 equals: #iconCheckCircleFilled16x16.
	self assert: (SmockTestIconExport respondsTo: #iconCheckCircleFilled16x16).
	
	form32x32 := SmockTestIconExport perform: #iconCheckCircleFilled32x32.
	self assert: (form32x32 isKindOf: Form).
	self assert: form32x32 extent equals: (32@32).
	
	form16x16 := SmockTestIconExport perform: #iconCheckCircleFilled16x16.
	self assert: (form16x16 isKindOf: Form).
	self assert: form16x16 extent equals: (16@16).
	
	controlForm32x32 := SmockTestIconExport materialDesign_iconCheckCircleFilled32x32ControlSample.
	self assert: form32x32 extent equals: controlForm32x32 extent.
	self deny: form16x16 extent equals: controlForm32x32 extent.
]
