Class {
	#name : #DiscardedCardsDeck,
	#superclass : #Deck,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
DiscardedCardsDeck class >> withoutCards [
	^ self new initializeWithoutCards.
]

{ #category : #Accesing }
DiscardedCardsDeck >> addCard: aCardPlayed [
cards add: aCardPlayed.
]

{ #category : #Accesing }
DiscardedCardsDeck >> cards [
	^ cards
]

{ #category : #Initializing }
DiscardedCardsDeck >> initializeWithoutCards [
	cards:= OrderedCollection new.
]

{ #category : #Accesing }
DiscardedCardsDeck >> numberOfCard [
	self shouldBeImplemented.
]

{ #category : #Accesing }
DiscardedCardsDeck >> removeCards [
	cards:=OrderedCollection new.
]
