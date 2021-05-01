Class {
	#name : #InicioUsuario,
	#superclass : #Inicio,
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #rendering }
InicioUsuario >> buscarTopico [
	self call: RenderTopicosComponent new
]

{ #category : #rendering }
InicioUsuario >> buscarTopico: aCanvas [
aCanvas
		unorderedList: [ self session cuoora topicos
				do: [ :each | 
					aCanvas anchor
						callback: [ self topico: each ];
						with: each nombre.
					aCanvas break ] ]
]

{ #category : #rendering }
InicioUsuario >> buscarUsuarios [ 
self call: BuscarUsuariosComponent new.
]

{ #category : #rendering }
InicioUsuario >> crearTopico [
		self call: CrearTopicoComponent new
]

{ #category : #rendering }
InicioUsuario >> eliminar: unaPregunta [
	self session cuoora eliminarPregunta: unaPregunta.
	
]

{ #category : #rendering }
InicioUsuario >> eliminarPublicacion: aPregunta on: aCanvas [.
					
	aCanvas anchor
		callback: [ self eliminar: aPregunta ];
		with: [ aCanvas button: 'Eliminar' ]
]

{ #category : #rendering }
InicioUsuario >> renderContentOn: aCanvas [
	aCanvas heading: 'Perfil ' , self session usuario nombre.
	self renderPuntajeOn: aCanvas.
	aCanvas horizontalRule.
	self renderPublicacionesOn: aCanvas.
	aCanvas horizontalRule.
	self renderTopicosOn: aCanvas.
	aCanvas horizontalRule.
	self renderSeguidosOn: aCanvas.
	aCanvas horizontalRule.
	self renderVolverButtonOn: aCanvas
]

{ #category : #rendering }
InicioUsuario >> renderPublicacionesOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Publicaciones'.
	aCanvas
		unorderedList: [ (self session cuoora preguntasUsuario: self session usuario)
				do: [ :each | 
					aCanvas anchor
						callback: [ self renderPregunta: each ];
						with: each titulo.
					self eliminarPublicacion: each on:aCanvas.
					aCanvas break ] ].
	aCanvas anchor
		callback: [ self crearPregunta ];
		with: [ aCanvas button: 'Nueva Pregunta' ]
]

{ #category : #rendering }
InicioUsuario >> renderPuntajeOn: aCanvas [
	aCanvas text: 'Mi puntaje: '.
	aCanvas text:(
self session cuoora calcularPuntaje: self session usuario)
]

{ #category : #rendering }
InicioUsuario >> renderSeguidosOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Seguidos'.
	aCanvas
		unorderedList: [ self session usuario seguidos
				do: [ :each | 
					aCanvas anchor
						callback: [ self usuario: each ];
						with: each nombre.
					] ].
	aCanvas anchor
		callback: [ self buscarUsuarios ];
		with: [ aCanvas button: 'Buscar Amigo' ]
]

{ #category : #rendering }
InicioUsuario >> renderTopicosOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Topicos de Interes'.
	aCanvas
		unorderedList: [ self session usuario intereses
				do: [ :each | 
					aCanvas anchor
						callback: [ self topico: each ];
						with: each nombre.
					aCanvas break ] ].
	aCanvas anchor
		callback: [ self crearTopico ];
		with: [ aCanvas button: 'Nuevo Topico' ].
	aCanvas anchor
		callback: [ self buscarTopico ];
		with: [ aCanvas button: 'Buscar Topico' ]
]

{ #category : #rendering }
InicioUsuario >> renderVolverButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Volver' ] ]
]

{ #category : #rendering }
InicioUsuario >> topico: unTopico [
	self call: (RenderTopicoComponent new: unTopico )
]

{ #category : #rendering }
InicioUsuario >> usuario: each [
	self call: (RenderUsuarioComponent new: each)
]
