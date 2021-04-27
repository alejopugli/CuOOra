Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'intereses',
		'seguidos',
		'nombre',
		'contraseña',
		'fechaYHora'
	],
	#category : #'OO2-CuOOra-Model'
}

{ #category : #'as yet unclassified' }
Usuario class >> nombre: unNombre contraseña: unaContraseña [
^(self new) nombre: unNombre contraseña: unaContraseña 
]

{ #category : #'adding item' }
Usuario >> agregarInteres: unInteres [
intereses add: unInteres .
]

{ #category : #accessing }
Usuario >> contraseña [
	^ contraseña
]

{ #category : #accessing }
Usuario >> fechaYHora [
	^ fechaYHora
]

{ #category : #'adding item' }
Usuario >> followUsuario: unUsuario [
	(seguidos includes: unUsuario)
		ifTrue: [ ^ Error signal ]
		ifFalse: [ ^seguidos add: ( unUsuario ) ]
]

{ #category : #accessing }
Usuario >> intereses [
	^ intereses
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre
]

{ #category : #initalize }
Usuario >> nombre: unNombre contraseña: unaContraseña [
	nombre := unNombre.
	contraseña := unaContraseña.
	fechaYHora := DateAndTime now.
	intereses := OrderedCollection new.
	seguidos := OrderedCollection new.
	^ self
]

{ #category : #sear }
Usuario >> preguntasRelevantes [

	^ self intereses flatCollectAsSet: [ :each | each preguntas ]
]

{ #category : #accessing }
Usuario >> seguidos [
	^ seguidos
]
