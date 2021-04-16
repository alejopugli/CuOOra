Class {
	#name : #InicioUsuario,
	#superclass : #InicioComponent,
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #rendering }
InicioUsuario >> renderPublicacionesOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Publicaciones'.
	aCanvas
		unorderedList: [ (self session cuoora preguntasUsuario: self session usuario)
				do: [ :each | aCanvas listItem: each text ] ].
	aCanvas anchor
		callback: [ self crearPregunta ];
		with: [ aCanvas button: 'Nueva Pregunta' ]
]
