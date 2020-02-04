package js.html;

class Document extends Element {
  
  public final documentElement:Node = new Element(ELEMENT_NODE, 'html');
  public final body:Node = new Element(ELEMENT_NODE, 'body');
  public final head:Node = new Element(ELEMENT_NODE, 'head');

  public function new() {
    super(DOCUMENT_NODE, '#document');
    appendChild(documentElement);
    documentElement.appendChild(head);
    documentElement.appendChild(body);
  }

  public function createElement(tag:String) {
    return new Element(ELEMENT_NODE, tag.toUpperCase());
  }

  public function createElementNS(ns:String, tag:String) {
    var el = createElement(tag);
    el.namespace = ns;
    return el;
  }

  public function createComment(?data:String) {
    return new Comment(data);
  }

  public function createDocumentFragment() {
    return new DocumentFragment();
  }

  public function createTextNode(text:String) {
    return new Text(text);
  }

}