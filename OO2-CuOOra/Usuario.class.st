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
	#category : #'OO2-CuOOra'
}

{ #category : #'as yet unclassified' }
Usuario class >> nombre: unNombre contraseña: unaContraseña [
^(self new) nombre: unNombre contraseña: unaContraseña 
]

{ #category : #'as yet unclassified' }
Usuario >> nombre: unNombre contraseña: unaContraseña [ 
nombre:= unNombre.
contraseña := unaContraseña .
fechaYHora := DateAndTime now.
intereses:= OrderedCollection new.
^self
]
