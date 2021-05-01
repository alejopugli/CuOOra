Class {
	#name : #InicioComponent,
	#superclass : #Inicio,
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #rendering }
InicioComponent >> inicioUsuario [
self call: InicioUsuario new.
]

{ #category : #'as yet unclassified' }
InicioComponent >> publicaciones [
	^ (self session cuoora preguntasRelevantes: self session usuario) asSortedCollection:[:uno :dos| uno fechaYHora > dos fechaYHora ]
]

{ #category : #rendering }
InicioComponent >> renderContentOn: aCanvas [
	
	aCanvas heading: 'Bienvenido ' , self session usuario nombre.
	aCanvas anchor
		callback: [ self inicioUsuario ];
		with: [ aCanvas button with: 'Mi Perfil' ].
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
				with: [ aCanvas button with: 'Log Out' ] ]
]

{ #category : #rendering }
InicioComponent >> renderPublicacionesOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Publicaciones'.
	aCanvas anchor
		callback: [ self crearPregunta ];
		with: [ aCanvas button: 'Nueva Pregunta' ].
		aCanvas break.
	self publicaciones asOrderedCollection size < 5
		ifTrue: [ self publicaciones
				do: [ :each | 
					self mostrarPregunta: each on: aCanvas.
					aCanvas break ] ]
		ifFalse: [ (self publicaciones asOrderedCollection first: 5)
				do: [ :each | 
					self mostrarPregunta: each on: aCanvas.
					aCanvas break ] ]
]
