package com.genome2d.ui.skin;
import com.genome2d.proto.IGPrototypable;
import com.genome2d.textures.GContextTexture;
import com.genome2d.ui.GUISkinManager;
import com.genome2d.ui.GUISkinManager;
import com.genome2d.ui.GUISkinManager;
import com.genome2d.ui.GUISkinManager;
import com.genome2d.textures.GTexture;
import com.genome2d.error.GError;

@:access(com.genome2d.ui.GUISkinManager)
class GUISkin implements IGPrototypable {
    @prototype public var scale:Float = 1.0;

    private var g2d_type:Int;

    private function setValue(p_value:String):Void {}

    private var g2d_id:String;
    #if swc @:extern #end
    @prototype public var id(get, set):String;
    #if swc @:getter(id) #end
    inline private function get_id():String {
        return g2d_id;
    }
    #if swc @:setter(id) #end
    inline private function set_id(p_value:String):String {
        if (p_value != g2d_id && p_value.length>0) {
            if (GUISkinManager.getSkinById(p_value) != null) new GError("Duplicate style id: "+p_value);
            GUISkinManager.g2d_references.set(p_value,this);

            if (GUISkinManager.getSkinById(g2d_id) != null) GUISkinManager.g2d_references.remove(g2d_id);
            g2d_id = p_value;
        }

        return g2d_id;
    }

    public function getMinWidth():Float {
        return 0;
    }
    public function getMinHeight():Float {
        return 0;
    }

    static private var g2d_instanceCount:Int = 0;
    public function new(p_id:String = "") {
        g2d_instanceCount++;
        id = (p_id != "") ? p_id : "GUISkin"+g2d_instanceCount;
    }

    public function render(p_x:Float, p_y:Float, p_width:Float, p_height:Float):Void {
    }

    public function getTexture():GContextTexture {
        return null;
    }
}
