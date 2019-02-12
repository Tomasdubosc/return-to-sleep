Class {
	#name : #CardCreatorTest,
	#superclass : #TestCase,
	#instVars : [
		'cardCreator'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardCreatorTest >> setUp [
cardCreator:=CardCreator new.
]

{ #category : #tests }
CardCreatorTest >> testCreateACardCreatorThatCreates5Cards [
 | cardCreator |
cardCreator:=CardCreator new.
 self assert: (cardCreator createNCards: 5) size equals: 5
	
]
