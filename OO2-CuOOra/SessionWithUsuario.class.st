Class {
	#name : #SessionWithUsuario,
	#superclass : #WASession,
	#instVars : [
		'usuario',
		'cuoora'
	],
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #accessing }
SessionWithUsuario >> cuoora [
	^ cuoora
]

{ #category : #accessing }
SessionWithUsuario >> cuoora: anObject [
	cuoora := anObject
]

{ #category : #accessing }
SessionWithUsuario >> usuario [
	^ usuario
]

{ #category : #accessing }
SessionWithUsuario >> usuario: anObject [
	usuario := anObject
]
