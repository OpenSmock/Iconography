Extension { #name : #Object }

{ #category : #'*OpenSmock-Iconography' }
Object >> antFilledIconNamed: aSymbol [

	^ (AntDesignIconsLibrary name: aSymbol style: AntDesignIconsStyle filled) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> antIconNamed: aSymbol [

	^ (AntDesignIconsLibrary name: aSymbol) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> antIconNamed: aSymbol style: aSymbol2 [

	^ (AntDesignIconsLibrary name: aSymbol style: aSymbol2) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> antOutlinedIconNamed: aSymbol [

	^ (AntDesignIconsLibrary name: aSymbol style: AntDesignIconsStyle outlined) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> antTwoToneIconNamed: aSymbol [

	^ (AntDesignIconsLibrary name: aSymbol style: AntDesignIconsStyle twoTone) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> materialFilledIconNamed: aSymbol [

	^ (MaterialDesignIconsLibrary name: aSymbol style: MaterialDesignIconsStyle filled) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> materialIconNamed: aSymbol [

	^ (MaterialDesignIconsLibrary name: aSymbol) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> materialIconNamed: aSymbol style: aSymbol2 [

	^ (MaterialDesignIconsLibrary name: aSymbol style: aSymbol2) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> materialOutlinedIconNamed: aSymbol [

	^ (MaterialDesignIconsLibrary name: aSymbol style: MaterialDesignIconsStyle outlined) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> materialRoundedIconNamed: aSymbol [

	^ (MaterialDesignIconsLibrary name: aSymbol style: MaterialDesignIconsStyle rounded) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> materialSharpIconNamed: aSymbol [

	^ (MaterialDesignIconsLibrary name: aSymbol style: MaterialDesignIconsStyle sharp) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> materialTwoToneIconNamed: aSymbol [

	^ (MaterialDesignIconsLibrary name: aSymbol style: MaterialDesignIconsStyle twoTone) form
]

{ #category : #'*OpenSmock-Iconography' }
Object >> smockIconNamed: aSymbol [

	^ (SmockIconsLibrary name: aSymbol) form
]
