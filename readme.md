NoDom
=====

A simple DOM shim for node environments.

Usage
-----

Simply use `-lib nodom` in your HXML and you'll be able to use (some of) the DOM anywhere!

Note that you CAN use this in non-js environments if you set the following in your hxml:

```hxml
--macro allowPackage('js')
```

HOWEVER: be *extremely* careful with this, as you'll be able to use externs for classes that won't actually exist.
