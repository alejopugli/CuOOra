Class {
	#name : #Valoracion,
	#superclass : #Publicacion,
	#instVars : [
		'valor'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #'instance creation' }
Valoracion class >> new: unValor [
^(self new) new:unValor
]

{ #category : #'changing state' }
Valoracion >> cambiarValoracion [
valor := valor *(-1)
]

{ #category : #'instance creation' }
Valoracion >> new: unValor [ 
valor:= unValor.
fechaYHora := DateAndTime now.
^self.
]

{ #category : #'instance creation' }
Valoracion >> new: unValor autor: unUsuario [
self new: unUsuario.
valor:= unValor.
^self.
]
