"
This is a CardCreator. It creates and return a card based on the number of players and the total type of cards. 
"
Class {
	#name : #CardCreator,
	#superclass : #Object,
	#instVars : [
		'totalTypesOfCards',
		'iteratingIDNumber',
		'numberOfCard',
		'totalCardsOfEachType',
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Accesing }
CardCreator >> addAcelerationCards [
| totalNumberOfAccelerationCards |
totalNumberOfAccelerationCards:=(totalCardsOfEachType at:1 ).
	[ totalNumberOfAccelerationCards > 0 ]
		whileTrue: [ cards add: Acceleration withValue.
			totalNumberOfAccelerationCards:=totalNumberOfAccelerationCards-1. ]
]

{ #category : #Accesing }
CardCreator >> addCancelattionCards [
| totalNumberOfCancellationCards |
totalNumberOfCancellationCards:=(totalCardsOfEachType at:6 ).
	[ totalNumberOfCancellationCards > 0 ]
		whileTrue: [ cards add: Cancellation withValue.
			totalNumberOfCancellationCards:=totalNumberOfCancellationCards-1. ]
]

{ #category : #Accesing }
CardCreator >> addOverloadCards [
| totalNumberOfOverloadCards |
totalNumberOfOverloadCards:=(totalCardsOfEachType at:2 ).
	[ totalNumberOfOverloadCards > 0 ]
		whileTrue: [ cards add: Overload withValue.
			totalNumberOfOverloadCards:=totalNumberOfOverloadCards-1. ]
]

{ #category : #Accesing }
CardCreator >> addRedoCards [
| totalNumberOfRedoCards |
totalNumberOfRedoCards:=(totalCardsOfEachType at:4).
	[ totalNumberOfRedoCards > 0 ]
		whileTrue: [ cards add: Redo withValue.
			totalNumberOfRedoCards:=totalNumberOfRedoCards-1. ]
]

{ #category : #Accesing }
CardCreator >> addRepeatCards [
| totalNumberOfRepeatCards |
totalNumberOfRepeatCards:=(totalCardsOfEachType at:5).
	[ totalNumberOfRepeatCards > 0 ]
		whileTrue: [ cards add: Repeat withValue.
			totalNumberOfRepeatCards:=totalNumberOfRepeatCards-1. ]
]

{ #category : #Accesing }
CardCreator >> addSpeedCards [
| totalNumberOfSpeedCards |
totalNumberOfSpeedCards:=(totalCardsOfEachType at:3).
	[ totalNumberOfSpeedCards > 0 ]
		whileTrue: [ cards add: Speed withValue.
			totalNumberOfSpeedCards:=totalNumberOfSpeedCards-1. ]
]

{ #category : #Accesing }
CardCreator >> calculateProportionsOfCards: totalNumberOfCards [
|   accelerationCards overloadCards speedCards redoCards repeatCards cancelationCards quantityOfCardsByType |
	accelerationCards := (totalNumberOfCards * 0.2) floor.
	overloadCards := (totalNumberOfCards * 0.2) floor.
	speedCards := (totalNumberOfCards * 0.2) floor.
	redoCards := (totalNumberOfCards * 0.2) floor.
	repeatCards := (totalNumberOfCards * 0.2) floor.
	cancelationCards:= totalNumberOfCards - accelerationCards - overloadCards - speedCards - redoCards-repeatCards.
	quantityOfCardsByType := Array with: accelerationCards with:overloadCards with:speedCards with:redoCards with:repeatCards with:cancelationCards.
	^quantityOfCardsByType.
]

{ #category : #Accesing }
CardCreator >> createNCards: totalNumberOfCards [
	totalCardsOfEachType := self calculateProportionsOfCards: totalNumberOfCards.
	cards:= OrderedCollection new.
	self addAcelerationCards.
	self addOverloadCards.
	self addSpeedCards.
	self addRedoCards.
	self addRepeatCards.
	self addCancelattionCards.
	
	
	^ cards.
	
]
