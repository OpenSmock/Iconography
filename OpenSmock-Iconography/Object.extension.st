Extension { #name : #Object }

{ #category : #'*OpenSmock-Iconography' }
Object >> materialDesignIconNamed: aSymbol [

	^ MaterialDesignIconsLibrary name: aSymbol
]

{ #category : #'*OpenSmock-Iconography' }
Object >> materialDesignIconNamed: aSymbol style: aSymbol2 [

	^ MaterialDesignIconsLibrary name: aSymbol style: aSymbol2
]

{ #category : #'*OpenSmock-Iconography' }
Object >> smockIconNamed: aSymbol [

	^ SmockIconsLibrary name: aSymbol
]
