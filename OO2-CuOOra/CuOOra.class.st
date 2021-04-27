Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'preguntas',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'OO2-CuOOra-Model'
}

{ #category : #accessing }
CuOOra class >> clearSoleInstance [
	soleInstance := nil.
]

{ #category : #accessing }
CuOOra class >> soleInstance [
	soleInstance ifNil: [ soleInstance := self new ].
	^ soleInstance
]

{ #category : #'adding item' }
CuOOra >> agregarPregunta: pregunta [.
	preguntas add: pregunta.
]

{ #category : #'adding item' }
CuOOra >> agregarTopico: nombre descripcion: descripcion [
	(topicos anySatisfy: [ :each | each nombre = nombre ])
		ifTrue: [ ^ Error signal ]
		ifFalse: [ ^ topicos add: (Topico nombre: nombre descripcion: descripcion) ]
]

{ #category : #accessing }
CuOOra >> buscarUsuario: unNombre [
^usuarios select: [ :each | each nombre asLowercase includesSubstring: unNombre asLowercase ]
]

{ #category : #calculations }
CuOOra >> calcularPuntaje: unUsuario [
	| p r |
	p := self preguntasUsuario: unUsuario.
	r := self respuestasUsuario: unUsuario.
	^ p size * 20 + (r size * 50)
		+ (p sumNumbers: [ :each | each calcularValoraciones ])
		+ (r sumNumbers: [ :each | each calcularValoraciones ])
]

{ #category : #'adding item' }
CuOOra >> crearPregunta: unString descripcion: unaDescripcion autor: unUsuario topicos: unosTopicos [
	|pregunta| 
	pregunta :=(Pregunta
				new: unString
				descripcion: unaDescripcion
				autor: unUsuario
				topicos: unosTopicos). 
	unosTopicos agregarPregunta: pregunta.
	self agregarPregunta: pregunta.
	^pregunta 
]

{ #category : #'adding item' }
CuOOra >> crearRespuesta: unaPregunta respuesta: unString autor: unUsuario [
	^ unaPregunta agregarRespuesta: unString autor: unUsuario
]

{ #category : #'add/remove' }
CuOOra >> eliminarPregunta: unaPregunta [
	(preguntas
		includes:  unaPregunta)
		ifTrue: [ unaPregunta eliminarme.
			preguntas remove: unaPregunta ]
		ifFalse: [ ^ Error signal ]
]

{ #category : #initialization }
CuOOra >> initialize [ 
usuarios:= OrderedCollection new.
 preguntas:= OrderedCollection new.
 topicos:= OrderedCollection new.
^self
]

{ #category : #accessing }
CuOOra >> preguntas [
	^ preguntas
]

{ #category : #'adding item' }
CuOOra >> preguntasPorTopico: unTopico [
	^unTopico preguntas
]

{ #category : #'adding item' }
CuOOra >> preguntasRelevantes: unUsuario [
	| flatCollect |
	flatCollect := Set withAll: unUsuario preguntasRelevantes.
	flatCollect addAll: (self preguntasRelevantesSeguidos: unUsuario).
	^ flatCollect
]

{ #category : #'adding item' }
CuOOra >> preguntasRelevantesSeguidos: unUsuario [
^unUsuario seguidos
				flatCollect: [ :each | self preguntasUsuario: each ]
]

{ #category : #accessing }
CuOOra >> preguntasUsuario: unUsuario [

^preguntas select: [ :each | each autor = unUsuario  ]
]

{ #category : #'adding item' }
CuOOra >> registrarUsuario: unNombre contraseña: unaContraseña [
	(usuarios anySatisfy: [ :each | each nombre = unNombre ])
		ifTrue: [ ^ Error signal ]
		ifFalse:
			[ ^ usuarios add: (Usuario nombre: unNombre contraseña: unaContraseña) ]
]

{ #category : #accessing }
CuOOra >> respuestasUsuario: unUsuario [
	^ ((preguntas reject: [ :each | each autor = unUsuario ])
		flatCollect: [ :each | each respuestasUsuario: unUsuario ])
	
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #'as yet unclassified' }
CuOOra >> usuario: unNombre contraseña: unaContraseña [
	^ usuarios
		detect: [ :each | each nombre = unNombre & (each contraseña = unaContraseña) ]
		ifNone: [  nil ]
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]

{ #category : #'adding item' }
CuOOra >> valorarPublicacion: unaPublicacion usuario: unUsuario valor: unValor [
^unaPublicacion agregarValoracion: unUsuario  valor: unValor. 
]
