Class {
	#name : #RenderDatoIncorrecto,
	#superclass : #WAComponent,
	#category : #'OO2-CuOOra-Ui'
}

{ #category : #rendering }
RenderDatoIncorrecto >> renderContentOn: aCanvas [
	aCanvas heading: 'Algun dato ingresado es incorrecto'.
	aCanvas
		heading
		with: 'Por favor vuelva a ingresar los datos de forma correcta';
		level2.
	aCanvas button
		callback: self answer;
		with: 'Volver'
]
