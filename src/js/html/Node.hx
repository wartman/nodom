package js.html;

enum abstract NodeType(Int) from Int to Int {
  var ELEMENT_NODE = 1;
  var TEXT_NODE = 3;
  var CDATA_SECTION_NODE = 4;
  var PROCESSING_INSTRUCTION_NODE = 7;
  var COMMENT_NODE = 8; 
  var DOCUMENT_NODE = 9;
  var DOCUMENT_TYPE_NODE = 10;
  var DOCUMENT_FRAGMENT_NODE = 11;
}

class Node extends EventTarget {
  
  static public final ELEMENT_NODE = NodeType.ELEMENT_NODE;
  static public final TEXT_NODE = NodeType.TEXT_NODE;
  static public final CDATA_SECTION_NODE = NodeType.CDATA_SECTION_NODE;
  static public final PROCESSING_INSTRUCTION_NODE = NodeType.PROCESSING_INSTRUCTION_NODE;
  static public final COMMENT_NODE = NodeType.COMMENT_NODE; 
  static public final DOCUMENT_NODE = NodeType.DOCUMENT_NODE;
  static public final DOCUMENT_TYPE_NODE = NodeType.DOCUMENT_TYPE_NODE;
  static public final DOCUMENT_FRAGMENT_NODE = NodeType.DOCUMENT_FRAGMENT_NODE;

  public final nodeType:NodeType;
  public final nodeName:String;
  public final childNodes:Array<Node> = [];
  public var parentNode:Node;

  public function new(nodeType, nodeName) {
    this.nodeType = nodeType;
    this.nodeName = nodeName;
  }

  public var nextSibling(get, never):Node;
  function get_nextSibling():Node {
    if (parentNode != null) {
      return parentNode.childNodes[parentNode.childNodes.indexOf(this) + 1];
    }
    return null;
  }

  public var previousSibling(get, never):Node;
  function get_previousSibling():Node {
    if (parentNode != null) {
      return parentNode.childNodes[parentNode.childNodes.indexOf(this) - 1];
    }
    return null;
  }

  public var firstChild(get, never):Node;
  function get_firstChild() return childNodes[0];

  public var lastChild(get, never):Node;
  function get_lastChild() return childNodes[childNodes.length - 1];

  public function appendChild(child:Node) {
    insertBefore(child);
    return child;
  }

  public function insertBefore(child:Node, ?ref:Node) {
    child.remove();
    child.parentNode = this;
    if (ref != null) {
      // todo: throw error if childNodes does not contain ref?
      childNodes.insert(childNodes.indexOf(ref), child);
      return child;
    }
    childNodes.push(child);
    return child;
  }

  public function replaceChild(child:Node, ref:Node) {
    if (ref.parentNode == this) {
      insertBefore(child, ref);
      removeChild(ref);
      return ref;
    }
    return null;
  }

  public function removeChild(child:Node) {
    childNodes.remove(child);
  }

  public function remove() {
    if (parentNode != null) {
      parentNode.removeChild(this);
    }
  }

  override function dispatchEvent(event:Event) {
    var t = this;
    event.target = t;
    do {
      event.currentTarget = t;
      var handlers = t.eventHandlers.get(event.type.toLowerCase());
      if (handlers != null) for (handler in handlers) {
        handler(event); // note: this might not bind `this` right, but that's haxe's fault.
        if (event.end) event.defaultPrevented = true;
      } 
    } while (
      event.bubbles 
      && !(event.cancelable && event.stop) 
      && (t = t.parentNode) != null
    );
  }

  public function toString() {
    return '';
  }

}
