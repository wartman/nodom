import js.Browser;

class Run {

  static function main() {
    var el = Browser.document.createElement('div');
    el.setAttribute('id', 'root');
    el.appendChild(Browser.document.createTextNode('foo'));
    trace(el.toString());
  }

}
