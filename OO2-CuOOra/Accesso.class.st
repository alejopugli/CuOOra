Class {
	#name : #Accesso,
	#superclass : #WAComponent,
	#instVars : [
		'usuario',
		'contraseña'
	],
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #accessing }
Accesso >> contraseña [
	^ contraseña
]

{ #category : #accessing }
Accesso >> contraseña: anObject [
	contraseña := anObject
]

{ #category : #model }
Accesso >> cuoora [
	^ CuOOra soleInstance
]

{ #category : #private }
Accesso >> proceedWith: aUser and: aModel [
	self session usuario: aUser.
	self session cuoora: aModel.
	self call: InicioComponent new
]

{ #category : #model }
Accesso >> renderButtonsOn: aCanvas [
	self subclassResponsibility
]

{ #category : #model }
Accesso >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'.aCanvas
		form: [ self renderInputElementsOn: aCanvas.
			self renderButtonsOn: aCanvas ]
]

{ #category : #model }
Accesso >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Usuario'.
	aCanvas paragraph: [ aCanvas textInput on: #usuario of: self ].
	aCanvas label: 'Contraseña'.
	aCanvas paragraph: [ aCanvas passwordInput on: #contraseña of: self ]
]

{ #category : #accessing }
Accesso >> usuario [
	^ usuario
]

{ #category : #accessing }
Accesso >> usuario: anObject [
	usuario := anObject
]
