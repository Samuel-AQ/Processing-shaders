# Shader examples with Processing

## Description

This is an applicaton that allows you to see two different GLSL filters, one of a colorful rainbow that alternates its shadows and another of a simulation of a hourglass.

## How it works

In order to use the application you just have to run the main file. It will show you the title screen where you can start the application or see the controls that are:

* Press 'enter' to start the application from the title screen.
* Press 'H' to show the help information.
* Press 1 to see the rainbow shader.
* Press 2 to see the hourglass shader.

## Implementation decisions

This application has been developed according to the principles of Jakob Nielsen. It is easy to use, makes the user feels the control at every moment and uses a minimalist and simple design. It is not possible for the user to generate any programming error so it has not been necessary to control the user's movements. The controls are at hand at the beginning of the application in the title screeen so it is not possible for the user to get lost using the application.

## Development complications

* An attempt to make the help screen be callable at every moment was tried, but due to the shaders behaviour it was not possible because of the shader pixel modifications mades the helps screen looks unstable. As a solution, the help screen is only callable through the title screen when the shaders have not been run.

## Demonstration

* [Demonstration gif](https://github.com/Samuel-AQ/Processing-shaders/blob/master/Main/data/images/demonstration.gif?raw=true)

## References

* [Processing documentation](https://processing.org/reference/)
* [GLSL documentation](https://docs.gl/sl4/all)

## Other info

* Author: Samuel Arrocha Quevedo
* Version: 26/04/2021