package js.html;

class Window extends EventTarget {
	public final document:Document = new Document();

	public function new() {}

	public function open(url:String = "", target:String = "", features:String = ""):Window {
		// noop
		return this;
	}

	public function requestAnimationFrame(callback:(float:Float)->Void):Int {
    // noop
    return null;
  }

}
