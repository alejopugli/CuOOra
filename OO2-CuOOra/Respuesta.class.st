Class {
	#name : #Respuesta,
	#superclass : #Publicacion,
	#instVars : [
		'descripcion',
		'valoraciones'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #'instance creation' }
Respuesta class >> new: unaDescripcion autor: unAutor [
^(self new) new: unaDescripcion autor: unAutor 
]

{ #category : #'as yet unclassified' }
Respuesta >> eliminarme [
	valoraciones removeAll.
	
]

{ #category : #'instance creation' }
Respuesta >> new: unaDescripcion autor: unAutor [
self new: unAutor. 
descripcion := unaDescripcion .
valoraciones := OrderedCollection new.
^self. 
]

{ #category : #accessing }
Respuesta >> valoraciones [
	^ valoraciones
]
