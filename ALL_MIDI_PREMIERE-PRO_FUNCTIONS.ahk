#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
/*
THINGS TO WORK ON -- 

- One button press sends two inputs, one for press, one for release. Need to make it only one
- For sliders/dials: Add an invert option for when the S button corresponding to the dial is pressed, it inverts the slider so when 
pulled down, it sends up and vise versa


LIST OF FUCNTIONS --

- Scale - Slider 1 & Fine Tune Dial 1
- Exposure - Slider 2 & Fine Tune Dial 2
- Saturation - Slider 3
- Contrast - Dial 3
- Color Temperature - Dial 4
- Color Tint - Slider 4
- Rotation - TO BE ASSIGNED <- most likely dial
- Shadows - TO BE ASSIGNED
- Highlights - TO BE ASSIGNED
- 
*/


#SingleInstance Force
#include Midi_Library.ahk

midi := new Midi()
midi.OpenMidiIn(0)

Return


;------------------------
;-------Functions--------
;------------------------

/* Example CC Script
MidiControlChange1:
	cc := midi.MidiIn()
	ccValue := cc.value
	MsgBox You set the mod wheel to %ccValue%
	Return
*/
/*
;-------Buttons--------

;Play Reverse -- pressing again will double speed
MidiControlChange43:
	send, j ; 
	return

;Play Forward -- pressing again will double speed
MidiControlChange44:
	send, l ; 
	return

;Stop playing and move to in point/beginning of timeline
MidiControlChange42:
	send, {Space}
	sleep 5
	send, +i
	return

;Step Left
MidiControlChange41:
	send, {left}
	return
	
;Step Right
MidiControlChange45:
	send, {right}
	return
	
;Set Marker
MidiControlChange60:
	send, m
	return

;Go to Previous Marker
MidiControlChange61:
	send, ^+m
	return

;Go to Next Marker
MidiControlChange62:
	send, +m
	return

;Go to Previous Edit Point
MidiControlChange58:
	send, {up}
	return
	
;Go to Next Edit Point	
MidiControlChange59:
	send, {down}
	return
*/	
;---------------	
;-----Scale-----
;---------------

;Slider
MidiControlChange0:
	if(winActive("Adobe Premiere Pro")){
		send, +3
		send, +5
		sleep, 20
		send, {tab}{tab}{tab}{tab}
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}{down}{down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}{up}{up}
		}
		previousSliderAValue := ccValue	
	}
	else{
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}{down}{down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}{up}{up}
		}
		previousSliderAValue := ccValue	
	}
	return

;Fine Tune Dial
MidiControlChange16:
	if(winActive("Adobe Premiere Pro")){
		send, +3
		send, +5
		sleep, 20
		send, {tab}{tab}{tab}{tab}
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}
		}
		previousSliderAValue := ccValue	
	}
	else{
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}
		}
		previousSliderAValue := ccValue	
	}
	return
	

;------------------
;-----Exposure-----
;------------------

;Slider
MidiControlChange1:
	if(winActive("Adobe Premiere Pro")){
		send, +3
		send, +{F1}
		sleep, 20
		send, {tab}{tab}{tab}{tab}{tab}{tab}
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, ^{down}^{down}^{down}
		}
		if(previousSliderAValue < ccValue){
			send, ^{up}^{up}^{up}
		}
		previousSliderAValue := ccValue	
	}
	else{
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, ^{down}^{down}^{down}
		}
		if(previousSliderAValue < ccValue){
			send, ^{up}^{up}^{up}
		}
		previousSliderAValue := ccValue	
	}
	return

;Fine Tune Dial
MidiControlChange17:
	if(winActive("Adobe Premiere Pro")){
		send, +3
		send, +{F1}
		sleep, 20
		send, {tab}{tab}{tab}{tab}{tab}{tab}
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, ^{down}
		}
		if(previousSliderAValue < ccValue){
			send, ^{up}
		}
		previousSliderAValue := ccValue	
	}
	else{
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, ^{down}
		}
		if(previousSliderAValue < ccValue){
			send, ^{up}
		}
		previousSliderAValue := ccValue	
	}
	return

;----------------------------------
;------Saturation and Contrast-----
;----------------------------------

;Slider -- Saturation
MidiControlChange2:
	if(winActive("Adobe Premiere Pro")){
		send, +3
		send, +{F1}
		sleep, 20
		send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}{down}{down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}{up}{up}
		}
		previousSliderAValue := ccValue	
	}
	else{
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}{down}{down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}{up}{up}
		}
		previousSliderAValue := ccValue	
	}
	return

;Dial -- Contrast
MidiControlChange18:
	if(winActive("Adobe Premiere Pro")){
		send, +3
		send, +{F1}
		sleep, 20
		send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}{down}{down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}{up}{up}
		}
		previousSliderAValue := ccValue	
	}
	else{
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}{down}{down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}{up}{up}
		}
		previousSliderAValue := ccValue	
	}
	return
	
;------------------------------
;-----Temperature and Tint-----
;------------------------------

;Slider -- Color Tint
MidiControlChange3:
	if(winActive("Adobe Premiere Pro")){
		send, +3
		send, +{F1}
		sleep, 20
		send, {tab}{tab}{tab}{tab}{tab}
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}
		}
		previousSliderAValue := ccValue	
	}
	else{
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}
		}
		previousSliderAValue := ccValue	
	}
	return

;Dial -- Color Temperature
MidiControlChange19:
	if(winActive("Adobe Premiere Pro")){
		send, +3
		send, +{F1}
		sleep, 20
		send, {tab}{tab}{tab}{tab}
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}{down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}{up}
		}
		previousSliderAValue := ccValue	
	}
	else{
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}{down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}{up}
		}
		previousSliderAValue := ccValue	
	}
	return

;------------------------
;-----Shadows/Blacks-----
;------------------------

;Slider
MidiControlChange20:
if(winActive("Adobe Premiere Pro")){
		send, +3
		send, +{F1}
		sleep, 20
		send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab
		sleep, 20
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}{down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}{up}
		}
		previousSliderAValue := ccValue	
	}
	else{
		cc := midi.MidiIn()
		ccValue := cc.value
		if(previousSliderAValue > ccValue){
			send, {down}{down}
		}
		if(previousSliderAValue < ccValue){
			send, {up}{up}
		}
		previousSliderAValue := ccValue	
	}
	return