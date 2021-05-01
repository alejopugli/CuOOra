Class {
	#name : #RenderUsuarioComponent,
	#superclass : #WAComponent,
	#instVars : [
		'usuario'
	],
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #'instance creation' }
RenderUsuarioComponent class >> new: unUsuario [
	^ self new new: unUsuario 
]

{ #category : #'instance creation' }
RenderUsuarioComponent >> new: unUsuario [ 
	usuario:= unUsuario
	.^self
]

{ #category : #rendering }
RenderUsuarioComponent >> renderContentOn: aCanvas [
	aCanvas heading:  usuario nombre.
	self renderSeguirUsuario: aCanvas.
	aCanvas horizontalRule.
	self renderPublicacionesOn: aCanvas.
	aCanvas horizontalRule.
	self renderVolverButtonOn: aCanvas
]

{ #category : #rendering }
RenderUsuarioComponent >> renderPregunta: unaPregunta [
	self call: (RenderPreguntaComponent new: unaPregunta)
]

{ #category : #rendering }
RenderUsuarioComponent >> renderPublicacionesOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Publicaciones'.
	aCanvas
		unorderedList: [ (self session cuoora preguntasUsuario: usuario)
				do: [ :each | aCanvas anchor
						callback: [ self renderPregunta: each ];
						with: each titulo] ]
]

{ #category : #rendering }
RenderUsuarioComponent >> renderSeguirUsuario: aCanvas [
	(self session usuario seguidos includes: usuario)
		ifFalse: [ aCanvas anchor
				callback: [ self session usuario followUsuario: usuario ];
				with: [ aCanvas button: 'agregar' ] ]
]

{ #category : #rendering }
RenderUsuarioComponent >> renderVolverButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Volver' ] ]
]
