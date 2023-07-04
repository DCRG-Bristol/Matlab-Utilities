# DCRG-Matlab-Utilities
A collection of smaller MATLAB functions for shared collaboration across researchers

The intention of this toolbox is to:
- create a space to share smaller matlab functions/packages between researchers
- encourage a more informal sharing of matlab functions between researchers

As such the toolbox has 3 main directories:
- within the top level folder all function appear on the matlab path for easy access. such common functions (like struct2csv) complement current MATLAB functions and have little chance of masking other functions.
 - the +dcrg namespace structure enables common functions to not 'bloat the MATLAB namespace, reducing the risk of 'function masking'. These function can be called like so `dcrg.signal.psd(X,Fs)` (which incidently is a function produce the power spectial density of an input X at a smapling frequency Fs - i.e. code i imagine everyone has there own varient of....)
 - the personal namespaces such as +fh. These just act as a convient place to store your own personal functions that you dont want to explicitly share with everyone else yet, but would like to access through your own code e.g. `fh.LoadRunNumber(1234)`

Many of the functions is this toolbox are currently just 'copy and pasted' from MATLAB's file exchange...

I'm not sure what this repository will turn into, and as such I've tried to make it as inviting and flexible as possible, so that people feel happy using/contributing to it. Adding examples for you additions would be great, as would unit test but they're not essential for now....

## Getting Started

- Either clone or download the repository
- add the folder tbx to the path or instal with the Matlab Pacakge Manager (mpm)
    - mpm install ads -u <INSTALL_DIR> --local -e --force

### Prerequisites

This product was developed in MATLAB 9.12 (2022a)

## Running Tests
 A basic testing framwork is supplied in this template to run all of the scripts
 located in the examples folder that begin with 'example'

 To run the tests, first ensure 'addsandbox' has been run then, type `runtests('TestExamples')` 
 in the MATLAB Command Prompt and press `<Enter>`.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/farg-bristol/Matran/tags). 

## Authors
* **fh9g12**