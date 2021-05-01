Class {
	#name : #RegistrarComponent,
	#superclass : #Accesso,
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #model }
RegistrarComponent >> registrarYLoguear [
	| elUsuario |
 elUsuario := self cuoora
				registrarUsuario: usuario
				contraseña: contraseña.
			self proceedWith: elUsuario and: self cuoora 
]

{ #category : #model }
RegistrarComponent >> renderButtonsOn: aCanvas [
	self renderRegistrarButtonOn: aCanvas.
	self renderVolverButtonOn: aCanvas
]

{ #category : #model }
RegistrarComponent >> renderInputElementsOn: aCanvas [

	super renderInputElementsOn: aCanvas
]

{ #category : #model }
RegistrarComponent >> renderRegistrarButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registrarYLoguear ];
		with: 'Registrar'
]

{ #category : #rendering }
RegistrarComponent >> renderVolverButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer  ];
				with: [ aCanvas button: 'Volver' ] ]
]
