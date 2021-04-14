Class {
	#name : #Valoracion,
	#superclass : #Publicacion,
	#instVars : [
		'valor'
	],
	#category : #'OO2-CuOOra-Model'
}

{ #category : #'instance creation' }
Valoracion class >> new: unValor autor: unUsuario [
^ self new new: unValor autor: unUsuario .
]

{ #category : #'changing state' }
Valoracion >> cambiarValoracion [
valor := valor *(-1)
]

{ #category : #'instance creation' }
Valoracion >> new: unValor autor: unUsuario [
self new: unUsuario.
valor:= unValor.
^self.
]

{ #category : #accessing }
Valoracion >> valor [
	^ valor
]
