Class {
	#name : #Respuesta,
	#superclass : #Publicacion,
	#instVars : [
		'descripcion',
		'valoraciones'
	],
	#category : #'OO2-CuOOra-Model'
}

{ #category : #'instance creation' }
Respuesta class >> new: unaDescripcion autor: unAutor [
^(self new) new: unaDescripcion autor: unAutor 
]

{ #category : #'as yet unclassified' }
Respuesta >> agregarValoracion: unUsuario valor: unValor [
"se indica el usuario que realiza
esa acción y debe saberse el momento en el que realizó la acción. Un usuario puede
realizar un solo like o un solo dislike para una pregunta o respuesta. Si un usuario dio like
a una pregunta o respuesta, y luego da un dislike, lo que debe suceder es que se elimina
el like anterior, y se agrega el dislike."
valoraciones detect: [ :each| each autor = unUsuario ] ifFound: [ :valoracion | valoraciones remove: valoracion].
^valoraciones add: ( Valoracion new: unValor autor: unUsuario )
]

{ #category : #accessing }
Respuesta >> calcularValoraciones [
	^ valoraciones sumNumbers: [ :each | each valor ].
]

{ #category : #accessing }
Respuesta >> descripcion [
	^ descripcion
]

{ #category : #'add/remove' }
Respuesta >> eliminarme [
	valoraciones removeAll.
	
]

{ #category : #'instance creation' }
Respuesta >> new: unaDescripcion autor: unAutor [
self new: unAutor. 
descripcion := unaDescripcion .
valoraciones := OrderedCollection new.
^self. 
]

{ #category : #accessing }
Respuesta >> valoraciones [
	^ valoraciones
]
