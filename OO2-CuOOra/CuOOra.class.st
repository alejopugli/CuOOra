Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'preguntas',
		'topicos'
	],
	#category : #'OO2-CuOOra-Model'
}

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
	^ preguntas
		add: (Pregunta
				new: unString
				descripcion: unaDescripcion
				autor: unUsuario
				topicos: unosTopicos) 
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

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]

{ #category : #'adding item' }
CuOOra >> valorarPublicacion: unaPublicacion usuario: unUsuario valor: unValor [
^unaPublicacion agregarValoracion: unUsuario  valor: unValor. 
]
