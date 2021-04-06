Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'preguntas',
		'topicos'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #'adding item' }
CuOOra >> agregarTopico: nombre descripcion: descripcion [
	usuarios
		detect: [ :each | each nombre = nombre ]
		ifFound: [ ^ Error signal ]
		ifNone: [ usuarios add: [ Topico nombre: nombre descripcion: descripcion  ] ].
	^ self
]

{ #category : #accessing }
CuOOra >> buscarUsuario: unNombre [
^usuarios select: [ :each | each nombre asLowercase includesSubstring: unNombre asLowercase ]
]

{ #category : #calculations }
CuOOra >> calcularPuntaje: unUsuario [
	| p r |
	p := preguntas select: [ :each | each autor = unUsuario ].
	r := [ (preguntas reject: p) respuestas
		select: [ :each | each autor = unUsuario ] ].
	^ p size * 20 + (r size * 50)
		+ (p sum: [ :each | each valoraciones valor ]) + (r
		sum: [ :each | each valoraciones valor ])
]

{ #category : #'adding item' }
CuOOra >> crearPregunta: unString descripcion: unaDescripcion autor: unUsuario topicos: unosTopicos [
	| pregunta |
	pregunta := Pregunta
		new: unString
		descripcion: unaDescripcion
		autor: unUsuario
		topicos: unosTopicos.
	preguntas add: [ pregunta ]
	.^pregunta.
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

{ #category : #'adding item' }
CuOOra >> preguntasPorTopico: unTopico [
	^unTopico preguntas
]

{ #category : #accessing }
CuOOra >> preguntasUsuario: unUsuario [

^preguntas select: [ :each | each autor = unUsuario  ]
]

{ #category : #'adding item' }
CuOOra >> registrarUsuario: nombre contraseña: contraseña [ 
usuarios detect: [ :each| each nombre = nombre ] ifFound: [ ^Error signal ]  ifNone: [ usuarios add: [ Usuario nombre: nombre contraseña: contraseña  ] ].
^self.
]
