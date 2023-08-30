[![License](https://img.shields.io/github/license/OpenSmock/Iconography.svg)](./LICENSE)
[![Pharo 11 CI](https://github.com/OpenSmock/Iconography/actions/workflows/Pharo11CI.yml/badge.svg)](https://github.com/OpenSmock/Iconography/actions/workflows/Pharo11CI.yml)
[![Pharo 12 CI](https://github.com/OpenSmock/Iconography/actions/workflows/Pharo12CI.yml/badge.svg)](https://github.com/OpenSmock/Iconography/actions/workflows/Pharo12CI.yml)

# Iconography

![image](https://github.com/OpenSmock/Iconography/assets/49183340/836be8c3-6b11-4b49-90ac-d9a122cdbcab)

Import, manage, get and store/cache icons into Pharo from standard icons libraries.

This project provide support of icons libraries (Material design icons, Ant Design icons, Awesome font icons, etc.). These libraries provide multiples icons `themes` and `styles`, with a lot a icons (more than thousands) and with multiples size and colorization for each ones. This project have to objective of easily offer a management of icons  and provide a simple way to use them. The other point is to provide a cache mecanism to get and cash only required Icons and not always load every thousands. 

Currently supported libraries : 
- Material Design Icons 4.0.0 - [https://github.com/google/material-design-icons](https://github.com/google/material-design-icons)
- Ant Design Icons - [https://github.com/ant-design/ant-design-icons](https://github.com/ant-design/ant-design-icons)

This project embed a `SmockIconsLibrary` used by us to store our projects icons, if you have your own icons you can implement you own library class.

This project can be used to easily generate some icons sets for your project (see export/serialize section).

This project wrap `ThemeIcons` to provide common icons libraries. Each asked icon is on-the-fly downloaded from library files and cached into the system to have an instant access.

![image](https://user-images.githubusercontent.com/49183340/229850382-7ec18735-7b97-42e8-bad6-83f0ce69d876.png)

## Getting Started

### Installation

To install Molecule on your Pharo image you can just execute the following script:

```smalltalk
Metacello new
   baseline: 'OpenSmockIconography';
   repository: 'github://OpenSmock/Iconography:main';
   load.
```

## How to use

Each librairy provide sets of icons in different styles, sizes, formats and customization capacities.
Default returned style depends of the target library, see documentation about each librairies below.
The name of each icon depends of the target library, see each link below to explore libraries catalogue.

### Get an icon as a Form (raster image)

To get an icon with the default style (from Object method) : 

```smalltalk
"Material Design icon"
form := self materialIconNamed: #check_circle.

"Ant Design icon"
form := self antIconNamed: #checkCircle.
```

To get an icon with a specific style : 

```smalltalk
"Material Design icon"
form := self materialSharpIconNamed: #check_circle.

"Ant Design icon"
form := self antOutlinedIconNamed: #checkCircle.
```

### Export / Serialize icons

To serialize icons into your project classes :

```smalltalk
iconDescription := AntDesignIconsLibrary new name: #checkCircle.
iconDescription serializeAsForm: MyProjectClass maxWidth: 32 maxHeight: 32.
```

The icon is stored in `MyProjectClass` as a class method, the name of the generated method is returned by `SmockAbstractIconsLibrary>>serializeAsForm:maxWidth:maxHeight:`.

### Material Design Icons library

![image](https://github.com/OpenSmock/Iconography/assets/49183340/bb69178c-6082-4068-92b5-bfcc8d4a5807)

To explore available icons this is here : [https://fonts.google.com/icons?icon.set=Material+Icons](https://fonts.google.com/icons?icon.set=Material+Icons)

Download icons package here : [https://github.com/google/material-design-icons/releases/tag/4.0.0](https://github.com/google/material-design-icons/releases/tag/4.0.0)

Unzip the archive in your computer : 

![image](https://user-images.githubusercontent.com/49183340/229849591-2ca48e2e-d816-49dc-abf2-d32be1d856db.png)

Setup the directory with the unziped directoy with the dedicated settings section : 

![image](https://user-images.githubusercontent.com/49183340/229849889-d8a3946a-070c-4fa2-b423-f49a63e8a9cd.png)

There are three different ways to get an icon :

```smalltalk
"from object method"
self materialIconNamed: #check.

"from class access method"
MaterialDesignIconsLibrary name: #check.

"from direct class version access method, in case of multiple supported versions, here this is 4th version of the library"
MaterialDesignIcons4Library name: #check.
```

#### Choose a style

Material Design 4 provide 5 icon styles : Filled (by default), Outlined, Rounded, Sharp and TwoTone.

These style are enumerated in `MaterialDesignIconsStyle`.

![image](https://user-images.githubusercontent.com/49183340/230070325-8eb61ff7-7037-449f-95df-b62bd82200f5.png)

To use it :

```smalltalk
"3 ways to get a Form from Object method for each styles"
form := self materialFilledIconNamed: #check_circle. "returned by default"
form := self materialIconNamed: #check_circle style: #filled. "returned by default"
form := self materialIconNamed: #check_circle style: MaterialDesignIconsStyle filled. "returned by default"

form := self materialOutlinedIconNamed: #check_circle.
form := self materialIconNamed: #check_circle style: #outlined.
form := self materialIconNamed: #check_circle style: MaterialDesignIconsStyle outlined.

form := self materialRoundedIconNamed: #check_circle.
form := self materialIconNamed: #check_circle style: #rounded.
form := self materialIconNamed: #check_circle style: MaterialDesignIconsStyle rounded.

form := self materialSharpIconNamed: #check_circle.
form := self materialIconNamed: #check_circle style: #sharp.
form := self materialIconNamed: #check_circle style: MaterialDesignIconsStyle sharp.

form := self materialTwoToneIconNamed: #check_circle.
form := self materialIconNamed: #check_circle style: #twoTone.
form := self materialIconNamed: #check_circle style: MaterialDesignIconsStyle twoTone.
```

### Ant Design Icons library

![image](https://github.com/OpenSmock/Iconography/assets/49183340/fab7aafa-dca3-4766-ac2a-25ba21707d48)

To explore available icons this is here : [https://ant.design/components/icon](https://ant.design/components/icon)

Download the code of the official github project as a ZIP (it contains the icons package) here : [https://github.com/ant-design/ant-design-icons](https://github.com/ant-design/ant-design-icons)

Unzip the archive in your computer.

Setup the directory with the unziped directoy with the dedicated settings section.

There are three different ways to get an icon :

```smalltalk
"from object method"
self antIconNamed: #checkCircle.

"from class access method"
AntDesignIconsLibrary name: #checkCircle.
```

#### Choose a style

Ant Design provide 3 icon styles : Filled (by default), Outlined and TwoTone.

These style are enumerated in `AntDesignIconsStyle`.

To use it :

```smalltalk
"3 ways to get a Form from Object method for each styles"
form := self antFilledIconNamed: #checkCircle. "returned by default"
form := self antIconNamed: #checkCircle style: #filled. "returned by default"
form := self antIconNamed: #checkCircle style: AntDesignIconsStyle filled. "returned by default"

form := self antOutlinedIconNamed: #checkCircle. "returned by default"
form := self antIconNamed: #checkCircle style: #outlined. "returned by default"
form := self antIconNamed: #checkCircle style: AntDesignIconsStyle outlined.

form := self antTwoToneIconNamed: #checkCircle. "returned by default"
form := self antIconNamed: #checkCircle style: #twoTone. "returned by default"
form := self antIconNamed: #checkCircle style: AntDesignIconsStyle twoTone.
```

## Dependencies

- [Athens-SVG](https://github.com/pharo-contributions/Athens-SVG)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
