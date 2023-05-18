Class {
	#name : #SmockIconographySystemSettings,
	#superclass : #Object,
	#classInstVars : [
		'CacheMaterialDesignIcons4Directory',
		'CacheAntDesignIconsDirectory'
	],
	#category : #'OpenSmock-Iconography-IDE'
}

{ #category : #'actions - ant design' }
SmockIconographySystemSettings class >> antDesignIconsDirectory [

	^ CacheAntDesignIconsDirectory ifNil:[ self defaultAntDesignIconsDirectory ]
]

{ #category : #'actions - ant design' }
SmockIconographySystemSettings class >> antDesignIconsDirectory: aDirectory [

	CacheAntDesignIconsDirectory := aDirectory
]

{ #category : #'settings - ant design' }
SmockIconographySystemSettings class >> antDesignLibrarySettingOn: aBuilder [
	<systemsettings>

	(aBuilder setting: #antDesignIconsDirectory)
		parent: #smockIconsLibrary;
		label: 'Ant Design Icons directory';
		target: self;
		type: #Directory;
		default:  self defaultIconsDirectory;
		description: 'Setup Ant Design icons directory, this should be a copy of https://github.com/ant-design/ant-design-icons repository'
]

{ #category : #'properties - ant design' }
SmockIconographySystemSettings class >> defaultAntDesignIconsDirectory [

	^ (self defaultIconsDirectory / 'ant-design-icons-master') ensureCreateDirectory
]

{ #category : #properties }
SmockIconographySystemSettings class >> defaultIconsDirectory [

	^ (FileLocator localDirectory / 'resources' / 'icons') ensureCreateDirectory
]

{ #category : #'properties - material design' }
SmockIconographySystemSettings class >> defaultMaterialDesignIcons4Directory [

	^ (self defaultIconsDirectory / 'material-design-icons-4.0.0') ensureCreateDirectory
]

{ #category : #'actions - material design' }
SmockIconographySystemSettings class >> materialDesignIcons4Directory [

	^ CacheMaterialDesignIcons4Directory ifNil:[ self defaultMaterialDesignIcons4Directory ]
]

{ #category : #'actions - material design' }
SmockIconographySystemSettings class >> materialDesignIcons4Directory: aDirectory [

	CacheMaterialDesignIcons4Directory := aDirectory
]

{ #category : #'actions - material design' }
SmockIconographySystemSettings class >> materialDesignIconsDirectory [

	^ self materialDesignIcons4Directory
]

{ #category : #'actions - material design' }
SmockIconographySystemSettings class >> materialDesignIconsDirectory: aDirectory [

	^ self materialDesignIcons4Directory: aDirectory
]

{ #category : #'settings - material design' }
SmockIconographySystemSettings class >> materialDesignLibrarySettingOn: aBuilder [
	<systemsettings>

	(aBuilder setting: #materialDesignIconsDirectory)
		parent: #smockIconsLibrary;
		label: 'Material Design Icons directory';
		target: self;
		type: #Directory;
		default:  self defaultIconsDirectory;
		description: 'Setup Material Design icons directory'
]

{ #category : #settings }
SmockIconographySystemSettings class >> smockWorkshopSettingOn: aBuilder [
	<systemsettings>

	"parent can not exists"
	(aBuilder group: #smockIconsLibrary)
		label: 'Icons Library';
		parent: #smockWorkshop.
]
