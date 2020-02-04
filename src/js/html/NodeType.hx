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
