Class {
	#name : #Pregunta,
	#superclass : #Respuesta,
	#instVars : [
		'topicos',
		'respuestas'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #'instance creation' }
Pregunta class >> new: unaDescripcion autor: unAutor topicos: unosTopicos [
^(self new) new: unaDescripcion autor: unAutor topicos: unosTopicos 
]

{ #category : #'as yet unclassified' }
Pregunta >> eliminarme [
	respuestas do:[:each | each eliminarme ].
	topicos do: [ :each | each eliminarPregunta: self ].
	
]

{ #category : #'instance creation' }
Pregunta >> new: unaDescripcion autor: unAutor topicos: unosTopicos [
	self new: unaDescripcion autor: unAutor.
	topicos := unosTopicos.
	respuestas:= OrderedCollection new.
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
