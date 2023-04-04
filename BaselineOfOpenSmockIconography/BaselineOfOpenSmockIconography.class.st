Class {
	#name : #BaselineOfOpenSmockIconography,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenSmockIconography
}

{ #category : #baselines }
BaselineOfOpenSmockIconography >> baseline: spec [
	<baseline> 
	spec
		for: #common
		do: [			
			self dependencies: spec.
			"Packages"
			spec
				package: 'OpenSmock-Iconography';
				package: 'OpenSmock-Iconography-Tests' with: [ spec requires: #('OpenSmock-Iconography') ].
		 ]
]

{ #category : #baselines }
BaselineOfOpenSmockIconography >> dependencies: spec [

	"do nothing"
]
