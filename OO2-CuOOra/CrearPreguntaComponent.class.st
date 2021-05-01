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

{ #category : #rendering }
CrearPreguntaComponent >> datoIncorrecto [ 
 self call: RenderDatoIncorrecto new
]

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
	self validarDatos
		ifTrue: [ self session cuoora
				crearPregunta: titulo
				descripcion: descripcion
				autor: self session usuario
				topicos: topicos.
			self answer ]
		ifFalse: [self datoIncorrecto ]
]

{ #category : #rendering }
CrearPreguntaComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Crear Pregunta'.
	aCanvas
		form: [ aCanvas label with: 'Titulo '.
			aCanvas textInput on: #titulo of: self.
			aCanvas break.
			aCanvas label with: 'Descripcion '.
			(aCanvas textArea on: #descripcion of: self)
				columns: 80;
				rows: 3.
			aCanvas break.
			aCanvas label with: 'topico/s '.
			self seleccionarTopico: aCanvas.
			aCanvas break.
			aCanvas submitButton
				callback: [ self publicar ];
				with: 'Publicar' ].
	self renderVolverButtonOn: aCanvas
]

{ #category : #rendering }
CrearPreguntaComponent >> renderVolverButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Volver' ] ]
]

{ #category : #rendering }
CrearPreguntaComponent >> seleccionarTopico: aCanvas [
	aCanvas textInput on: #topicos of: self; with:''.
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

topicos := OrderedCollection new.
	(anObject splitOn:',') do: [ :each | topicos add: (self session cuoora buscarTopico:  each) ]
]

{ #category : #rendering }
CrearPreguntaComponent >> validarDatos [
	titulo ='' ifTrue: [ ^ false ].
	descripcion = '' ifTrue: [ ^ false ].
	topicos ifNil: [ ^ false ].
	^ true
]
