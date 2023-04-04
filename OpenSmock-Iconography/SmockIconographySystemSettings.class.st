Class {
	#name : #SmockIconographySystemSettings,
	#superclass : #Object,
	#classInstVars : [
		'CacheMaterialDesignIcons4Directory'
	],
	#category : #'OpenSmock-Iconography-IDE'
}

{ #category : #properties }
SmockIconographySystemSettings class >> defaultIconsDirectory [

	^ (FileLocator localDirectory / 'resources' / 'icons') ensureCreateDirectory
]

{ #category : #properties }
SmockIconographySystemSettings class >> defaultMaterialDesignIcons4Directory [

	^ (self defaultIconsDirectory / 'material-design-icons-4.0.0') ensureCreateDirectory
]

{ #category : #actions }
SmockIconographySystemSettings class >> materialDesignIcons4Directory [

	^ CacheMaterialDesignIcons4Directory ifNil:[ self defaultMaterialDesignIcons4Directory ]
]

{ #category : #actions }
SmockIconographySystemSettings class >> materialDesignIcons4Directory: aDirectory [

	CacheMaterialDesignIcons4Directory := aDirectory
]

{ #category : #actions }
SmockIconographySystemSettings class >> materialDesignIconsDirectory [

	^ self materialDesignIcons4Directory
]

{ #category : #actions }
SmockIconographySystemSettings class >> materialDesignIconsDirectory: aDirectory [

	^ self materialDesignIcons4Directory: aDirectory
]

{ #category : #settings }
SmockIconographySystemSettings class >> smockIconsLibrarySettingOn: aBuilder [
	<systemsettings>

	(aBuilder setting: #materialDesignIconsDirectory)
		parent: #smockIconsLibrary;
		label: 'Material Design Icons directory';
		target: self;
		type: #Directory;
		default:  self defaultIconsDirectory;
		description: 'Setup material design icons directory'
]

{ #category : #settings }
SmockIconographySystemSettings class >> smockWorkshopSettingOn: aBuilder [
	<systemsettings>

	"parent can not exists"
	(aBuilder group: #smockIconsLibrary)
		label: 'Icons Library';
		parent: #smockWorkshop.
]
