Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion',
		'preguntas'
	],
	#category : #'OO2-CuOOra-Model'
}

{ #category : #'as yet unclassified' }
Topico class >> nombre: unNombre descripcion: unaDescripcion [ 
^(self new) nombre: unNombre descripcion: unaDescripcion 
]

{ #category : #'as yet unclassified' }
Topico >> agregarPregunta: unaPregunta [
preguntas add: unaPregunta .
]

{ #category : #accessing }
Topico >> descripcion [
	^ descripcion
]

{ #category : #'add/remove' }
Topico >> eliminarPregunta: unaPregunta [
 (preguntas includes: unaPregunta ) ifTrue: [ preguntas remove: unaPregunta  ] ifFalse: [ ^Error signal  ]
]

{ #category : #accessing }
Topico >> nombre [
	^ nombre
]

{ #category : #initialize }
Topico >> nombre: unNombre descripcion: unaDescripcion [
	nombre := unNombre.
	descripcion := unaDescripcion.
	preguntas := Set new.
	^ self
]

{ #category : #accessing }
Topico >> preguntas [
	^ preguntas
]
