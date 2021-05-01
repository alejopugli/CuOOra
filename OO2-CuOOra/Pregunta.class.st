Class {
	#name : #Pregunta,
	#superclass : #Publicacion,
	#instVars : [
		'topicos',
		'respuestas',
		'titulo'
	],
	#category : #'OO2-CuOOra-Model'
}

{ #category : #'instance creation' }
Pregunta class >> titulo: unTitulo descripcion: unaDescripcion autor: unAutor topicos: unosTopicos [
	^ self new
		titulo: unTitulo
		descripcion: unaDescripcion
		autor: unAutor
		topicos: unosTopicos
]

{ #category : #'adding item' }
Pregunta >> agregarRespuesta: unString autor: unUsuario [
	^ respuestas add: (Respuesta descripcion: unString autor: unUsuario)
]

{ #category : #calculations }
Pregunta >> calcularValor [ 
^self calcularValoraciones + 20.
]

{ #category : #'add/remove' }
Pregunta >> eliminarme [
	super.
	respuestas do: [ :each | each eliminarme ].
	respuestas removeAll.
	topicos do: [ :each | each eliminarPregunta: self ]
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas
		asSortedCollection: [ :uno :dos | uno calcularValoraciones > dos calcularValoraciones ]
]

{ #category : #accessing }
Pregunta >> respuestasUsuario: unUsuario [
	^ respuestas select: [ :each | each autor = unUsuario ]
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]

{ #category : #'instance creation' }
Pregunta >> titulo: unTitulo descripcion: unaDescripcion autor: unAutor topicos: unosTopicos [
	self descripcion: unaDescripcion autor: unAutor.
	titulo := unTitulo.
	topicos := unosTopicos.
	respuestas := OrderedCollection new.
	^ self
]

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos
]
