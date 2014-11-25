/*
 * 	Genome2D - 2D GPU Framework
 * 	http://www.genome2d.com
 *
 *	Copyright 2011-2014 Peter Stefcek. All rights reserved.
 *
 *	License:: ./doc/LICENSE.md (https://github.com/pshtif/Genome2D/blob/master/LICENSE.md)
 */
package com.genome2d.textures;

import com.genome2d.geom.GRectangle;
class GTextureFontAtlas extends GTextureAtlas
{
    public var lineHeight:Int = 0;
    public var g2d_kerning:Map<Int,Map<Int,Int>>;

    override public function getSubTexture(p_subId:String):GCharTexture {
        return cast g2d_textures.get(p_subId);
    }

    override public function addSubTexture(p_subId:String, p_region:GRectangle, p_frame:GRectangle):GCharTexture {
        var texture:GCharTexture = new GCharTexture(g2d_id+"_"+p_subId, g2d_nativeSourceType, g2d_nativeSource, p_region, g2d_format, false, 0, 0, g2d_scaleFactor, this);
        texture.g2d_subId = p_subId;
        texture.g2d_filteringType = g2d_filteringType;
        texture.g2d_nativeTexture = nativeTexture;

        g2d_textures.set(p_subId, texture);

        return texture;
    }

    public function getKerning(p_first:Int, p_second:Int):Int {
        if (g2d_kerning != null) {
            var map:Map<Int,Int> = g2d_kerning.get(p_first);
            if (map != null) {
                if (!map.exists(p_second)) {
                    return 0;
                } else {
                    return map.get(p_second);
                }
            }
        }

        return 0;
    }
}