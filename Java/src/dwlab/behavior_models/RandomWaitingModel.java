package dwlab.behavior_models;
import java.lang.Math;
import dwlab.shapes.Shape;


/* Digital Wizard's Lab - game development framework
 * Copyright (C) 2012, Matt Merkulov 

 * All rights reserved. Use of this code is allowed under the
 * Artistic License 2.0 terms, as specified in the license.txt
 * file distributed with this code, or available from
 * http://www.opensource.org/licenses/artistic-license-2.0.php\r\n */


/**
 * This model is for waiting random period of time in some interval.
 * Same as LTFixedWaitingModel, but you can specify interval in which time period will be selected.

 * @see #fixedWaitingModel, #lTBehaviorModel example.
 */
public class RandomWaitingModel extends TemporaryModel {
	public double timeFrom, double timeTo;

	public static RandomWaitingModel create( double timeFrom, double timeTo ) {
		RandomWaitingModel model = new RandomWaitingModel();
		model.timeFrom = timeFrom;
		model.timeTo = timeTo;
		return model;
	}

	public void init( Shape shape ) {
		super.init( shape );
		period = Math.random( timeFrom, timeTo );
	}
}
