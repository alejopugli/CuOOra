Class {
	#name : #RenderTopicosComponent,
	#superclass : #WAComponent,
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #rendering }
RenderTopicosComponent >> renderAgregarTopico: unTopico on: aCanvas [
	(self session usuario intereses includes: unTopico)
		ifFalse: [ aCanvas anchor
				callback: [ self session usuario agregarInteres: unTopico ];
				with: [ aCanvas button: ' seguir topico ' ] ]
]

{ #category : #rendering }
RenderTopicosComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Topicos '.
	aCanvas horizontalRule.
	aCanvas
		unorderedList: [ self session cuoora topicos
				do: [ :each | 
					aCanvas anchor
						callback: [ self topico: each ];
						with: each nombre.
					
					self renderAgregarTopico: each on: aCanvas. aCanvas break ] ].
	aCanvas horizontalRule.
	self renderVolverButtonOn: aCanvas
]

{ #category : #rendering }
RenderTopicosComponent >> renderVolverButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Volver' ] ]
]

{ #category : #rendering }
RenderTopicosComponent >> topico: unTopico [
	self call: (RenderTopicoComponent new: unTopico)
]
