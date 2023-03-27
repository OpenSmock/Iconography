Class {
	#name : #SmockAbtractIcon,
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
SmockAbtractIcon class >> cleanUp: anObject [

	self allSubclassesDo: [ :c | c reset ]
]

{ #category : #accessing }
SmockAbtractIcon class >> current [ 

	^ Current ifNil: [ Current := self loadDefault ]
]

{ #category : #testing }
SmockAbtractIcon class >> isAbstract [

	^ true
]

{ #category : #accessing }
SmockAbtractIcon class >> library [

	^ nil
]

{ #category : #accessing }
SmockAbtractIcon class >> loadDefault [

	^ ThemeIcons new name: self library
]

{ #category : #construction }
SmockAbtractIcon class >> name: aName [

	^ self name: aName style: nil size: nil scale: nil
]

{ #category : #construction }
SmockAbtractIcon class >> name: aName style: aStyle size: aSize scale: aScale [
	"Need to return a form"

	| icon |
	icon := self new.
	icon name: aName.
	icon style: aStyle.
	icon iconSize: aSize.
	icon scale: aScale.

	^ icon form
]

{ #category : #construction }
SmockAbtractIcon class >> reset [

	Current := nil
]

{ #category : #accessing }
SmockAbtractIcon >> buildSymbol [

	^ self name asSymbol
]

{ #category : #accessing }
SmockAbtractIcon >> form [

	| symbol |
	symbol := self buildSymbol.
	^ self class current iconNamed: symbol
]

{ #category : #accessing }
SmockAbtractIcon >> iconSize [

	^ iconSize
]

{ #category : #accessing }
SmockAbtractIcon >> iconSize: anObject [

	iconSize := anObject
]

{ #category : #accessing }
SmockAbtractIcon >> name [

	^ name
]

{ #category : #accessing }
SmockAbtractIcon >> name: anObject [

	name := anObject
]

{ #category : #accessing }
SmockAbtractIcon >> scale [

	^ scale
]

{ #category : #accessing }
SmockAbtractIcon >> scale: anObject [

	scale := anObject
]

{ #category : #accessing }
SmockAbtractIcon >> style [

	^ style
]

{ #category : #accessing }
SmockAbtractIcon >> style: anObject [

	style := anObject
]
