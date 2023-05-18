# Iconography

Import, manage, get and store/cache icons into Pharo from standard icons libraries.

This project provide support of icons libraries (Material design icons, Ant Design icons, Awesome font icons, etc.). These libraries provide multiples icons `themes` and `styles`, with a lot a icons (more than thousands) and with multiples size and colorization for each ones. This project have to objective of easily offer a management of icons  and provide a simple way to use them. The other point is to provide a cache mecanism to get and cash only required Icons and not always load every thousands. 

Currently supported libraries : 
- Material Design Icons 4.0.0 - [https://github.com/google/material-design-icons](https://github.com/google/material-design-icons)
- Ant Design Icons - [https://github.com/ant-design/ant-design-icons](https://github.com/ant-design/ant-design-icons)

This project embed a `SmockIconsLibrary` used by us to store our projects icons, if you have your own icons you can implement you own library class.

This project wrap `ThemeIcons` to provide common icons libraries. Each asked icon is on-the-fly downloaded from library files and cached into the system to have an instant access.

![image](https://user-images.githubusercontent.com/49183340/229850382-7ec18735-7b97-42e8-bad6-83f0ce69d876.png)

## How to use

### Material Design Icons library

To explore available icons this is here : [https://fonts.google.com/icons?icon.set=Material+Icons](https://fonts.google.com/icons?icon.set=Material+Icons)

Download icons package here : [https://github.com/google/material-design-icons/releases/tag/4.0.0](https://github.com/google/material-design-icons/releases/tag/4.0.0)

Unzip the archive in your computer : 

![image](https://user-images.githubusercontent.com/49183340/229849591-2ca48e2e-d816-49dc-abf2-d32be1d856db.png)

Setup the directory with the unziped directoy with the dedicated settings section : 

![image](https://user-images.githubusercontent.com/49183340/229849889-d8a3946a-070c-4fa2-b423-f49a63e8a9cd.png)

There are three different ways to get an icon :

```smalltalk
"from object method"
self materialDesignIconNamed: #check.

"from class access method"
MaterialDesignIconsLibrary name: #check.

"from direct class version access method, in case of multiple supported versions"
MaterialDesignIcons4Library name: #check.
```

#### Choose a style

Material Design 4 provide 5 icon styles : Filled (by default), Outlined, Rounded, Sharp and TwoTone.

These style are enumerated in `MaterialDesignIconsStyle`.

![image](https://user-images.githubusercontent.com/49183340/230070325-8eb61ff7-7037-449f-95df-b62bd82200f5.png)

To use it :

```smalltalk
"from object method"
self materialDesignIconNamed: #check_circle style: MaterialDesignIconsStyle filled. "returned by default"
self materialDesignIconNamed: #check_circle style: MaterialDesignIconsStyle outlined.
self materialDesignIconNamed: #check_circle style: MaterialDesignIconsStyle rounded.
self materialDesignIconNamed: #check_circle style: MaterialDesignIconsStyle sharp.
self materialDesignIconNamed: #check_circle style: MaterialDesignIconsStyle twoTone.
```

### Ant Design Icons library

To explore available icons this is here : [https://ant.design/components/icon](https://ant.design/components/icon)

Download icons package here : [https://github.com/ant-design/ant-design-icons](https://github.com/ant-design/ant-design-icons)

There are three different ways to get an icon :

```smalltalk
"from object method"
self antDesignIconNamed: #checkCircle.

"from class access method"
AntDesignIconsLibrary name: #checkCircle.
```
#### Choose a style

Ant Design provide 3 icon styles : Filled (by default), Outlined and TwoTone.

These style are enumerated in `AntDesignIconsStyle`.

To use it :

```smalltalk
"from object method"
self antDesignIconNamed: #checkCircle style: AntDesignIconsStyle filled. "returned by default"
self antDesignIconNamed: #checkCircle style: AntDesignIconsStyle outlined.
self antDesignIconNamed: #checkCircle style: AntDesignIconsStyle twoTone.
```

## How to install

```smalltalk
Metacello new
   baseline: 'OpenSmockIconography';
   repository: 'github://OpenSmock/Iconography:main';
   load.
```
## Dependencies

SVG Parser : [Athens-SVG](https://github.com/pharo-contributions/Athens-SVG)
