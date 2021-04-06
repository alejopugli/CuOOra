Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'fechaYHora',
		'autor'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #'instance creation' }
Publicacion class >> new: autor [
^(self new) new: autor
]

{ #category : #accessing }
Publicacion >> autor [
	^ autor
]

{ #category : #'instance creation' }
Publicacion >> new: unAutor [
autor:= unAutor .
fechaYHora := DateAndTime now.
^self.
]
