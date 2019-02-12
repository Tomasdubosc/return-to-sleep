Class {
	#name : #CardsDeck,
	#superclass : #Deck,
	#instVars : [
		'cards',
		'numberOfCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
CardsDeck class >> withCards: anArrayOfCards [
	^ self new initializeWithCards: anArrayOfCards .
]

{ #category : #Creating }
CardsDeck class >> withoutCards [
	^ self new initializeWithoutCards.
]

{ #category : #Accesing }
CardsDeck >> cards [
	^ cards
]

{ #category : #Initializing }
CardsDeck >> initializeWithCards: anArrayOfCards [
	cards:= anArrayOfCards.
	numberOfCard:= cards size.
]

{ #category : #Initializing }
CardsDeck >> initializeWithoutCards [
	cards:= OrderedCollection new.
]

{ #category : #Accesing }
CardsDeck >> nextCard [
|nextCard |
 (numberOfCard = 0)
	ifTrue: [ DeckOfCardsNextCardFailed  signal: 'You cannot get a card from the Deck when there is no more.' ].
	nextCard:= cards at: numberOfCard.
	cards remove: nextCard.
	numberOfCard := numberOfCard -1.
	^nextCard.
]

{ #category : #Accesing }
CardsDeck >> numberOfCard [
	^ numberOfCard
]

{ #category : #Accesing }
CardsDeck >> shuffleWith: discardedDeck [
	cards:= discardedDeck cards.
	numberOfCard:= cards size.
	discardedDeck removeCards.
]
