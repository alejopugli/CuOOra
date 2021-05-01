Class {
	#name : #CrearTopicoComponent,
	#superclass : #WAComponent,
	#instVars : [
		'descripcion',
		'nombre'
	],
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #creating }
CrearTopicoComponent >> crear [
	self validar ifTrue: 
	[self session usuario
		agregarInteres: (self session cuoora agregarTopico: nombre descripcion: descripcion).
	self answer]
ifFalse:[self datosIncorrectos
]
]

{ #category : #rendering }
CrearTopicoComponent >> datoIncorrecto [
	self call: RenderDatoIncorrecto new
]

{ #category : #accessing }
CrearTopicoComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
CrearTopicoComponent >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #accessing }
CrearTopicoComponent >> nombre [
	^ nombre
]

{ #category : #accessing }
CrearTopicoComponent >> nombre: anObject [
	nombre := anObject
]

{ #category : #rendering }
CrearTopicoComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Bienvenido ' , self session usuario nombre.
	aCanvas horizontalRule.
	self topicoForm: aCanvas
]

{ #category : #rendering }
CrearTopicoComponent >> topicoForm: aCanvas [
	aCanvas
		form: [ aCanvas label with: 'Nombre '.
			aCanvas textInput on: #nombre of: self.
			aCanvas break.
			aCanvas label with: 'Descripcion '.
			(aCanvas textArea on: #descripcion of: self)
				columns: 80;
				rows: 3 .
	aCanvas break.
	aCanvas submitButton
		callback: [ self crear ];
		with: 'Crear Topico']
]

{ #category : #creating }
CrearTopicoComponent >> validar [
	nombre ~= '' ifFalse:[^false].
	descripcion ~='' ifFalse:[^false].^true
]
