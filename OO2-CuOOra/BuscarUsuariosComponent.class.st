Class {
	#name : #BuscarUsuariosComponent,
	#superclass : #WAComponent,
	#instVars : [
		'nombre'
	],
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #rendering }
BuscarUsuariosComponent >> buscar [
	^ (self session cuoora buscarUsuario: nombre)
		reject: [ :each | each = self session usuario ]
]

{ #category : #accessing }
BuscarUsuariosComponent >> nombre [
	^ nombre
]

{ #category : #accessing }
BuscarUsuariosComponent >> nombre: anObject [
	nombre := anObject
]

{ #category : #rendering }
BuscarUsuariosComponent >> renderBuscadorOn: aCanvas [
	aCanvas
		form: [ aCanvas label with: 'Nombre '.
			aCanvas textInput on: #nombre of: self.
			aCanvas submitButton
				callback: [ self ];
				with: 'Buscar' ]
]

{ #category : #rendering }
BuscarUsuariosComponent >> renderBuscarOn: aCanvas [
	aCanvas
		unorderedList: [ self buscar
				do: [ :each | 
					aCanvas anchor
						callback: [ self usuario: each ];
						with: each nombre.aCanvas break ].
			]
]

{ #category : #rendering }
BuscarUsuariosComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Perfil ' , self session usuario nombre.
	aCanvas horizontalRule.
	self renderBuscadorOn: aCanvas.
	aCanvas horizontalRule.
	self renderBuscarOn: aCanvas.
	aCanvas horizontalRule.
	self renderLogoutButtonOn: aCanvas
]

{ #category : #rendering }
BuscarUsuariosComponent >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Salir' ] ]
]

{ #category : #rendering }
BuscarUsuariosComponent >> usuario: unUsuario [
	self call: (RenderUsuarioComponent new: unUsuario)

	
]
