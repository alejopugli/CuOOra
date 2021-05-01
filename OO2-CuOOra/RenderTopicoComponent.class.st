Class {
	#name : #RenderTopicoComponent,
	#superclass : #WAComponent,
	#instVars : [
		'topico'
	],
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #'instance creation' }
RenderTopicoComponent class >> new: unTopico [
	^(self new)
	new: unTopico.

]

{ #category : #'instance creation' }
RenderTopicoComponent >> new: unTopico [
	topico := unTopico.
	^ self
]

{ #category : #rendering }
RenderTopicoComponent >> renderAgregarTopico: aCanvas [
	(self session usuario intereses includes: topico)
		ifFalse: [ 	aCanvas anchor
		callback: [ self session usuario agregarInteres: topico ];
		with: [ aCanvas button: 'agregar' ]]
]

{ #category : #rendering }
RenderTopicoComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Topico ' , topico nombre.
	self renderAgregarTopico: aCanvas.
	aCanvas horizontalRule.
	self renderPublicacionesOn: aCanvas.
	aCanvas horizontalRule.
	self renderVolverButtonOn: aCanvas
]

{ #category : #rendering }
RenderTopicoComponent >> renderPregunta: unaPregunta [
	self call: (RenderPreguntaComponent new: unaPregunta)
]

{ #category : #rendering }
RenderTopicoComponent >> renderPublicacionesOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Publicaciones'.
	aCanvas
		unorderedList: [ (self session cuoora preguntasPorTopico: topico)
				do: [ :each | 
					aCanvas anchor
						callback: [ self renderPregunta: each ];
						with: each titulo. aCanvas break ] ]
]

{ #category : #rendering }
RenderTopicoComponent >> renderVolverButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Volver' ] ]
]
