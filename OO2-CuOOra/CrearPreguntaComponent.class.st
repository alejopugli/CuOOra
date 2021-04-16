Class {
	#name : #CrearPreguntaComponent,
	#superclass : #WAComponent,
	#instVars : [
		'descripcion',
		'titulo',
		'topicos'
	],
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #accessing }
CrearPreguntaComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
CrearPreguntaComponent >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #rendering }
CrearPreguntaComponent >> publicar [
	self session cuoora
		crearPregunta: titulo
		descripcion: descripcion
		autor: self session usuario
		topicos: topicos
	.self answer 
]

{ #category : #rendering }
CrearPreguntaComponent >> renderContentOn: aCanvas [
	aCanvas
		form: [ aCanvas label with: 'Titulo '.
			aCanvas textInput on: #titulo of: self.
			aCanvas break.
			aCanvas label with: 'Descripcion '.
			(aCanvas textArea on: #descripcion of: self)
				columns: 80;
				rows: 3.
			aCanvas break.
			aCanvas label with: 'Topicos (separados por comas) '.
			aCanvas textInput on: #topicos of: self.
			aCanvas break.
			aCanvas submitButton
				callback: [ self publicar ];
				with: 'Publicar' ]
]

{ #category : #accessing }
CrearPreguntaComponent >> titulo [
	^ titulo
]

{ #category : #accessing }
CrearPreguntaComponent >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
CrearPreguntaComponent >> topicos [
	^ topicos
]

{ #category : #accessing }
CrearPreguntaComponent >> topicos: anObject [
	anObject splitOn: ','.
	topicos := anObject
]
