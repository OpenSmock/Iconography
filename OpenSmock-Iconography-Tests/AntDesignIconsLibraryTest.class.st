Class {
	#name : #AntDesignIconsLibraryTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Iconography-Tests-Core'
}

{ #category : #samples }
AntDesignIconsLibraryTest class >> filledCheckCircleSVG [

	^'<?xml version="1.0" standalone="no"?>
<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 1024 1024">
  <path d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm193.5 301.7l-210.6 292a31.8 31.8 0 0 1-51.7 0L318.5 484.9c-3.8-5.3 0-12.7 6.5-12.7h46.9c10.2 0 19.9 4.9 25.9 13.3l71.2 98.8 157.2-218c6-8.3 15.6-13.3 25.9-13.3H699c6.5 0 10.3 7.4 6.5 12.7z"/>
</svg>'
]

{ #category : #samples }
AntDesignIconsLibraryTest class >> filledCheckSquareSVG [

	^'<?xml version="1.0" standalone="no"?>
<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 1024 1024">
  <path d="M880 112H144c-17.7 0-32 14.3-32 32v736c0 17.7 14.3 32 32 32h736c17.7 0 32-14.3 32-32V144c0-17.7-14.3-32-32-32zM695.5 365.7l-210.6 292a31.8 31.8 0 0 1-51.7 0L308.5 484.9c-3.8-5.3 0-12.7 6.5-12.7h46.9c10.2 0 19.9 4.9 25.9 13.3l71.2 98.8 157.2-218c6-8.3 15.6-13.3 25.9-13.3H689c6.5 0 10.3 7.4 6.5 12.7z"/>
</svg>'
]

{ #category : #samples }
AntDesignIconsLibraryTest class >> outlinedCheckCircleSVG [

	^'<?xml version="1.0" standalone="no"?>
<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 1024 1024">
  <path d="M699 353h-46.9c-10.2 0-19.9 4.9-25.9 13.3L469 584.3l-71.2-98.8c-6-8.3-15.6-13.3-25.9-13.3H325c-6.5 0-10.3 7.4-6.5 12.7l124.6 172.8a31.8 31.8 0 0 0 51.7 0l210.6-292c3.9-5.3.1-12.7-6.4-12.7z"/>
  <path d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm0 820c-205.4 0-372-166.6-372-372s166.6-372 372-372 372 166.6 372 372-166.6 372-372 372z"/>
</svg>'
]

{ #category : #samples }
AntDesignIconsLibraryTest class >> outlinedCheckSquareSVG [

	^'<?xml version="1.0" standalone="no"?>
<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 1024 1024">
  <path d="M433.1 657.7a31.8 31.8 0 0 0 51.7 0l210.6-292c3.8-5.3 0-12.7-6.5-12.7H642c-10.2 0-19.9 4.9-25.9 13.3L459 584.3l-71.2-98.8c-6-8.3-15.6-13.3-25.9-13.3H315c-6.5 0-10.3 7.4-6.5 12.7l124.6 172.8z"/>
  <path d="M880 112H144c-17.7 0-32 14.3-32 32v736c0 17.7 14.3 32 32 32h736c17.7 0 32-14.3 32-32V144c0-17.7-14.3-32-32-32zm-40 728H184V184h656v656z"/>
</svg>'
]

{ #category : #running }
AntDesignIconsLibraryTest >> createSampleIconFiles [

	| directory file |
	directory := SmockIconographySystemSettings antDesignIconsDirectory.
	directory := (directory / 'packages' / 'icons-svg' / 'svg' / 'filled') ensureCreateDirectory.
	
 	file := directory / 'check-circle.svg'.
	file exists ifFalse:[
		file writeStreamDo: [ :stream | stream nextPutAll: self class filledCheckCircleSVG ]; createFile.
	].
	
	file := directory / 'check-square.svg'.
	file exists ifFalse:[
		file writeStreamDo: [ :stream | stream nextPutAll: self class filledCheckSquareSVG ]; createFile.
	].

	directory := SmockIconographySystemSettings antDesignIconsDirectory.
	directory := (directory / 'packages' / 'icons-svg' / 'svg' / 'outlined') ensureCreateDirectory.
	
	file := directory / 'check-circle.svg'.
	file exists ifFalse:[
		file writeStreamDo: [ :stream | stream nextPutAll: self class outlinedCheckCircleSVG ]; createFile.
	].
	
	file := directory / 'check-square.svg'.
	file exists ifFalse:[
		file writeStreamDo: [ :stream | stream nextPutAll: self class outlinedCheckSquareSVG ]; createFile.
	].
]

{ #category : #running }
AntDesignIconsLibraryTest >> removeGeneratedMethods [ 

	"remove generated methods"
	SmockTestIconExport class removeSelector: #iconCheckCircleFilled32x32.
	SmockTestIconExport class removeSelector: #iconCheckCircleFilled32x16.
	SmockTestIconExport class removeSelector: #iconCheckCircleFilled16x16.
]

{ #category : #running }
AntDesignIconsLibraryTest >> setUp [ 

	super setUp.
	AntDesignIconsLibrary reset.
	self createSampleIconFiles.
	
	self removeGeneratedMethods.
]

{ #category : #running }
AntDesignIconsLibraryTest >> tearDown [  

	self removeGeneratedMethods.
	
	AntDesignIconsLibrary reset.

	super tearDown.
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testAntDesignIconNamed [

	self assert: (self antIconNamed: #checkCircle) identicalTo: (AntDesignIconsLibrary name: #checkCircle) form.
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testAntDesignIconNamedStyle [

	| filledCheckCircleIcon outlinedCheckCircleIcon |
	filledCheckCircleIcon := (AntDesignIconsLibrary name: #checkCircle) form.

	self assert: (self antFilledIconNamed: #checkCircle) identicalTo: filledCheckCircleIcon.
	self assert: (self antIconNamed: #checkCircle style: #filled) identicalTo: filledCheckCircleIcon.
	self assert: (self antIconNamed: #checkCircle style: AntDesignIconsStyle filled) identicalTo: filledCheckCircleIcon.
	
	self deny: (self antOutlinedIconNamed: #checkCircle) identicalTo: filledCheckCircleIcon.
	self deny: (self antIconNamed: #checkCircle style: #outlined) identicalTo: filledCheckCircleIcon.
	self deny: (self antIconNamed: #checkCircle style: AntDesignIconsStyle outlined) identicalTo: filledCheckCircleIcon.
	
	self deny: (self antTwoToneIconNamed: #checkCircle) identicalTo: filledCheckCircleIcon.
	self deny: (self antIconNamed: #checkCircle style: #twoTone) identicalTo: filledCheckCircleIcon.
	self deny: (self antIconNamed: #checkCircle style: AntDesignIconsStyle twoTone) identicalTo: filledCheckCircleIcon.
	
	outlinedCheckCircleIcon := (AntDesignIconsLibrary name: #checkCircle style: #outlined) form.
	
	self assert: (self antOutlinedIconNamed: #checkCircle) identicalTo: outlinedCheckCircleIcon.
	self assert: (self antIconNamed: #checkCircle style: #outlined) identicalTo: outlinedCheckCircleIcon.
	self assert: (self antIconNamed: #checkCircle style: AntDesignIconsStyle outlined) identicalTo: outlinedCheckCircleIcon.
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testExists [

	| iconDescription |
	iconDescription := AntDesignIconsLibrary new.
	iconDescription name: #checkCircle.
	self assert: iconDescription exists.
	
	iconDescription := AntDesignIconsLibrary new.
	iconDescription name: #checkCircleNotExists.
	self deny: iconDescription exists.
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testGetAndCacheIcon [
	| icon |

	self
		assert:
		(AntDesignIconsLibrary currentThemeIcons iconNamed: #checkCircle) form
		equals: AntDesignIconsLibrary currentThemeIcons notFound.

	icon := (AntDesignIconsLibrary name: #checkCircle) form.
	self
		deny: icon
		equals: AntDesignIconsLibrary currentThemeIcons notFound.
	self
		deny:
		(AntDesignIconsLibrary currentThemeIcons iconNamed: #checkCircle) form
		equals: AntDesignIconsLibrary currentThemeIcons notFound
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testLibraryName [

	self assert: AntDesignIconsLibrary libraryName equals: 'Ant Design icons'
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testNameWithSymbolOrString [
	| iconA iconB |

	iconA := (AntDesignIconsLibrary name: 'checkSquare') form.
	iconB := (AntDesignIconsLibrary name: #'checkSquare') form.
	
	self deny: iconA equals: AntDesignIconsLibrary currentThemeIcons notFound.
	self assert: iconA equals: iconB.
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testNotFoundIcon [

	self
		assert: (AntDesignIconsLibrary name: #test_NotFoundIcon) form
		equals: AntDesignIconsLibrary currentThemeIcons notFound
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testRasterImageFile [

	| iconDescription file |
	iconDescription := AntDesignIconsLibrary new.
	iconDescription name: #checkCircle.
	file := iconDescription rasterImageFile.
	self assert: file isNil.

	iconDescription := AntDesignIconsLibrary new.
	iconDescription name: #checkCircleNotExists.
	file := iconDescription vectorialImageFile.
	self assert: file isNil.
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testReset [

	| themeIcons |
	themeIcons := AntDesignIconsLibrary currentThemeIcons.
	AntDesignIconsLibrary reset.

	self
		deny: AntDesignIconsLibrary currentThemeIcons
		identicalTo: themeIcons
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testSerializeAsFormMaxWidthMaxHeight [
	"Serialize an icon as a form into a test class"
	| iconDescription symbol32x32 symbol16x16 form32x32 form16x16 controlForm32x32 |

	iconDescription := AntDesignIconsLibrary new.
	iconDescription name: #checkCircle.
	
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
	self assert: form32x32 extent equals: (31@32).
	
	form16x16 := SmockTestIconExport perform: #iconCheckCircleFilled16x16.
	self assert: (form16x16 isKindOf: Form).
	self assert: form16x16 extent equals: (15@16).
	
	controlForm32x32 := SmockTestIconExport antDesign_iconCheckCircleFilled32x32ControlSample.
	self assert: form32x32 bits equals: controlForm32x32 bits.
	self deny: form16x16 bits equals: controlForm32x32 bits.
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testSerializeAsFormWidthAndHeightProportional [
	"This class test the conservation of the proportionality of the size"
	| iconDescription symbol form |

	iconDescription := AntDesignIconsLibrary new.
	iconDescription name: #checkCircle.
	
	"test if the class cannot contains the icon selector"
	self deny: (SmockTestIconExport respondsTo: #iconCheckCircleFilled32x32).
	
	"serialize into a test Class"
	symbol := iconDescription serializeAsForm: SmockTestIconExport maxWidth: 32 maxHeight: 16.
	self assert: symbol equals: #iconCheckCircleFilled32x16.
	self assert: (SmockTestIconExport respondsTo: #iconCheckCircleFilled32x16).

	form := SmockTestIconExport perform: #iconCheckCircleFilled32x16.
	self assert: (form isKindOf: Form).
	self assert: form extent equals: (15@16).
]

{ #category : #tests }
AntDesignIconsLibraryTest >> testVectorialImageFile [

	| iconDescription file |
	iconDescription := AntDesignIconsLibrary new.
	iconDescription name: #checkCircle.
	file := iconDescription vectorialImageFile.
	self assert: file notNil.
	self assert: file exists.
	self assert: file basename equals: 'check-circle.svg'.

	iconDescription := AntDesignIconsLibrary new.
	iconDescription name: #checkCircleNotExists.
	file := iconDescription vectorialImageFile.
	self assert: file isNil.
]
