"
| application |
application := WAAdmin register: LogInComponent asApplicationAt: 'cuoora'.
application sessionClass: SessionWithUsuario.
"
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
CuOOra >> agregarPregunta: pregunta [
	preguntas add: pregunta.
]

{ #category : #'adding item' }
CuOOra >> agregarTopico: nombre descripcion: descripcion [
	(topicos anySatisfy: [ :each | each nombre = nombre ])
		ifTrue: [ ^ Error signal ]
		ifFalse: [ ^ topicos add: (Topico nombre: nombre descripcion: descripcion) ]
]

{ #category : #rendering }
CuOOra >> buscarTopico: unNombre [
	^topicos detect: [ :each | each nombre = unNombre ]
]

{ #category : #accessing }
CuOOra >> buscarUsuario: unNombre [
	unNombre
		ifNil: [ ^ OrderedCollection new ]
		ifNotNil: [ ^ usuarios
				select:
					[ :each | each nombre asLowercase includesSubstring: unNombre asLowercase ] ]
]

{ #category : #calculations }
CuOOra >> calcularPuntaje: unUsuario [
	| p r |
	p := self preguntasUsuario: unUsuario.
	r := self respuestasUsuario: unUsuario.
	^(p sumNumbers: [ :each | each calcularValor ])
		+(r sumNumbers: [ :each | each calcularValor ])
]

{ #category : #'adding item' }
CuOOra >> crearPregunta: unString descripcion: unaDescripcion autor: unUsuario topicos: unosTopicos [
	| pregunta |
	pregunta := Pregunta
		titulo: unString
		descripcion: unaDescripcion
		autor: unUsuario
		topicos: unosTopicos.
	unosTopicos do: [ :each | each agregarPregunta: pregunta ].
	self agregarPregunta: pregunta.
	^ pregunta
]

{ #category : #'adding item' }
CuOOra >> crearRespuesta: unaPregunta respuesta: unString autor: unUsuario [
	^ unaPregunta agregarRespuesta: unString autor: unUsuario
]

{ #category : #'add/remove' }
CuOOra >> eliminarPregunta: unaPregunta [
	(preguntas includes: unaPregunta)
		ifTrue: [ unaPregunta eliminarme.
			preguntas remove: unaPregunta ]
		ifFalse: [ ^ Error signal ]
]

{ #category : #initialization }
CuOOra >> initialize [
	usuarios := OrderedCollection new.
	preguntas := OrderedCollection new.
	topicos := OrderedCollection new.
	self setUp.
	^ self
]

{ #category : #accessing }
CuOOra >> preguntas [
	^ preguntas
]

{ #category : #'adding item' }
CuOOra >> preguntasPorTopico: unTopico [
	^ unTopico preguntas
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
	^ (preguntas select: [ :each | each autor = unUsuario ])
]

{ #category : #'adding item' }
CuOOra >> registrarUsuario: unNombre contraseña: unaContraseña [
	(self validarNombre: unNombre Contraseña: unaContraseña )
		ifTrue:
			[ ^ usuarios add: (Usuario nombre: unNombre contraseña: unaContraseña) ]
		ifFalse: [ ^ Error signal ]
]

{ #category : #accessing }
CuOOra >> respuestasUsuario: unUsuario [
	^ ((preguntas reject: [ :each | each autor = unUsuario ])
		flatCollect: [ :each | each respuestasUsuario: unUsuario ])
]

{ #category : #initialization }
CuOOra >> setUp [
	| juan pedro diego topics preguntaPedro preguntaDiego |
	topics := OrderedCollection
		with: (self agregarTopico: 'OO1' descripcion: 'Orientacion a objetos 1').
	topics
		add: (self agregarTopico: 'Test de unidad' descripcion: 'Unit Testing').
	topics add: (self agregarTopico: 'Smalltalk' descripcion: '.st').
	pedro := self
		registrarUsuario: 'pedro@cuoora.com'
		contraseña: 'pedro@cuoora.com'.
	diego := self
		registrarUsuario: 'diego@cuoora.com'
		contraseña: 'diego@cuoora.com'.
	juan := self
		registrarUsuario: 'juan@cuoora.com'
		contraseña: 'juan@cuoora.com'.
	juan followUsuario: diego.
	pedro followUsuario: juan.
	preguntaPedro := self
		crearPregunta: '¿Para qué sirve el método SetUp?'
		descripcion: ''
		autor: pedro
		topicos: (topicos first: 2).
	preguntaDiego := self
		crearPregunta: '¿Qué significa #messageNotUnderstood?'
		descripcion: ''
		autor: diego
		topicos: (topicos last: 2).
	self crearRespuesta: preguntaPedro  respuesta:'Sirve para instanciar los objetos que son
evaluados por el test en un único método y que se ejecute
siempre antes de cada test.'  autor: diego.
	self crearRespuesta: preguntaDiego  respuesta:'no encontró ningún método para ejecutar en respuesta. respuesta:  autor:'  autor: pedro. 
	^ self
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #'adding item' }
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
CuOOra >> validarNombre: unNombre Contraseña: unaContraseña [
	^ (usuarios anySatisfy: [ :each | each nombre = unNombre ]) not
]

{ #category : #'adding item' }
CuOOra >> valorarPublicacion: unaPublicacion usuario: unUsuario valor: unValor [
^unaPublicacion agregarValoracion: unUsuario  valor: unValor. 
]
