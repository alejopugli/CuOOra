Class {
	#name : #CrearRespuestaComponent,
	#superclass : #WAComponent,
	#instVars : [
		'unPost',
		'descripcion'
	],
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #'instance creation' }
CrearRespuestaComponent class >> new: aPost [
^(self new) new: aPost
]

{ #category : #accessing }
CrearRespuestaComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
CrearRespuestaComponent >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #'instance creation' }
CrearRespuestaComponent >> new: aPost [
unPost := aPost.
^self
]

{ #category : #rendering }
CrearRespuestaComponent >> publicar [
	self session cuoora
		crearRespuesta: unPost
		respuesta: descripcion
		autor: self session usuario.
		self answer 
]

{ #category : #rendering }
CrearRespuestaComponent >> renderContentOn: aCanvas [
	aCanvas
		form: [ aCanvas heading with: 'Reponder '.
			aCanvas break.
			aCanvas label with: 'Descripcion '.
			(aCanvas textArea on: #descripcion of: self)
				columns: 80;
				rows: 3.
			aCanvas break.
			aCanvas submitButton
				callback: [ self publicar ];
				with: 'Publicar' ].
	self renderVolverButtonOn: aCanvas
]

{ #category : #rendering }
CrearRespuestaComponent >> renderVolverButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Volver' ] ]
]
