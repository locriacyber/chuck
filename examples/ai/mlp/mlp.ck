//---------------------------------------------------------------------
// name: mlp.ck
// desc: training a basic artificial neural network
//
// version: need chuck version 1.4.2.1 or higher
// sorting: part of ChAI (ChucK for AI)
//
// uncomment for MLP API:
// MLP.help();
//
// author: Yikai Li
//         Ge Wang (https://ccrma.stanford.edu/~ge/)
// date: Winter 2023
//---------------------------------------------------------------------

// instantiate a multi-layer perception
MLP mlp;

// units per layer: input, [hidden layer(s)], output 
[3, 5, 2] @=> int unitsPerLayer[];
// initialize with the units per layer
mlp.init( unitsPerLayer );
// (ALTERNATE #1) change activation function; default is AI.Sigmoid
// mlp.init( unitsPerLayer, AI.ReLU );
// (ALTERNATE #2) specify activation function per layer
// [AI.ReLU, AI.Tanh, AI.Softmax] @=> int activationPerLayer[];
// (ALTERNATE #2) initialize with activation function per layer
// mlp.init( unitsPerLayer, activationPerLayer );

// input observations
[[0.1, 0.2, 0.3], [0.4, 0.5, 0.6]] @=> float X[][];
// output observations
[[0.1, 0.2], [0.3, 0.4]] @=> float Y[][];
// learning rate
0.001 => float learningRate;
// number of epochs
100 => int epochs;
// train the network
mlp.train( X, Y, learningRate, epochs );
// ALTERNATE: train with default learning_rate=0.001, epochs=100
// mlp.train(X, Y);

// predict given a new input
[0.7, 0.8, 0.9] @=> float x[];
// array to how output
float y[2];
// predict output given input
mlp.predict(x, y);
// print the output
<<< y[0], y[1] >>>;
