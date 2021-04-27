Class {
	#name : #Pregunta,
	#superclass : #Respuesta,
	#instVars : [
		'topicos',
		'respuestas',
		'titulo'
	],
	#category : #'OO2-CuOOra-Model'
}

{ #category : #'instance creation' }
Pregunta class >> new: unTitulo descripcion: unaDescripcion autor: unAutor topicos: unosTopicos [
	^ self new new: unTitulo descripcion: unaDescripcion autor: unAutor topicos: unosTopicos
]

{ #category : #'adding item' }
Pregunta >> agregarRespuesta: unString autor: unUsuario [
	^ respuestas add: (Respuesta new: unString autor: unUsuario )
]

{ #category : #'add/remove' }
Pregunta >> eliminarme [
	respuestas do: [ :each | each eliminarme ].
	respuestas removeAll.
	topicos do: [ :each | each eliminarPregunta: self ]
]

{ #category : #'instance creation' }
Pregunta >> new: unTitulo descripcion: unaDescripcion autor: unAutor topicos: unosTopicos [
	self new: unaDescripcion autor: unAutor.
	titulo := unTitulo.
	self topicos: unosTopicos .
	respuestas := OrderedCollection new.
	^ self
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas
]

{ #category : #accessing }
Pregunta >> respuestasUsuario: unUsuario [
	^ respuestas select: [ :each | each autor = unUsuario ]
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos
]

{ #category : #accessing }
Pregunta >> topicos: unosTopicos [
	topicos := unosTopicos isCollection
		ifTrue: [ OrderedCollection withAll: unosTopicos ]
		ifFalse: [ OrderedCollection with: unosTopicos ]
]
