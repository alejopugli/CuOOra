Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'fechaYHora',
		'autor',
		'valoraciones',
		'descripcion'
	],
	#category : #'OO2-CuOOra-Model'
}

{ #category : #'instance creation' }
Publicacion class >> new: autor [
^(self new) new: autor
]

{ #category : #'add/remove' }
Publicacion >> agregarValoracion: unUsuario valor: unValor [
	"se indica el usuario que realiza
esa acción y debe saberse el momento en el que realizó la acción. Un usuario puede
realizar un solo like o un solo dislike para una pregunta o respuesta. Si un usuario dio like
a una pregunta o respuesta, y luego da un dislike, lo que debe suceder es que se elimina
el like anterior, y se agrega el dislike."

	valoraciones
		detect: [ :each | each autor = unUsuario ]
		ifFound: [ :valoracion | valoraciones remove: valoracion ].
	^ valoraciones add: (Valoracion valor: unValor autor: unUsuario)
]

{ #category : #accessing }
Publicacion >> autor [
	^ autor
]

{ #category : #calculations }
Publicacion >> calcularValoraciones [
	^ valoraciones sumNumbers: [ :each | each valor ].
]

{ #category : #accessing }
Publicacion >> descripcion [
	^ descripcion
]

{ #category : #'instance creation' }
Publicacion >> descripcion: unaDescripcion autor: unAutor [
	descripcion:= unaDescripcion .
	autor := unAutor.
	valoraciones := OrderedCollection new.
	fechaYHora := DateAndTime now.
	^ self
]

{ #category : #'add/remove' }
Publicacion >> eliminarme [
	valoraciones removeAll.
	
]

{ #category : #accessing }
Publicacion >> fechaYHora [
	^ fechaYHora
]

{ #category : #accessing }
Publicacion >> valoraciones [
	^ valoraciones
]
