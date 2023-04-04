Class {
	#name : #SmockIconLibrary,
	#superclass : #SmockAbstractIconLibrary,
	#category : #'OpenSmock-Iconography-Core'
}

{ #category : #'embedded icons' }
SmockIconLibrary class >> faviconSmockWorkshop [
	<script: '(SmockIconLibrary name: #faviconSmockWorkshop) inspect'>

	^ ImageReadWriter formFromStream: 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAYAAADzoH0MAAAACXBIWXMAAAHNAAABzQGe8tNOAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAAAtdJREFUOE+dksFLW1kUxn83eeYRJxKwEDqUB3lB5FlluihSRAZRB7IQoitllop9+A+ojCIuha4UERqouJAGHURwJ+jKUuKAIZtZuNCFMAzSBIspT9+LxDsLe1+TSVy0H5zFveec73z3OxcpJd8bwBMgI6UkwI8hBMSEEE/q2B8LoEXX9dTo6Oifq6urn/r7+z8DvXWFVQ1B4GUoFPpjaGjor/X19X8LhcIXz/Ok53nStu2clBKtShZCiATwWzQaTY6Njb2YmJi47+3tfdbU1NRcXQcQCDy8XhNC/A6kYrHYr9PT0/+Mj4+HE4mEJYQI1bbUIhAICAAN+Al4f3BwkLQs65UqKBaLnJyccHV1hWmadHd3o2nfBAeDQQACUsp3wN/lcrmikisrK6RSKbLZLIVCgc3NTXp6etje3lYlNQoAuLu7qwDs7+9zfHzM0dFRzcTr62vm5ubo7Oykq6urnsDzvHuA3d1dZmZmapoBotEoa2tr/lmZ6H8kz/MqAOFwmFKppK4fhVLgEygPpqammJ2dJZfLqVRDCCGAKgLXde8BOjo62NjYYGlpiWQySSaT4ebmRpX5eFQBPJDs7OyQTqc5Pz+nr6+PxcXFGiJ/jepCKahGPB5nYWGBbDaLYRgMDw9TqTzMEV/fUGdiI2iaxuTkJG1tbeTzeaDxFu5vb2+5vLxUV3UolUpEIhGggQeu61aKxSIjIyMsLy9zdnamUjiOQzqdxnEcLMsCvj2h5iMZhsHh4SGZTIb5+XkuLi4QQqDrOoODg2xtbaly30SfwHXdCkAkEsG2bWzbVqmG8E0UQiSBmdPT01bHcQpSyrptNEK1ghwQ29vb625tbX0bDoeftbe3m6Zpxk3TjJqmqScSiaBpmkHDMCK6rjcBlMvlFiFEhyalLAohPgAjUso3/ogqCCGagZ+BpwMDA88ty/oln8/HgdfKAw/4ohr+DynlDXD+NT5W5/4DHvNfoN4xQ8MAAAAASUVORK5CYII=' base64Decoded asByteArray readStream 
]

{ #category : #private }
SmockIconLibrary class >> installEmbeddedIconsOn: aThemeIcons [

	self installEmbeddedIcon: self faviconSmockWorkshop name: #faviconSmockWorkshop in: aThemeIcons
]

{ #category : #accessing }
SmockIconLibrary class >> libraryName [

	^ 'Smock'
]
