"
I am a class that executes the tasks,
"
Class {
	#name : #TaskEventBehavior,
	#superclass : #ActivityEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
TaskEventBehavior >> performExecution: elemToExecute executor: wave [ 
	| aFuture tktElem |
	super performExecution: elemToExecute  executor: wave. 
	tktElem := wave returnTKT: elemToExecute.
	aFuture := wave worker future: [ 1 second wait. tktElem value ].
	aFuture onSuccessDo: [ :v |  v logCr. wave taskResult: v. wave tryToExecuteNext: elemToExecute ].
	aFuture onFailureDo: [ :v | 'failed' logCr. v logCr. ]
]
