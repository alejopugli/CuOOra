Class {
	#name : #Pregunta,
	#superclass : #Respuesta,
	#instVars : [
		'topicos',
		'respuestas',
		'titulo'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #'instance creation' }
Pregunta class >> new: unTitulo descripcion: unaDescripcion autor: unAutor topicos: unosTopicos [
	^ self new new: unTitulo descripcion: unaDescripcion autor: unAutor topicos: unosTopicos
]

{ #category : #'adding item' }
Pregunta >> agregarRespuesta: unString autor: unUsuario [
	|respuesta|
	respuesta:=Respuesta new: unString autor: unUsuario.
	respuestas add: respuesta.
	^respuesta 
]

{ #category : #'add/remove' }
Pregunta >> eliminarme [
	respuestas do:[:each | each eliminarme ].
	topicos do: [ :each | each eliminarPregunta: self ].
	
]

{ #category : #'instance creation' }
Pregunta >> new: unTitulo descripcion: unaDescripcion autor: unAutor topicos: unosTopicos [
	self new: unaDescripcion autor: unAutor.
	titulo:= unTitulo .
	topicos := unosTopicos.
	respuestas := OrderedCollection new.
	^ self
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas
]

{ #category : #accessing }
Pregunta >> respuestas: anObject [
	respuestas := anObject
]

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos
]
