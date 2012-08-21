package dwlab.layers;
import dwlab.base.XMLObject;
import dwlab.sprites.Camera;


/* Digital Wizard's Lab - game development framework
 * Copyright (C) 2012, Matt Merkulov 

 * All rights reserved. Use of this code is allowed under the
 * Artistic License 2.0 terms, as specified in the license.txt
 * file distributed with this code, or available from
 * http://www.opensource.org/licenses/artistic-license-2.0.php */




/**
 * World is the root layer which can be created in the editor and loaded from file.

 */
public class World extends Layer {
	public Camera camera;



	/**
	 * Loads a world from file.
	 * @return Loaded world.
	 * @see #parallax example
	 */
	public static World fromFile( String filename ) {
		return World( loadFromFile( filename ) );
	}



	public void xMLIO( XMLObject xMLObject ) {
		super.xMLIO( xMLObject );

		if( editorData ) {
			editorData = EditorData( xMLObject.manageObjectField( "editor_data", editorData ) );
			if( xMLObject.fieldExists( "images" ) ) {
				xMLObject.manageIntAttribute( "incbin", editorData.incbinValue );
				xMLObject.manageListField( "images", editorData.images );
				xMLObject.manageListField( "tilesets", editorData.tilesets );
			}
		}

		camera = Camera( xMLObject.manageObjectField( "camera", camera ) );
	}
}
