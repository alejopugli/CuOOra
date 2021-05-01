Class {
	#name : #Respuesta,
	#superclass : #Publicacion,
	#category : #'OO2-CuOOra-Model'
}

{ #category : #'instance creation' }
Respuesta class >> descripcion: unaDescripcion autor: unAutor [
	^ self new descripcion: unaDescripcion autor: unAutor
]

{ #category : #calculations }
Respuesta >> calcularValor [
^ self calcularValoraciones + 50.
]

{ #category : #'instance creation' }
Respuesta >> descripcion: unaDescripcion autor: unAutor [
	super descripcion: unaDescripcion autor: unAutor.
	^self
]
