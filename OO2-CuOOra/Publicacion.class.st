Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'fechaYHora',
		'autor'
	],
	#category : #'OO2-CuOOra-Model'
}

{ #category : #'instance creation' }
Publicacion class >> new: autor [
^(self new) new: autor
]

{ #category : #accessing }
Publicacion >> autor [
	^ autor
]

{ #category : #accessing }
Publicacion >> fechaYHora [
	^ fechaYHora
]

{ #category : #'instance creation' }
Publicacion >> new: unAutor [
autor:= unAutor .
fechaYHora := DateAndTime now.
^self.
]
