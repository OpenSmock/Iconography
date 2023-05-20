Class {
	#name : #SmockIconographyExamples,
	#superclass : #Object,
	#category : #'OpenSmock-Iconography-Examples'
}

{ #category : #examples }
SmockIconographyExamples class >> exampleMaterialDesignIcon [
	<script:'self exampleMaterialDesignIcon inspect'>
	
	| form |
	form := self materialIconNamed: #check.
	^ form
]

{ #category : #examples }
SmockIconographyExamples class >> exampleMaterialDesignIconStyles [
	<script:'self exampleMaterialDesignIconStyles inspect'>
	
	| oc |
	oc := OrderedCollection new.	
	oc add: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle filled). " the default style sended "
	oc add: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle outlined).
	oc add: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle rounded).
	oc add: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle sharp).
	oc add: (self materialIconNamed: #check_circle style: MaterialDesignIconsStyle twoTone).
	^ oc
]

{ #category : #examples }
SmockIconographyExamples class >> exampleSmockIcon [
	<script:'self exampleSmockIconLibrary inspect'>
	
	| form |
	form := self smockIconNamed: #faviconSmockWorkshop.
	^ form
]

{ #category : #'see class side' }
SmockIconographyExamples >> seeClassSide [ 
]
