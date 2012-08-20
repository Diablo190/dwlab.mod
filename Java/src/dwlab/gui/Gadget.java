package dwlab.gui;
import dwlab.controllers.ButtonAction;
import dwlab.sprites.Sprite;


/* Digital Wizard's Lab - game development framework
 * Copyright (C) 2012, Matt Merkulov 

 * All rights reserved. Use of this code is allowed under the
 * Artistic License 2.0 terms, as specified in the license.txt
 * file distributed with this code, or available from
// http://www.opensource.org/licenses/artistic-license-2.0.php







public double textSize = 0.5;

/**
 * Class for GUI gagdet for placing on window.
 */
public class Gadget extends Sprite {
	public final int horizontal = 0;
	public final int vertical = 1;
	public double textSize = textSize;



	/**
	 * Gadget initialization method.
	 * Called after loading window with this gadget.
	 */
	public void init() {
		if( parameterExists( "text_size" ) ) textSize == getParameter( "text_size" ).toDouble();
	}



	/**
	 * Button pressing event method.
	 * Called when button just being pressed on the gadget.
	 * 
	 * @see #onButtonUnpress, #onButtonDown, #onButtonUp, #onMouseOver, #onMouseOut
	 */
	public void onButtonPress( ButtonAction buttonAction ) {
	}



	/**
	 * Button unpressing event method
	 * Called when button just being unpressed on gadget.
	 * 
	 * @see #onButtonPress, #onButtonDown, #onButtonUp, #onMouseOver, #onMouseOut
	 */
	public void onButtonUnpress( ButtonAction buttonAction ) {
	}



	/**
	 * Button down event method.
	 * Called when button is currently pressed and cursor is over gadget.
	 * 
	 * @see #onButtonPress, #onButtonUnpress, #onButtonUp, #onMouseOver, #onMouseOut
	 */	
	public void onButtonDown( ButtonAction buttonAction ) {
	}



	/**
	 * Button up event method.
	 * Called when button is currently released and cursor is over gadget.
	 * 
	 * @see #onButtonPress, #onButtonUnpress, #onButtonUp, #onMouseOver, #onMouseOut
	 */	
	public void onButtonUp( ButtonAction buttonAction ) {
	}



	/**
	 * Mouse cursor entering gadget event method.
	 * Called when mouse is just entered gadget area.
	 * 
	 * @see #onButtonPress, #onButtonUnpress, #onButtonDown, #onButtonUp, #onMouseOut
	 */
	public void onMouseOver() {
	}



	/**
	 * Mouse cursor leaving gadget event method.
	 * Called when mouse is just left gadget area.
	 * 
	 * @see #onButtonPress, #onButtonUnpress, #onButtonDown, #onButtonUp, #onMouseOver
	 */
	public void onMouseOut() {
	}
}
