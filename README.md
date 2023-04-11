# Iconography

Import, manage, get and store/cache icons into libraries from standard icons libraries.

Currently supported version : 
- Material Design Icons 4.0.0 - https://github.com/google/material-design-icons

This project wrap `ThemeIcons` to provide common icons libraries. Each asked icon is on-the-fly downloaded from library files and cached into the system to have an instant access.

![image](https://user-images.githubusercontent.com/49183340/229850382-7ec18735-7b97-42e8-bad6-83f0ce69d876.png)

## How to use

### Material Design Icons library

Download icons package here : https://github.com/google/material-design-icons/releases/tag/4.0.0

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

## How to install

```smalltalk
Metacello new
   baseline: 'OpenSmockIconography';
   repository: 'github://OpenSmock/Iconography:main';
   load.
```
