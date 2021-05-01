Class {
	#name : #RenderPreguntaComponent,
	#superclass : #WAComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #'instance creation' }
RenderPreguntaComponent class >> new: unaPregunta [
	^ self new new: unaPregunta 
]

{ #category : #rendering }
RenderPreguntaComponent >> meGusta: aPost [
	self session cuoora
		valorarPublicacion: aPost
		usuario: self session usuario
		valor: 1
]

{ #category : #rendering }
RenderPreguntaComponent >> new: unaPregunta [
pregunta:= unaPregunta .^self
	
]

{ #category : #rendering }
RenderPreguntaComponent >> noGusta: aPost [
	self session cuoora
		valorarPublicacion: aPost
		usuario: self session  usuario
		valor: -1
]

{ #category : #rendering }
RenderPreguntaComponent >> renderContentOn: aCanvas [
	aCanvas heading: pregunta titulo.
	aCanvas text: pregunta descripcion.
	aCanvas break.
	self renderValorar: aCanvas to: pregunta.
	self renderResponder: aCanvas.
	aCanvas horizontalRule.
	self renderRespuestas: aCanvas.
	aCanvas horizontalRule.
	self renderVolverButtonOn: aCanvas
]

{ #category : #rendering }
RenderPreguntaComponent >> renderRepuesta: unaRespuesta on: aCanvas [
	aCanvas horizontalRule.
	aCanvas text: unaRespuesta descripcion.
]

{ #category : #rendering }
RenderPreguntaComponent >> renderResponder: aCanvas [
	aCanvas anchor 
		callback: [ self responder: pregunta ];
		with: [aCanvas button:'Reponder']
]

{ #category : #rendering }
RenderPreguntaComponent >> renderRespuestas: aCanvas [
	aCanvas break.
	aCanvas
		unorderedList: [ pregunta respuestas
				do: [ :each | 
					aCanvas heading
						level4;
						with: 'respuesta de ', each autor nombre.
					aCanvas text: each descripcion.
					aCanvas break.
					self renderValorar: aCanvas to: each ] ]
]

{ #category : #rendering }
RenderPreguntaComponent >> renderValorar: aCanvas to: aPost [
	aCanvas text: aPost calcularValoraciones.
	aCanvas break.
	aCanvas anchor
		callback: [ self meGusta: aPost ];
		with: [ aCanvas button: 'like' ].
	aCanvas anchor
		callback: [ self noGusta: aPost ];
		with: [aCanvas button: 'dislike']
]

{ #category : #rendering }
RenderPreguntaComponent >> renderVolverButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Atras' ] ]
]

{ #category : #rendering }
RenderPreguntaComponent >> responder: unPost [
	self call: (CrearRespuestaComponent new: unPost)
]
