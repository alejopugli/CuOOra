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

{ #category : #calculations }
CuOOra >> calcularPuntaje: unUsuario [
	| p r pr |
	p := preguntas select: [ :each | each autor = unUsuario ].
	r := [ (preguntas reject: p) respuestas
		select: [ :each | each autor = unUsuario ] ].
	pr := p.
	pr addAll: r.
	^ (p size * 20 )+ (r size * 50) + pr
		sum: [ :each | each valoraciones valor ]
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

{ #category : #'adding item' }
CuOOra >> registrarUsuario: nombre contraseña: contraseña [ 
usuarios detect: [ :each| each nombre = nombre ] ifFound: [ ^Error signal ]  ifNone: [ usuarios add: [ Usuario nombre: nombre contraseña: contraseña  ] ].
^self.
]
