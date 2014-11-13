bar = require '../coffee/bar.coffee'
$ = require 'jquery'

suite 'mochaのテスト', ->
  setup ->
    document.body.innerHTML = __html__['test/fixture/test.html'];

  teardown ->
    document.body.innerHTML = ''

  test '1 + 1は2になること', ->
    assert.ok '1 + 1', '2'
    assert.ok bar(), 'hoge'
    assert.ok $('#my-fixture').html(), 'DOMのテスト'
