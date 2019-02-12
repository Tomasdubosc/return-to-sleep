Class {
	#name : #DeckOfCardsTest,
	#superclass : #TestCase,
	#instVars : [
		'cards',
		'deck',
		'discardDeck',
		'player1',
		'players',
		'judge',
		'gamepiece1',
		'dices1',
		'gamepieces',
		'board',
		'firstCard',
		'secondCard'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DeckOfCardsTest >> setUp [
	| nonEffect effect1 effect4 square0 square1 square2 square3 square4 squares |
	cards:=(CardCreator new) createNCards: 5.
	deck:= CardsDeck withCards: cards asOrderedCollection .
	discardDeck:= DiscardedCardsDeck withoutCards.
	nonEffect := NonEffect new.
	effect1 := MoonWalk withAPowerValue: 2.
	effect4 := SpeedUp withAPowerValue: 2.
	square0 := Square withAnEffect: nonEffect thatGivesCard: false.
	square1 := Square withAnEffect: nonEffect thatGivesCard: true.
	square2 := Square withAnEffect: nonEffect thatGivesCard: true.
	square3 := Square withAnEffect: nonEffect thatGivesCard: false.
	square4 := Square withAnEffect: effect4 thatGivesCard: false.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	firstCard := Overload withValue.
	secondCard := Overload withValue.
	gamepiece1 := Gamepiece withInitialPosition.
	gamepieces := Set new.
	gamepieces
		add: gamepiece1.
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: firstCard
		andOtherCard: secondCard.
	players := OrderedCollection new.
	players add: player1.

	dices1 := Set new.
	dices1 add: (LoadedDice withFaces: 1).
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 2.
	judge := Judge
		named: 'Pitana'
		assuring: players
		on: board
		with: deck.
]

{ #category : #tests }
DeckOfCardsTest >> testCreateADeckOfCards [
 self assert: deck cards size equals: 5.

]

{ #category : #tests }
DeckOfCardsTest >> testCreateADiscardDeck [
self assert: (discardDeck cards size) equals: 0

]

{ #category : #tests }
DeckOfCardsTest >> testGetNextCard [
	| newCard newCard2 |
	
	newCard:= deck nextCard.
	newCard2:= deck nextCard.
	self assert: deck cards size equals: 3.

]

{ #category : #tests }
DeckOfCardsTest >> testGetNextCardWhenDeckDoesNotHaveCards [
| card1 card2 card3 card4 card5 |
card1:= deck nextCard.
card2:= deck nextCard.
card3:=deck nextCard.
card4:= deck nextCard.
card5:= deck nextCard.

	self
		should: [ deck nextCard]
		raise: DeckOfCardsNextCardFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'You cannot get a card from the Deck when there is no more.' ].
]

{ #category : #tests }
DeckOfCardsTest >> testPlayACardAfterDoingShuffle [
 |card1 card2 card3 card4 card5 discardedcard |
card1:= deck nextCard.
card2 := deck nextCard.
card3:= deck nextCard.
card4:= deck nextCard.


player1 playsATurnWith: dices1.
	board updateGamepiecesPositionOnBoard.
	card5 := judge giveCardTo: player1.
	player1
		playCard: card5 applyTo: players  andTellJudge: judge.
discardDeck addCard:card5.
deck shuffleWith: discardDeck.
self assert: deck numberOfCard equals: 1.
	board updateGamepiecesPositionOnBoard.
	discardedcard := judge giveCardTo: player1.
	player1
		playCard: card5 applyTo: players  andTellJudge: judge.
		self assert: deck cards size equals: 0.






]

{ #category : #tests }
DeckOfCardsTest >> testShuffleDeckWithDiscardedCards [
| card1 card2 card3 card4 card5 |
card1:= deck nextCard.
card2 := deck nextCard.
card3:= deck nextCard.
card4:= deck nextCard.


player1 playsATurnWith: dices1.
	board updateGamepiecesPositionOnBoard.
	card5 := judge giveCardTo: player1.
	player1
		playCard: card5 applyTo: players  andTellJudge: judge.
discardDeck addCard:card5.
deck shuffleWith: discardDeck.
self assert: (deck cards size) equals: 1.
self assert: (discardDeck cards size) equals: 0.



]

{ #category : #tests }
DeckOfCardsTest >> testaddACardPlayedToADiscardDeck [
| card1 card2 card3 |

player1 playsATurnWith: dices1.
	board updateGamepiecesPositionOnBoard.
	card1 := judge giveCardTo: player1.
	player1
		playCard: card1
		applyingEffect: board lastSquareEffectApplied
		andTellJudge:judge.
discardDeck addCard:card1.
self assert: discardDeck cards size equals: 1.

]
