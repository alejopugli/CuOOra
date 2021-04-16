"
| application |
application := WAAdmin register: LogInComponent asApplicationAt: 'cuoora'.
application sessionClass: SessionWithUsuario.
"
Class {
	#name : #LogInComponent,
	#superclass : #Accesso,
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #model }
LogInComponent >> login [
	(self cuoora usuario: usuario contraseña: contraseña)
		ifNotNil: [ :it | self proceedWith: it and: self cuoora  ].
	usuario := nil.
	contraseña := nil
]

{ #category : #model }
LogInComponent >> registrarNuevoUsuario [
	self call: (RegistrarComponent new)
]

{ #category : #model }
LogInComponent >> renderButtonsOn: aCanvas [
	self renderIniciarSessionButtonOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas paragraph: 'Registrate'.
	self renderRegistrarseButtonOn: aCanvas
]

{ #category : #model }
LogInComponent >> renderIniciarSessionButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self login ];
		with: 'Ingresar'
]

{ #category : #model }
LogInComponent >> renderRegistrarseButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registrarNuevoUsuario ];
		with: 'Registrarse'
]
