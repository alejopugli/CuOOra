Class {
	#name : #InicioComponent,
	#superclass : #WAComponent,
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #rendering }
InicioComponent >> crearPregunta [
 self call: CrearPreguntaComponent new.
]

{ #category : #rendering }
InicioComponent >> inicioUsuario [
self call: InicioUsuario new.
]

{ #category : #rendering }
InicioComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Bienvenido '.
	aCanvas anchor
		callback: [ self inicioUsuario ];
		with: [ (self session usuario) nombre ].
	aCanvas horizontalRule.
	self renderPublicacionesOn: aCanvas.
	aCanvas horizontalRule.
	self renderLogoutButtonOn: aCanvas
]

{ #category : #rendering }
InicioComponent >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Salir' ] ]
]

{ #category : #rendering }
InicioComponent >> renderPublicacionesOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Publicaciones'.
	aCanvas
		unorderedList: [ (self session cuoora preguntasRelevantes: self session usuario)
				do: [ :each | aCanvas listItem: each titulo ] ].
	aCanvas anchor
		callback: [ self crearPregunta ];
		with: [ aCanvas button: 'Nueva Pregunta' ]
]
