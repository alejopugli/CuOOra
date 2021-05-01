Class {
	#name : #Valoracion,
	#superclass : #Object,
	#instVars : [
		'valor',
		'autor',
		'fechaYHora'
	],
	#category : #'OO2-CuOOra-Model'
}

{ #category : #'instance creation' }
Valoracion class >> valor: unValor autor: unUsuario [
	^ self new valor: unValor autor: unUsuario
]

{ #category : #accessing }
Valoracion >> autor [
	^ autor
]

{ #category : #'changing state' }
Valoracion >> cambiarValoracion [
valor := valor *(-1)
]

{ #category : #accessing }
Valoracion >> fechaYHora [
	^ fechaYHora
]

{ #category : #accessing }
Valoracion >> valor [
	^ valor
]

{ #category : #'instance creation' }
Valoracion >> valor: unValor autor: unUsuario [
	valor := unValor.
	autor := unUsuario.
	fechaYHora := DateAndTime  now.
	^ self
]
