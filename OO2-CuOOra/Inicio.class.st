Class {
	#name : #Inicio,
	#superclass : #WAComponent,
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #rendering }
Inicio >> crearPregunta [
 self call: CrearPreguntaComponent new.
]

{ #category : #rendering }
Inicio >> meGusta: aPost [
	self session cuoora
		valorarPublicacion: aPost
		usuario: self session usuario
		valor: 1
]

{ #category : #'as yet unclassified' }
Inicio >> mostrarPregunta: aPregunta on: aCanvas [
	
	aCanvas anchor
		callback: [ self renderPregunta: aPregunta ];
		with: 'Pregunta de ' , aPregunta autor nombre , ': ',aPregunta titulo.
	aCanvas break.
	aCanvas text: 'topicos: '.
	aPregunta topicos
		do: [ :each | 
			aCanvas anchor
				callback: [ self renderTopico: each ];
				with: each nombre.
			aCanvas text: ',' ].
	aCanvas paragraph: 'descripcion: ' , aPregunta descripcion.
	self renderValorar: aCanvas to: aPregunta.
	aCanvas break
]

{ #category : #rendering }
Inicio >> noGusta: aPost [
	self session cuoora
		valorarPublicacion: aPost
		usuario: self session usuario
		valor: -1
]

{ #category : #rendering }
Inicio >> renderPregunta: unaPregunta [
	self call: (RenderPreguntaComponent new: unaPregunta )
]

{ #category : #'as yet unclassified' }
Inicio >> renderTopico: unTopico [

	self call: (RenderTopicoComponent  new: unTopico )
]

{ #category : #'as yet unclassified' }
Inicio >> renderValorar: aCanvas to: aPost [
	aCanvas text: aPost calcularValoraciones.
	aCanvas break.
	aCanvas anchor
		callback: [ self meGusta: aPost ];
		with: [ aCanvas button: 'like' ].
	aCanvas anchor
		callback: [ self noGusta: aPost ];
		with: [ aCanvas button: 'dislike' ]
]
